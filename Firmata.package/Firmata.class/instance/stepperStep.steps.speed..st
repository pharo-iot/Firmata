stepper
stepperStep: stepperNo steps: aNumber speed: speed
	" number of steps maximum2,097,151, negative is CCW"	
	| sign |
	sign := 0.
	(aNumber < 0 ) ifTrue: [ sign := 1 ].
	self stepperStep: stepperNo direction: sign steps: aNumber abs speed: speed
	
