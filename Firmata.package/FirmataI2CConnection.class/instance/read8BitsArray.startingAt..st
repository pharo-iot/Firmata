accessing
read8BitsArray: blockSize startingAt: reg
	"this is copied from WiringPi; I think Firmata is smarter"
"	| result bits |
	result := ByteArray new: blockSize.
	
	1 to: blockSize do: [ :i | 
		bits := self read8BitsAt: reg + i - 1.
		result at: i put: bits].
	
	^result"
	| answer |
	firmata i2cRead: address count: blockSize register: reg.
	readDelay wait.
	answer := firmata i2cReadAnswer: address.
	^answer allButFirst
	