digital pins
digitalPortReport: port1 onOff: onOff
"Sends a message to toggle reporting for a whole digital port"
	self port 
		nextPutAll: (ByteArray
				with: (FirmataConstants reportDigital bitOr: port1 )
				with: onOff)