as yet unclassified
firmataPinnr: anArduinoPinNumber
	"creturn the FirmataPin with the corresponding arduino pin number"	
			
	^allPins at: (anArduinoPinNumber + 1)