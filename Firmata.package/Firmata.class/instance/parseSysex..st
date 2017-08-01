receiving
parseSysex: inputByte 
	inputByte = FirmataConstants endSysex
		ifTrue: [parsingSysex := false]
		ifFalse: [storedInputData at: sysexBytesRead + 1 put: inputByte.
			sysexBytesRead := sysexBytesRead + 1
				]