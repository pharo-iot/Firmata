encoder
detachEncoder: encoderNumber
	| request |
	request := (ByteArray new: 4)
		at: 1 put: FirmataConstants startSysex ;
		at: 2 put: FirmataConstants encoderData ;
		at: 3 put: 5 ; "ENCODER_DETEACH"
		at: 4 put: FirmataConstants endSysex ;
		yourself.
	self port nextPutAll: request