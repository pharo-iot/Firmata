writing
writeBytesAt: aRegister data: aByteArray

	| packet |
	packet := aRegister asByteArray , aByteArray.
	firmata i2cWriteTo: address data: packet.
	readDelay wait.