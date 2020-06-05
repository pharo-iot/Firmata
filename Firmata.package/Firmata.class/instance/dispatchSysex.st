sysex processing
dispatchSysex
	" at this point we have a sysex message in storedInputData"
	| sysexCommand |
	sysexCommand := storedInputData first.
	(sysexCommand = FirmataConstants analogMappingResponse) ifTrue: [ ^self processAnalogMapping ].
	(sysexCommand = FirmataConstants capabilityResponse ) ifTrue: [ ^self processCapability ].
	(sysexCommand = FirmataConstants reportFirmware  ) ifTrue: [ ^self processFirmware ].
	(sysexCommand = FirmataConstants pinStateResponse ) ifTrue: [ ^self processPinState ].
	(sysexCommand = FirmataConstants stringData) ifTrue: [ ^self processStringData ].
	(sysexCommand = FirmataConstants i2cReply) ifTrue: [ ^self processI2CData ].
	(sysexCommand = FirmataConstants encoderData) ifTrue: [ ^self processEncoderData ].