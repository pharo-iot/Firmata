as yet unclassified
queryAnalogMapping
	"sends the analog mapping query"
	|request |
	request := ByteArray with: FirmataConstants startSysex
								with: FirmataConstants analogMappingQuery
								with: FirmataConstants endSysex.
	self port nextPutAll: request