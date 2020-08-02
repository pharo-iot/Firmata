sysex processing
parseSysex: inputByte 
	inputByte = FirmataConstants endSysex
		ifTrue: [parsingSysex := false. self dispatchSysex]
		ifFalse: [storedInputData at: sysexBytesRead + 1 put: inputByte.
			sysexBytesRead := sysexBytesRead + 1
				]