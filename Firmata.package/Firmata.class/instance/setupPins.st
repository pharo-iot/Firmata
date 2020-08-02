initialization-data
setupPins
	" query capabilities and also initialize the allPins insnce variable 
	then setup the analog pin mapping; we will have to wait for the answers"	
		
	| retries delay |
	self queryCapabilities.
	delay := 50.
	retries := 0.
	[ delay milliSeconds wait. retries := retries + 1. (retries > 10) or: self maxPins ~= 0] whileFalse .
	(self maxPins = 0) ifTrue: [ self error: 'capability query failed' ].
	
	self queryAnalogMapping.
	retries := 0.
	[ delay milliSeconds wait. retries := retries + 1. (retries > 10) or: pinMap size ~= 0] whileFalse .
	(pinMap size = 0) ifTrue: [ self error: 'analog mapping  query failed (or no analog pins)' ].
			
	