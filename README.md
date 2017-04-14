# Pharo Firmata

Firmata implementation for the Pharo Programming Language.

## Installation

The code of the library is so far hosted in Smalltalkhub, in the following url:

http://smalltalkhub.com/#!/~Guille/Firmata

As soon as Iceberg (the pharo-git library) is ready for the latest release and 64 bits, the code will be moved to this repository.

To load latest version of Firmata, you can evaluate the following expression in your playground:

```smalltalk
Gofer it
    smalltalkhubUser: 'Guille' project: 'Firmata';
    package: 'Firmata';
    load.
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

## Writing to Digital Pins

