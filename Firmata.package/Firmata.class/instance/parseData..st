receiving
parseData: inputByte 
"I check inputByte for data according to the command header I found in the previous step, then I use the data to set the corresponding variables"

	waitForData := waitForData - 1.
	storedInputData at: waitForData + 1 put: inputByte.

	(waitForData = 0
			and: [executeMultiByteCommand ~= 0])
		ifTrue: [executeMultiByteCommand caseOf: {
				[FirmataConstants analogMessage] -> [self setAnalogInput: multiByteChannel value: (storedInputData first bitShift: 7)
						+ storedInputData second].
				[FirmataConstants digitalMessage] -> [
						self setDigitalInputs: multiByteChannel data: (storedInputData first bitShift: 7)
						+ storedInputData second].
				[FirmataConstants reportVersion] -> [self majorVersion: storedInputData first minorVersion: storedInputData second]}
				 otherwise: [].
			executeMultiByteCommand := 0]