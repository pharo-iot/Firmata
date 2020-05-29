stepper
stepperStep: stepperNo direction: dir steps: number speed: speed
	" number of steps maximum2,097,151"	
	| request1 request2 |
	request1 := ByteArray with: FirmataConstants stepperCommand 
								with: 1  "step"
								with: stepperNo
								with: dir.
	request2 := ByteArray with: (number bitAnd: 16r7F)
								with: ((number bitShift: -7) bitAnd: 16r7F)
								with: ((number bitShift: -14) bitAnd: 16r7F)
								with: (speed bitAnd: 16r7F)
								with: ((speed bitShift: -7) bitAnd: 16r7F).
	self startSysex .
	self port nextPutAll: request1;
				nextPutAll: request2.
	
self endSysex 
								
	