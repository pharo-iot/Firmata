i2c
i2cWriteTo: anI2CAddress data: bytes
	"Write a variable number of bytes to a i2c device at address anI2CAdress
	"

	| buffer request |
	buffer := self to7Bits: bytes.
	request := ByteArray
		with: FirmataConstants i2cRequest
		with: (anI2CAddress bitAnd: 16r7F)
		with: 0.
	self port
		nextPutAll: request , buffer;
		nextPutAll: FirmataConstants endSysex asByteArray