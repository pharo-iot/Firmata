digital pins
setDigitalInputs: portNumber data: portData 
"Puts but masked On/Off data for a whole digital port into array"
	"digitalInputData at: portNumber + 1 put: portData"
	
	1 to: 8 do: [  :bit |  | newValue oldValue pinNr|
		pinNr := portNumber * 8 + bit.
		oldValue := (allPins at: pinNr) pinValue.
		newValue := portData bitAt: bit.
		dataGuard critical: [ (allPins at: pinNr) pinValue: newValue ].
		[(oldValue ~= newValue) ifTrue: 
			[ announcer announce: (FirmataPinChange new 
					pinNr: (pinNr - 1); 
					pinValue: newValue;
					timestamp: DateAndTime now )]] forkAt: Processor userInterruptPriority
	]