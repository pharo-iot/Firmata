digital pins
directDigitalWrite: pinNumber value: oneOrZero
	"directly write 0 or ! to digital pin, bypassing port mechanism"	
			
	| buffer  |
	buffer := ByteArray with: FirmataConstants setDigitalPinValue
								with: pinNumber
								with: oneOrZero.
	port nextPutAll: buffer 