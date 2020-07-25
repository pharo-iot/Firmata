encoder
zeroEncoder: encoderNumber
	"reset encoder to 0	"
			
	| request |
	request := ByteArray  with: FirmataConstants startSysex 
								with: FirmataConstants encoderData 
								with: 3  "encoder_reset_position"
								with: encoderNumber
								with: FirmataConstants endSysex .
	self port nextPutAll:  request 