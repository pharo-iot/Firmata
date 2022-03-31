analog pins
firmataAnalogPinnr: anAnalogPinNumber
	"creturn the FirmataPin with the corresponding arduino pin number
	should this not be a copy??"	
			
	^(allPins at: ((pinMap at: anAnalogPinNumber)  + 1)) copy