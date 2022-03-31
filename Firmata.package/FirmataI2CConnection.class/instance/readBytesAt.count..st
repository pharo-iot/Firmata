accessing
readBytesAt: aRegister count: aNumber
	| answer |
	firmata i2cRead: address count: aNumber register: aRegister.
	readDelay wait.
	answer := firmata i2cReadAnswer: address.
	^answer allButFirst