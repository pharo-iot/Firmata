i2c
writeWordAt: aRegister data: aWord
	"default write low  byte first"
	self writeWordAt: aRegister data: aWord  BigEndian: false
