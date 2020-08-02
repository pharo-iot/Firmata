as yet unclassified
firmataPin: anArduinoPinNumber
	"creturn the FirmataPin with the corresponding arduino pin number
	should this not be a copy??"	
			
	^(allPins at: (anArduinoPinNumber + 1)) copy