sysex processing
processAnalogMapping: data 
	"the result of an anlog mapping request consists op the sequence of pin, with 127 representing a non-nalog pin and the analog pin number if it is analog"	
			
	(allPins isEmpty) ifTrue: [ ^nil ]. "ignore, should do capability query first"
	data withIndexDo: [ :each :i | 
				(each ~= 127) ifTrue: [ (allPins at: i )analogPinNumber: each. pinMap at: each put: (i - 1) ] ]
	