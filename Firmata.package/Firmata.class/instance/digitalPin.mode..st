digital pins
digitalPin: pinNumber mode: mode
"Digital ports should always be active"
pinNumber <= 7
	ifTrue: [self activateDigitalPort: 0]
	ifFalse: [self activateDigitalPort: 1].
self  pin: pinNumber mode: mode