stepper
stepperConfig: devnumber delay: museconds interface: code stepsPerRev: number pins: aByteArray
	"This is the old stepper interface
	delay: 0 is 1 microsecond, 1 is 2 microseconds
	interface:  XXXX001 = step + direction driver XXXX010 = two wire XXX100 = four wire
	stepsPerRev(olution)
	pins: a ByeArray of 2 or 4 pin numbers (0-127)"
	| request |
	request := ByteArray new: 6.
	request
		at: 1 put: FirmataConstants startSysex;
		at: 2 put: FirmataConstants stepperCommand;
		at: 3 put: 0;  "config subcommand"
		at: 4 put: devnumber;
		at: 5 put: ((museconds bitShift: -3) bitOr: code);
		at: 6 put: (number bitAnd: 16r7F);
		at: 7 put: ((number bitShift: -7) bitAnd: 16r7F).
	request := request, aByteArray, ((FirmataConstants endSysex) asByteArray).
	self port nextPutAll: request
								
								
								
	
	
			