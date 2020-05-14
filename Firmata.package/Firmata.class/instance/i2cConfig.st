i2c
i2cConfig
	"start i2c on the standard pins. It makes sense op update capability query afterwards"
	
self port nextPutAll: (ByteArray with: FirmataConstants startSysex
										with: FirmataConstants i2cConfig
										with: FirmataConstants endSysex)
