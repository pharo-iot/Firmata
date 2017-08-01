servos
attachServoToPin: pinNumber 
	self
		servoConfig: pinNumber
		minPulse: 544
		maxPulse: 2400
		angle: 0