i2c
i2cReadContinous: anI2Caddress count: aNumber register: aRegister
	| request1 request2 |
	request1 := ByteArray with: FirmataConstants startSysex
								with: FirmataConstants i2cRequest
								with: (anI2Caddress bitAnd: 16r7F)
								with: 2r00010000 "continuous read"
								with: (aRegister bitAnd: 16r7F)
								with: (aRegister bitShift: -7).
	request2 := ByteArray with: (aNumber bitAnd: 16r7F)
								with: ((aNumber bitShift: -7) bitAnd: 16r7F)
								with: FirmataConstants endSysex .
	self port nextPutAll: request1.
	self port nextPutAll: request2