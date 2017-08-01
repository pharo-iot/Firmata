stepping
startSteppingProcess
	steppingProcess notNil
		ifTrue: [^ self].
	steppingProcess := [[self step.
			(Delay forMilliseconds: self stepTime) wait] repeat]
				forkNamed: self asString 