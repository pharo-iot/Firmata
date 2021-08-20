other commands
queryCapabilities
	"sends the capabilities query"
	|request |
	request := ByteArray with: FirmataConstants startSysex
								with: FirmataConstants capabilityQuery
								with: FirmataConstants endSysex.
	self port nextPutAll: request