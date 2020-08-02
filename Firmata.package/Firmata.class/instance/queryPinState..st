other commands
queryPinState: pinNumber
	"query the pin state for pin 0-127"
	|packet |
	self assert: (pinNumber < self maxPins) description: 'pin number out of range'.
	packet := ByteArray with: FirmataConstants startSysex 
							with: FirmataConstants pinStateQuery 
							with: (pinNumber bitAnd: 16r7F)
							with: FirmataConstants endSysex .
	self port nextPutAll: packet