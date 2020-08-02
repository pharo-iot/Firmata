i2c
i2cConfigWithDelay: microseconds
	| message |
	message := ByteArray with: FirmataConstants startSysex
									with: FirmataConstants i2cConfig
									with: (microseconds bitAnd:  16r7F)
									with: ((microseconds bitShift: -7) bitAnd: 16r7F)
									with: FirmataConstants endSysex.
	self port nextPutAll: message