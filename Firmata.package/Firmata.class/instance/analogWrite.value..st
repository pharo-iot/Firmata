digital pins
analogWrite: pin value: value 
	"Sends a PWM value to a digital pin. 0 - 255"
	| analogWriteBuffer |
	analogWriteBuffer := ByteArray new: 3 withAll: 0.
	analogWriteBuffer
		at: 1
		put: (FirmataConstants analogMessage
				bitOr: (pin bitAnd: 15));
		
		at: 2
		put: (value rounded bitAnd: 127);
		
		at: 3
		put: ((value rounded bitShift: -7)
				bitAnd: 127).
self port  nextPutAll: analogWriteBuffer