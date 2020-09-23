i2c
read16BitsAt: aRegister
	| answer |
	firmata i2cRead: address count: 2  register: aRegister .
	readDelay wait.
	answer := firmata i2cReadAnswer: address .
	^(answer at: 3) * 256 + (answer at: 2)