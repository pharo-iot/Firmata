i2c
read8BitsAt: aRegister
	firmata i2cRead: address count: 1  register: aRegister .
	readDelay wait.
	^(firmata i2cReadAnswer: address) at: 2 "a byteArray is returned, but the first byte is the registerr number"