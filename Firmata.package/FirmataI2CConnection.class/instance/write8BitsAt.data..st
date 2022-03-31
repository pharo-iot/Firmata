i2c
write8BitsAt: aRegister data: aByte
	firmata i2cWriteTo:  address data: (ByteArray with: aRegister with: (aByte bitAnd: 16rFF)).
	readDelay wait. "To be sure the write takes effect"
