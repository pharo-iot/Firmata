encoder
readEncoder: number 
	| request |
	request := ByteArray with: FirmataConstants encoderData
								with: 1  "encoder_repot_position"
								with: number.
	self fullSysex: request