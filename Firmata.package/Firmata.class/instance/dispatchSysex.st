other commands
dispatchSysex
	" at this point we have a sysex message in storedInputData"
	| sysexCommand |
	sysexCommand := storedInputData first.
	(sysexCommand = FirmataConstants analogMappingResponse) ifTrue: [ ^self processAnalogMapping ].
	(sysexCommand = FirmataConstants ) ifTrue: [ ^self process ].
	(sysexCommand = FirmataConstants ) ifTrue: [ ^self process ].
	(sysexCommand = FirmataConstants ) ifTrue: [ ^self process ].
	(sysexCommand = FirmataConstants ) ifTrue: [ ^self process ].