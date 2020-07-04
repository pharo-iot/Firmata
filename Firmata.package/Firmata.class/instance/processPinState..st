sysex processing
processPinState: data
	"answer to pin state request. Update corresponding pin in allPins, 
	do nothing when allPins has not been initialized"	
		|	targetPin |
	allPins ifNil: [ ^nil ].
	targetPin := allPins at: ((data at: 1) + 1) .
	targetPin mode: (data at: 2).
	targetPin state: (data at: 3).