# Pharo Firmata API


## Introduction

Firmata consists of two parts:
1. A protocol for serial communication between a host (in our case a Pharo image) and an Arduino-type micro-controller (that we will call Arduino from here on);
2. A program (sketch) running on the Arduino. This can be Standard Firmata. But also a specialized version with only the functionalities needed (see Configurable Firmata (https://github.com/firmata/ConfigurableFirmata ))

This software concerns controlling an Arduino from Pharo through a serial port (or USB, or Bluetooth).

### Basic concepts.

The communication protocol is asynchronous. A command from the host initiates action on the Arduino side, but the response is returned asynchronously. The Firmata package listens for answers and stores the results internally, so the user can retrieve them at will. In some cases Firmata will **announce** the availability of data. The user program can subscribe to these announcements.

Changes in digital inputs are immediately transmitted to the host. Other input (e.g. analog or from I2C devices) are sampled at a certain rate and then reported. By default the sampling interval is 19 ms, but this can be increased.

### Threads
Because we don’t want to lose data from the Arduino, reading the serial port is done in a separate thread that runs at priority lowIOPriority (60). It is in this thread that announcement originate, but because processing these may take too much time, announcements are made from another thread, at priority userInterruptPriority (50).

### Thread-safety

In principle Firmata is not thread-safe. The user will have to implement his own locking. We ensure however that command sequences (sysex commands) sent to the Arduino will not be intermixed. So, as long as different threads use different parts of the protocol (e.g. analog in, i2c, servo) there should be no problem. Internally, access to the stored data is protected with a Mutex.

### Pitfalls

Before starting Firmata, the Arduino has to have been freshly initialized. It should not be active on it's serial output port (see LEDs). Also make sure to enter the correct baud rate (default 57600, but can be changed in the sketch).

All pins are numbered starting at 0!

## The API

### Initialisation

``` smalltalk
arduino := Firmata onPort: ’COM3’ baudRate: 57600.
```

Of course you can also use a Unix device name. *From now on, we will use `arduino` to stand for a Firmata instance.*

During initialization, instance variables are set, but also three calls to the Arduino are performed:

1. ```self queryVersion```  to request the version of the sketch and implicitly test the connection;
2. ```self queryCapabilities``` to enumerate all pins (including analog) and list all modes each pin is capable of.
3. ```self queryAnalogMapping``` to determine which pin numbers are associated with analog inputs (note that these pins can also be used for other purposes).

The instance ```arduino``` now contains a collection of ```FirmataPin```’s. Each pin has, among others, a list of capabilities showing the possible modes and, if applicable, the resolution in bits. All modes are encoded in the class ```FirmataConstants```.

### General methods for a Firmata instance

```version``` returns the version of the Firmata sketch on the Arduino.  
```allPins``` returns the total number of pins.  
```setSamplingInterval: millisecond``` sets the sampling interval to milliseconds.  
```reset``` reset the Firmata sketch on the Arduino.  
```disconnect``` disconnects from the Arduino, closes the communication port.  
`queryFirmware` queries the name of the sketch, to be retrieved with: `arduino firmwareName` 

#### Announcements

At present two announcements are implemented:

- `FirmataPinChange` this it triggered when a digital input pin changes state. It has the methods `#pinNr`and`#pinValue`to indicate which pin changed and to what value.
- `FirmataStepperFinished` which signals the completion of a (legacy) stepper move, with the method `#stepperNr` indicating which stepper finished moving.

You subscribe to an announcement with:
`subscription := arduino when: AnAnnouncementClass do: aBlock`or
`subscription := arduino when: AnAnnounceentClass send: aSelector to: anObject`

You can cancel a subscription with:
`arduino removeSubscription: aSubscription`

### General methods at the pin level

Pin modes (or functions) have codes that are retrieved by class side methods on `FirmataConstants`., e.g. 
`FirmataConstants pinModePwm >> 3`  the code to set a pin to PWM output (if allowed). Usage:
`arduino pin: 3 mode: FirmataConstants pinModePwm`.

For I2C, servo,  encoder and stepper, you usually don't set the pin mode directly but you use some initialization method.

A Firmata instance contains an instance of `FirmataPin` for each pin found by the capability request. A copy (so you cannot modify it!) is requested by:
`arduino firmataPin: pinNumber`. Here pinNumber is the Arduino pin number. Interesting properties of a `FirmataPin` are:
	`id` returns the Arduino pin number;
	`pinValue` returns the acquired value (for digital in and analog in)
	`state`  returns  what Firmata *thinks* is the output value;
	`mode`  the current mode the pin is in;
	`analogPinNumber`  returns the analog pin number if applicable (eg. on an Uno pin 19 is analog pin 5);
	`capableOfMode: aPinMode`  true if the pin is capable to perform that function.

`arduino queryPinState: aPinNumber`  refreshes `state` and `mode`  for the pin specified. This should becalled prior to examining `state`and `mode` in the corresponding `FirmataPin`.

### Digital Output

When the Firmata sketch starts, digital output is the default for digital pins. You can set the mode with:
`arduino pin: aPinNumber mode: FirmataConstants pinModeOutput`

The original Firmata writes a full byte to 8 consecutive pins, called a port. The port number is simply the pin number integer divided by 8. Internally this is handled by remembering the state of all pins in the port and just flipping the correct bit. The command is:

`arduino digitalWrite: aPinNumber value: oneOrZero` 

In version 2.5 of the Firmata protocol directly writing to one digital pin was added:	
`arduino directDigitalWrite: aPinNumber value: oneOrZero`

### Digital Input

The mode is set by:
`arduino pin: aPinNumber mode: FirmataConstants pinModeInput`

This is not enough! The sketch must also be told to report changes to the pin. In fact, reporting is turned on and off on a *port* basis, so pins 0..7 or 8..15 etc.. The command is:
`arduino digitalPortReport: aPortNumber onOff: oneOrZero`

Changes are reported as soon as they occur, independent of the sampling interval. You can read the latest value with:
`digitalRead: aPinNumber`
or you can look in the corresponding `FirmataPin`.

The change also triggers an *announcement*: `FirmataPinChanged`that has the methods `pinNr` for the number of the pin and `pinValue` for the pin value.

As an example: to report a pin change to the Transcript:	
`arduino when: FirmataPinChanged do: [ :ann | ('pin ', ann pinNr, ' changed to ', ann pinValue) traceCr].`

### Analog Output / PWM

PWM (Pulse Width Modulation) is not available on all pins. Check
`arduino pinsWithMode: FirmataConstants pinModePwm`

The mode is set by
`arduino pin: aPWMCapablePinNumer mode: FirmataConstants pinModePwm`

To set a PWM output to a certain value:
`arduino analogWrite: aPinNumber value: aNumber`

This calls on `#extendedAnalogWrite:value:` if the pin number is greater than 15. You  should also use this when the value is more than 14 bits.

The range of the value to be sent is often 8 bits (0..255). You should check this with:
`(arduino firmataPin: aPinNumber ) resolution`

*ToDo: implement #analogWrite:percentageValue: that takes resolution into account*

### Analog Input

Analog inputs are activated on an individual basis; once activated their value is sent to the Firmata instance each sample interval. To activate:
`arduino activateAnalogPin: analogPinNumber`

To deactivate:
`arduino deactivateAnalogPin: analogPinNumber`

The most recent value can be read with:
`arduino analogRead: analogPinNumber`

### Servo

In principle servo output is a kind of PWM, with a minimum pulse width for one extreme and a maximum width for the other extreme (or, for continuous rotation servo's: maximum counterclockwise speed to maximum clockwise speed). A servo is initialized with the default values of the Arduino servo library by:
`arduino pin: aPinNumber mode: FirmataConstants pinModeServo`

If you want to specify other values for minimum and maximum pulse width you use:
`arduino servoConfig: aPinNumber minPulse: minimum maxPulse: maximum`

Common values are minimum = 544 and maximum = 2400.

To control the servo you use the `analogWrite` command with a value between 0 and 180:

To detach the servo and free the pin for other uses set it to another mode.

### Encoder

Firmata supports up to 5 rotary or linear encoders, numbered 0 to 4.

To activate an encode:
`arduino attachEncoder: encoderNumber pinA: aPinNumber1 pinB: aPinNumber2`

For best performance the pins should be interrupt capable.

To detach the encoder:
`arduino detachEncoder: encoderNumber`

To read an encoder you first send:
`arduino readEncoder: encoderNumber`  and retrieve the answer with
`arduino readAnswerOfEncoder: encoderNumber` 

You can also read all encoders at once:
`arduino readEncodersAll` 
and retrieve the results individually.

### (Legacy) Stepper

The sketch supports up to six steppers (0 .. 5). This version supports acceleration and deacceleration, but does not support the grouping of steppers to synchronize their motion. In principle this version is deprecated in favor of AccelStepper.

A stepper motor is initialized with:
`arduino stepperConfig: devNumber delay: museconds interface: code stepsPerRev: number pins: aByteArray`
Meaning of the parameters:	
	`devNumber` - the number used for this stepper (0..5)
	`museconds`- 0 for 1 microsecond delay, 1 for 2 microseconds delay between steps
	`code` - a code for the interface (1 = step+direction driver, 2 = two-wire, 4 = four-wire)
	`number`- number of steps per revolution
	aByteArray - a ByteArray with 2 or 4 pin numbers.

The stepper is moved with:
`arduino stepperStep: stepperNo steps: numberOfSteps speed: speed`
where `stepperNo` is the stepper number, `numberOfSteps` is the number of steps (negative is counterclockwise) and `speed` is the speed in 0.01 rad/sec.

Optionally you can also specify an acceleration and deceleration (in 0.01 rad/sec^2):
`arduino stepperStep: stepperNo steps: numberOfSteps speed: speed  accel: accelValue decel: decelValue`

When a move is completed, this is announced with:	
`FirmataStepperFinished`
which has the method `stepperNr` to return the stepper number.

### AccelStepper

to be done

### I2C

Firmata knows which pins to use. You can check with:
`arduino pinsWithMode: FirmataConstants pinModeI2C`

The I2C functionality is initialized by:
`arduino i2cConfig`

Some devices need a small delay between writing a register and retrieving the data; in that case use:
`arduino i2cConfigWithDelay: NumberOfMicroseconds`

Devices on the I2C bus are distinguished by the I2C address. Usually this is 7 bits; 10 bits addresses are not supported.

Reading a device specifies the number of byte to read and, optionally, the register that most be set first. You can also initiate continues reading: the devices is than read every sample interval. The methods are:
`i2cRead: anI2Caddress count: aNumber `
`i2cRead: anI2Caddress count: aNumber register: aRegister`
`i2cReadContinous: anI2Caddress count: aNumber`
`i2cReadContinous: anI2Caddress count: aNumber register: aRegister`

The result of the read operation is a ByteArray that will be returned by:
`arduino i2cReadAnswer: anI2CAddress`

Note that the first byte of the result is the register number.

To stop continuous reading:
`arduino i2cStopReading: anI2CAddress`

A ByteArray can be written to the device with
`arduino i2cWriteTo: anI2CAddress data: aByteArray`
If a register is needed this must be the first byte of `anByteArray`.

#### FirmataI2CConnection

To make it easier to use the I2C capabilities you can use the class ```FirmataI2CConnection```, that is compatible with equivalent classes in the WiringPi, PiGPio and Picod drivers. You would have an instance of ```FirmataI2CConnection``` for each device on the I2C bus, identified by its bus address.

You start with:

```smalltalk
i2cDevice := arduino openI2C: 16r67.  "open device with address 16r67"
```

Examples of usage:

```smalltalk
value := i2cDevice read8BitsAt: 5. "read a byte from register 5"
i2cDevice writeWordAt: 5 data: 16ra0c5. "Write value to register 5, lower byte (16rc5) first"
i2cDevice writeWordAt: 5 data: 16ra0c5 bigEndian: true. "the same but now the high order byte is sent first"
i2cDevice writeByte: 4. "Simply write 4, without register, for a device like the PCF8574 8-bits port extender"
```

### One-Wire

to be done




