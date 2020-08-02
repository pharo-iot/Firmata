encoder
readEncoder: number 
	| request |
	request := ByteArray with: FirmataConstants startSysex 
								with: FirmataConstants encoderData
								with: 1  "encoder_repot_position"
								with: number
								with: FirmataConstants endSysex .
	self port nextPutAll: request