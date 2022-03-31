i2c
write16BitsAt: aRegister data: aWord
	firmata i2cWriteTo:  address 
			data: (ByteArray with: aRegister with: (aWord bitAnd: 16rFF) with: (aWord // 256)).
	readDelay wait. "To be sure the write takes effect"
