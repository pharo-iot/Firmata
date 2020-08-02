digital pins
pin: pin mode: mode
"Sends an individual Pin Mode message"
	self assert: ((self firmataPin: pin)  capableOfMode: mode)
		description: 'Mode ', mode printString, ' not available for pin: ', pin printString.
self port nextPutAll: (ByteArray with: FirmataConstants setPinMode with: pin with: mode).