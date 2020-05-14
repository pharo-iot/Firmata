sysex processing
processPinState
	"answer to pin state request. Update corresponding pin in allPins, 
	do nothing when allPins has not been initialized"	
		|	targetPin |
	allPins ifNil: [ ^nil ].
	targetPin := allPins at: ((storedInputData at: 2) + 1) .
	targetPin mode: (storedInputData at: 3).
	targetPin state: (storedInputData at: 4).