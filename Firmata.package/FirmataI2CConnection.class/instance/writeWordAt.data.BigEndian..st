i2c
writeWordAt: aRegister data: aWord BigEndian: bool
	"if bool is true write the high byte first"
	| packet |
	bool ifTrue: [ packet := ByteArray with: aRegister with: (aWord // 256) with: (aWord bitAnd: 16rFF) ]
		ifFalse: [ packet := ByteArray with: aRegister with: (aWord bitAnd: 16rFF) with: (aWord // 256) ].

	firmata i2cWriteTo:  address data: packet 
	readDelay wait. "To be sure the write takes effect"
