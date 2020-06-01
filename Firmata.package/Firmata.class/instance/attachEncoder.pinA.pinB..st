encoder
attachEncoder: number pinA: pinNumber1 pinB: pinNumber2
	"attach (init)  an encode with e number <= maxEncoders(5?)	"
			
	| request |
	request := ByteArray with: FirmataConstants encoderData
								with: 0  "encoder_attach"
								with: number
								with: pinNumber1
								with: pinNumber2.
								
	self fullSysex: request