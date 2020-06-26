analog pins
analogRead: pinNumber
"Returns an analog value for an individual Analog pin"
	| value |
	dataGuard critical: [ value := (allPins at: (pinMap at: pinNumber)) pinValue ].
	^value