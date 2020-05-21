sysex processing
processCapability
	"fill allPins with the results of the capability querys"	
			
	| pindata response|
	(allPins size ~= 0) ifTrue: [ ^nil ]. "We might lso update allPins, but usally boards don't change"
	response := storedInputData copyFrom: 2 to: sysexBytesRead.
	pindata := response splitOn: 127.
	pindata removeLast.
	pindata do: [ :eachPin | | pin length|
		pin := FirmataPin new.
		length := eachPin size.
		(length > 0) ifTrue:
			[ 
				1 to: length by: 2 do: [ :i |  
					pin addCapability: (FirmataPinCapability mode: (eachPin at: i) 
								resolution: (eachPin at: (i + 1)))]
				 ].
		allPins add: pin.
			
			]