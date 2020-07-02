sysex processing
processCapability: data
	"fill allPins with the results of the capability querys"	
		
	| pindata pinNr |
	(allPins size ~= 0) ifTrue: [ ^nil ]. "We might lso update allPins, but usally boards don't change"
	pindata := data splitOn: 127.
	pindata removeLast.
	pinNr := 0.
	pindata do: [ :eachPin | | pin length|
		pin := FirmataPin new.
		pin id: pinNr.
		pinNr := pinNr + 1.
		pin pinValue: 0.
		length := eachPin size.
		(length > 0) ifTrue:
			[ 
				1 to: length by: 2 do: [ :i |  
					pin addCapability: (FirmataPinCapability mode: (eachPin at: i) 
								resolution: (eachPin at: (i + 1)))]
				 ].
		allPins add: pin.
			
			]