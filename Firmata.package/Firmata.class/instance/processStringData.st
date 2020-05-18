sysex processing
processStringData
	" what to do with received string data? For now provide a popup	
		I should strip the null bytes from the string!!"
			
	| text |
	text := (storedInputData copyFrom: 2 to: sysexBytesRead) asString .
	UIManager default alert: text title: 'Firmata'