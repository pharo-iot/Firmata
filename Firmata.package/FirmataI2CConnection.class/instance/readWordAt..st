accessing
readWordAt: aRegister
	"default read low byte first"
	^self readWordAt: aRegister bigEndian: false