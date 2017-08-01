receiving
parseCommandHeader: inputByte 
"I check the inputByte for a command header and then I set the variables accordingly to process the data in the following step"
	| command |
	inputByte < 240
		ifTrue: [command := inputByte bitAnd: 240.
			multiByteChannel := inputByte bitAnd: 15.]
		ifFalse: [command := inputByte].
	command caseOf: {
		[FirmataConstants analogMessage] -> 
			[waitForData := 2.
			executeMultiByteCommand := command].
		[FirmataConstants digitalMessage] -> 
			[waitForData := 2.
			executeMultiByteCommand := command].
		[FirmataConstants setPinMode] -> 
			[waitForData := 2.
			executeMultiByteCommand := command].
		[FirmataConstants reportDigital] -> 
			[waitForData := 1.
			executeMultiByteCommand := command].
		[FirmataConstants startSysex] -> 
			[parsingSysex := true.
			sysexBytesRead := 0].
		[FirmataConstants reportVersion] -> 
			[waitForData := 2.
			executeMultiByteCommand := command]}
		 otherwise: []