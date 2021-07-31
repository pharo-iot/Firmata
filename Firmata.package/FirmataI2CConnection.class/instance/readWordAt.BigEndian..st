i2c
readWordAt: aRegister BigEndian: bool
	"if BigEndian is true, the first byte read is the high byte"
	| answer |
	firmata i2cRead: address count: 2  register: aRegister .
	readDelay wait.
	answer := firmata i2cReadAnswer: address .
	bool ifTrue: [ ^( answer at: 2) * 256 + (answer at: 3)].
	^(answer at: 3) * 256 + (answer at: 2)