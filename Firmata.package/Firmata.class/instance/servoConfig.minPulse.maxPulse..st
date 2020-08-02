servos
servoConfig: pin minPulse: minPulse maxPulse: maxPulse
	"Note: the parameter angle is ignored by Firmata, so considerr this method deprecated
	Default values: 
	minPulse 544 (LSB 32 MSB 4)
	maxPulse 2400 (LSB 96 MSB 18
	"
	| b |
	b := ByteArray new: 8.
	b at: 1 put: FirmataConstants startSysex;
		 at: 2 put: FirmataConstants servoConfig;
		 at: 3 put: pin;
		 at: 4 put:  (minPulse rounded bitAnd: 127);
		 at: 5 put: ((minPulse rounded bitShift: -7)
				bitAnd: 127);
		 at: 6 put: (maxPulse rounded bitAnd: 127);
		 at: 7 put: ((maxPulse rounded bitShift: -7)
				bitAnd: 127);
		
		 at: 8 put: FirmataConstants endSysex.
	self port nextPutAll: b