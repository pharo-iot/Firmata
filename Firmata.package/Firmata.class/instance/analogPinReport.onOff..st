analog pins
analogPinReport: pin onOff: onOff 
	"Sends a message to turn Analog Pin reportng on or off for a pin"
self port 
		nextPutAll: (ByteArray
				with: (FirmataConstants reportAnalog  bitOr: pin)
				with: onOff)