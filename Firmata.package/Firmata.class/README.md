I am an implementation of the Firmata protocol for talking to an Arduino board. 
For more information check: http://www.firmata.org/

This implementation is mostly based on FirmataVB by Andrew Craigie.
http://www.acraigie.com/programming/firmatavb/default.html

firmata := Firmata new
	connectOnPort: '/dev/ttyACM0'
	baudRate: 57600.
	
firmata isConnected.
firmata digitalPin: 13 mode: FirmataConstants pinModeOutput.

firmata digitalWrite: 13 value: 1.
1 second wait.
firmata digitalWrite: 13 value: 0.
1 second wait.
firmata digitalWrite: 13 value: 1.
1 second wait.
firmata digitalWrite: 13 value: 0.
1 second wait.
firmata digitalWrite: 13 value: 1.

firmata disconnect.
