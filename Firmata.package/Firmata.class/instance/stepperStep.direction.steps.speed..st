stepper
stepperStep: stepperNn direction: dir steps: number speed: speed
	" number of steps maximum2,097,151"	
	| request |
	request := ByteArray new: 11.
	request
		at: 1 put: FirmataConstants startSysex;
		at: 2 put: FirmataConstants stepperCommand;
		at: 3 put: 1;  "step"
		at: 4 put: stepperNn;
		at: 5 put: dir;
		at: 6 put: (number bitAnd: 16r7F);
		at: 7 put: ((number bitShift: -7) bitAnd: 16r7F);
		at: 8 put: ((number bitShift: -14) bitAnd: 16r7F);
		at: 9 put: (speed bitAnd: 16r7F);
		at: 10 put: ((speed bitShift: -7) bitAnd: 16r7F);
		at: 11 put: FirmataConstants endSysex.

	self port nextPutAll: request								
	