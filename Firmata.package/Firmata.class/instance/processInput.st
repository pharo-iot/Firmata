receiving
processInput
	| data |
	data := port readByteArray.

	data
		do: [:inputByte | 

parsingSysex
				ifTrue: [self parseSysex: inputByte]
				ifFalse: [(waitForData > 0
							and: [inputByte < 128])
						ifTrue: [self parseData: inputByte]
						ifFalse: [self parseCommandHeader: inputByte]]]