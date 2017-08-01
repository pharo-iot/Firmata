stepping
stopSteppingProcess
	steppingProcess isNil
		ifTrue: [^ self].
	steppingProcess terminate. 
	steppingProcess := nil