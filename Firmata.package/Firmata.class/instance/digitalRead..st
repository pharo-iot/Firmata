digital pins
digitalRead: pinNumber 
	"Retuns On/Off data for an individual Digital Pin"
	" ((digitalInputData at: (pinNumber bitShift: -3)
			+ 1)
		bitShift: (pinNumber bitAnd: 7) * -1)
		bitAnd: 1"
		
	^(allPins at: (pinNumber + 1)) pinValue