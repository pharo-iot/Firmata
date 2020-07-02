stepper
stepperStep: stepperNo steps: aNumber speed: speed accel: accelValue decel: decelValue
	" number of steps maximum 2,097,151, negative is CCW"	
	| sign |
	sign := 0.
	(aNumber < 0 ) ifTrue: [ sign := 1 ].
	self stepperStep: stepperNo direction: sign steps: aNumber abs speed: speed accel: accelValue decel: decelValue
	
