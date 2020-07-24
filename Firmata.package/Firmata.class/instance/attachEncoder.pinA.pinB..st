encoder
attachEncoder: number pinA: pinNumber1 pinB: pinNumber2
	"attach (init)  an encode with e number <= maxEncoders(5?)	"
			
	| request |
	request := ByteArray new: 7.
	request 
		at: 1 put: FirmataConstants startSysex ;
		at: 2 put: FirmataConstants encoderData;
		at: 3 put: 0;  "encoder_attach"
		at: 4 put: number ;
		at: 5 put: pinNumber1 ;
		at: 6 put: pinNumber2;
		at: 7 put: FirmataConstants endSysex .
								
	port nextPutAll: request.
	encoderData at: number put: 0.