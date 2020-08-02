sysex processing
processStepperEvent: data 
	"a (legacy stepper sends this when it is finished moving
	data in this case is the stepper number and we give notice of the event 
	with a StepperFinished announcement"
	[ announcer announce: (FirmataStepperFinished new stepperNr: (data first)) ]
	 forkAt: Processor userInterruptPriority 