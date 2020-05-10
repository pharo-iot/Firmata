other commands
setSamplingInterval: millis
	"set the sampling interval to millis milliseconds. Cannot be less than 19
	This controls the reporting frequency and "
	| request |
	request := ByteArray with: FirmataConstants startSysex
								with: FirmataConstants samplingInterval
								with: (millis rounded bitAnd: 16r7F)
								with: (( millis rounded bitShift: -7) bitAnd: 16r7F)
								with: FirmataConstants endSysex.
	self port nextPutAll: request