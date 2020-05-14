sysex processing
processAnalogMapping
	"the result of an anlog mapping request consists op the sequence of pin, with 127 representing a non-nalog pin and the analog pin number if it is analog"	
			
	| thePin |
	2 to: sysexBytesRead do: [ :pin | | nr | 
				nr := storedInputData at: pin.
				(nr != 127) ifTrue: [ (allPins at: pin) analogPinNumber: nr ] ]
	