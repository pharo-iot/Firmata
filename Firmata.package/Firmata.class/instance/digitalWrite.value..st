digital pins
digitalWrite: pin value: value 
	"Sends an On or Off message to an individual Digital Pin"
	| portNumber adjustment digitalWriteBuffer |
	portNumber := (pin bitShift: -3)
				bitAnd: 15.
	adjustment := 1
				bitShift: (pin bitAnd: 7).
	digitalWriteBuffer := ByteArray new: 3 withAll: 0.
	value = 0
		ifTrue: [digitalOutputData
				at: portNumber + 1
				put: ((digitalOutputData at: portNumber + 1)
						bitAnd: adjustment bitInvert)]
		ifFalse: [digitalOutputData
				at: portNumber + 1
				put: ((digitalOutputData at: portNumber + 1)
						bitOr: adjustment)].
	digitalWriteBuffer
		at: 1
		put: (FirmataConstants digitalMessage bitOr: portNumber);
		at: 2
		put: ((digitalOutputData at: portNumber + 1)
				bitAnd: 127);
		at: 3
		put: ((digitalOutputData at: portNumber + 1)
				bitShift: -7).
	self port nextPutAll: digitalWriteBuffer