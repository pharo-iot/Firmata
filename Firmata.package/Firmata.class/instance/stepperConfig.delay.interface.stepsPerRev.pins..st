stepper
stepperConfig: devnumber delay: museconds interface: code stepsPerRev: number pins: aByteArray
	"This is the old stepper interface
	delay: 0 is 1 microsecond, 1 is 2 microseconds
	interface:  XXXX001 = step + direction driver XXXX010 = two wire XXX100 = four wire
	stepsPerRev(olution)
	pins: a ByeArray of 2 or 4 pin numbers (0-127)"
	| request |
	request := ByteArray 	with: FirmataConstants stepperCommand
								with: 0  "config subcommand"
								with: devnumber
								with: ((museconds bitShift: -3) bitOr: code)
								with: (number bitAnd: 16r7F)
								with: ((number bitShift: -7) bitAnd: 16r7F).
	self startSysex.
	self port nextPutAll: request.
	self port nextPutAll: aByteArray.
	self endSysex 
								
								
								
	
	
			