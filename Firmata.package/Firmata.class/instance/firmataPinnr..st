as yet unclassified
firmataPinnr: anArduinoPinNumber
	"creturn the FirmataPin with the corresponding arduino pin number
	should this not be a copy??"	
			
	^allPins at: (anArduinoPinNumber + 1)