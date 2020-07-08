sysex processing
dispatchSysex
	" at this point we have a sysex message in storedInputData"
	| sysexCommand data action|
	sysexCommand := storedInputData first.
"	(sysexCommand = FirmataConstants analogMappingResponse) ifTrue: [ ^self processAnalogMapping ].
	(sysexCommand = FirmataConstants capabilityResponse ) ifTrue: [ ^self processCapability ].
	(sysexCommand = FirmataConstants reportFirmware  ) ifTrue: [ ^self processFirmware ].
	(sysexCommand = FirmataConstants pinStateResponse ) ifTrue: [ ^self processPinState ].
	(sysexCommand = FirmataConstants stringData) ifTrue: [ ^self processStringData ].
	(sysexCommand = FirmataConstants i2cReply) ifTrue: [ ^self processI2CData ].
	(sysexCommand = FirmataConstants encoderData) ifTrue: [ ^self processEncoderData ]."
	data := storedInputData copyFrom: 2.
	action := dispatchDict at: sysexCommand ifAbsent: [ self error: 'nknown sysex command ' , sysexCommand hex].
	self perform: action with: data.