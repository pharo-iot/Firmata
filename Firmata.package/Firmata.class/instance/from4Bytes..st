utilities
from4Bytes: aByteArray 
	"cconvert 4 7-bits bytes to one integer"	
			
	| response |
	response := (((aByteArray at: 4) * 128 +
					(aByteArray at: 3)) * 128 +
					(aByteArray at: 2)) * 128 +
					(aByteArray at: 1).
	^response