# Pharo Firmata

Firmata implementation for the Pharo Programming Language.

## Installation

The code of the library is so far hosted in Smalltalkhub, in the following url:

http://smalltalkhub.com/#!/~Guille/Firmata

As soon as Iceberg (the pharo-git library) is ready for the latest release and 64 bits, the code will be moved to this repository.

To load latest version of Firmata, you can evaluate the following expression in your playground:

```smalltalk
Metacello new
  baseline: 'Firmata';
  repository: 'github://pharo-iot/Firmata';
  load
```

## Connecting to your device

To connect to your firmatata enable device, you need the following things:
- know the device's port name
- know its baud rate
- install firmata in it (you can do it using your arduino IDE)

We have tested this library so far with Arduino Uno and Funduino Uno. In our example, our Arduino boards use a baud rate of 57600, and were detected by our operating system in the /dev/ttyACM0 port. Connecting the Firmata client to arduino is as easy as follows:

```smalltalk
firmata := Firmata onPort: '/dev/ttyACM0' baudRate: 57600.
```

Connecting to an arduino will check that the port exists, and will verify that Arduino has installed a compatible version of Firmata. In case one of these conditions does not hold, an exception is thrown.

Once we are connected, we can ask the Firmata driver if it is connected or not.

```smalltalk
firmata isConnected.
   => true
```

And finally, we can disconnect it by doing:

```smalltalk
firmata disconnect.
```

## Digital Pins

Digital pins are pins whose state is either **on** or **off**. These states are represented by the binary values 1 and 0.

Digital pins work either in read or write mode. In other words, we can use them to obtain a digital value (for example, if a button is pressed or not), or to set a value (set if a led is turned on or off) but not both at the same time.

### Writing to Digital Pins

To write to a digital pin, you should first set it to output mode using the `#digitalPin:mode:` message. The first argument of the message is the number of the pin, and the second is a numeric value representing the output mode value. We use the `FirmataConstants` class that encapsulates many of the different numeric values used by firmata. In the following example, we set the digital pin 13 in output mode, so we can write to it.

```smalltalk
firmata digitalPin: 13 mode: FirmataConstants pinModeOutput.
```

We can then write to a digital port with the `#digitalWrite:value:` message, giving the pin number as first argument, and the value to write (0 or 1) as second argument. Thus, to turn on the pin 13 we can do:

```smalltalk
firmata digitalWrite: 13 value: 1.
```

And to turn it off:

```smalltalk
firmata digitalWrite: 13 value: 0.
```

### Reading from Digital Pins

To read from a digital pin, you should first set it to input mode using the `#digitalPin:mode:` message. The first argument of the message is the number of the pin, and the second is a numeric value representing the input mode value. We use the `FirmataConstants` class that encapsulates many of the different numeric values used by firmata.

In the following example, we first setup a push down button with a pull-down resistor.
We connect the button output to digital pin 2.
When we push the button and Firmata should tell us that the value of pin 2 is 1. When we do not push it, its value should be 0.

![Pull-down Resistor Button Sketch](https://www.arduino.cc/en/uploads/Tutorial/button.png)

First, we set the digital pin 2 in input mode, so we can read from it.

```smalltalk
firmata digitalPin: 2 mode: FirmataConstants pinModeInput.
```

Then, we can read the value of the pin using the `#digitalRead:` message.

```smalltalk
firmata digitalRead: 2.
```
If we ask the value and press the button at the same time, we get the value 1.

## Analog Pins

Analog pins are pins whose state range in the continuum between 0 and 1. These states are represented as floating point numbers.

As with digital pins, analog pins work both in read and write mode. Typical usages of reading analog pins is retrieving data from sensors, such as temperature, humidity, light and so on. Writing analog pins can be used to, for example, turn on leds with a given intensity instead of just "turning on" like we do with the digital pins.

### Activating Analog Pins

```smalltalk
firmata activateAnalogPin: 0.
```

### Reading from Analog Pins

```smalltalk
((firmata analogRead: 0) * 500 / 1024) asFloat.
```
