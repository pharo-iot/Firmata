sysex processing
processEncoderData: data
	" This response can contain more than one answer"
	| encoderNumber sign value totalNumber signBit|
	totalNumber := (data size - 1) / 5.
	1 to: totalNumber do: [ :i |
		encoderNumber := (data at: (5 * i - 4)) bitAnd: 2r00111111.
		signBit := (data at: (5 * i - 4)) bitAnd: 2r01000000.
		sign := -1.
		(signBit = 0) ifTrue: [ sign := 1].
		value := sign * ( self from4Bytes: (data copyFrom: (5 * i - 3) to: (5 * i ))).
		encoderData at: encoderNumber put: value]
		
