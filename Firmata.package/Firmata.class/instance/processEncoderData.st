sysex processing
processEncoderData
	" This response can contain more than one answer"
	| encoderNumber sign value totalNumber signBit|
	totalNumber := (sysexBytesRead - 1) / 5.
	1 to: totalNumber do: [ :i |
		encoderNumber := (storedInputData at: (5 * i - 3)) bitAnd: 2r100.
		signBit := (storedInputData at: (5 * i - 3)) bitAnd: 2r01000000.
		sign := -1.
		(signBit = 0) ifTrue: [ sign := 1].
		value := sign * ( self from4Bytes: (storedInputData copyFrom: (5 * i - 2) to: (5 * i + 1)	)).
		encoderData at: encoderNumber put: value]
		
