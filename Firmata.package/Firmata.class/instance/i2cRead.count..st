i2c
i2cRead: anI2Caddress count: aNumber
	| request |
	request := ByteArray new: 7.
	request
		at: 1 put: FirmataConstants startSysex;
		at: 2 put: FirmataConstants i2cRequest;
		at: 3 put: (anI2Caddress bitAnd: 16r7F);
		at: 4 put: 2r00001000; "single read"
		at: 5 put: (aNumber bitAnd: 16r7F);
		at: 6 put: ((aNumber bitShift: -7) bitAnd: 16r7F);
		at: 7 put: FirmataConstants endSysex .
	self port nextPutAll: request.