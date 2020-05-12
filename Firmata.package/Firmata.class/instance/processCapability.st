sysex processing
processCapability
	"fill allPins with the results of the capability querys"	
			
	| pindata |
	storedInputData at: 1 put: 127. " replace the sysex command"
	pindata := storedInputData splitOn: 127.
	pindata do: [ :eachPin | | pin length|
		pin := FirmataPin new.
		length := eachPin size.
		(length > 0) ifTrue:
			[ 
				1 to: (length - 2) by: 2 do: [ :i |  
					pin addCapability: (FirmataPinCapability mode: (eachPin at: i) 
								resolution: (eachPin at: (i + 1)))]
				 ].
		allPins add: pin.
			
			]