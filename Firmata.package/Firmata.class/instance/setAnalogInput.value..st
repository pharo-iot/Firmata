analog pins
setAnalogInput: pin value: value
"Stores analog value data in the mapped firmataPin (with Arduino pinnr)"
	dataGuard critical: [ (allPins at: (pinMap at: pin)) pinValue: value]