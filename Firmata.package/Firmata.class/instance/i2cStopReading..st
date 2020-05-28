i2c
i2cStopReading: address 
	"stop continuous reading on the specified address"
	| request |
	request := ByteArray with: FirmataConstants startSysex 
								with: FirmataConstants i2cRequest 
								with: (address bitAnd: 16r7F)
								with: 2r00011000 "stop reading"
								with: FirmataConstants endSysex .
	self port nextPutAll: request
