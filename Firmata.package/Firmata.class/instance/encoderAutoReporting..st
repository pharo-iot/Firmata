encoder
encoderAutoReporting: aBoolean
	"enable/disable auto reporting (at sample interval!)"
	| request |
	request := (ByteArray new: 4)
		at: 1 put: FirmataConstants startSysex ;
		at: 2 put: FirmataConstants encoderData ;
		at: 3 put: aBoolean asBit;
		at: 4 put: FirmataConstants endSysex ;
		yourself.
	self port nextPutAll: request
	