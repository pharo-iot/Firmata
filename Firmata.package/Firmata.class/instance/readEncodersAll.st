encoder
readEncodersAll
	"request positions of all encoders"
	| request |
	request := (ByteArray new: 4).
	request
		at: 1 put: FirmataConstants startSysex ;
		at: 2 put: FirmataConstants encoderData ;
		at: 3 put: 2 ; "ENCODER_REPORT_POSITION"
		at: 4 put: FirmataConstants endSysex.

	self port nextPutAll: request