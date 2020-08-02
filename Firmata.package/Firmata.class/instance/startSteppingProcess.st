stepping
startSteppingProcess
	steppingProcess notNil
		ifTrue: [^ self].
	steppingProcess := [[self step.
			(Delay forMilliseconds: self stepTime) wait] repeat]
				forkAt: Processor lowIOPriority  named: self asString 