sysex processing
dispatchSysex
	" at this point we have a sysex message in storedInputData"
	| sysexCommand data action|
	sysexCommand := storedInputData first.
	data := storedInputData copyFrom: 2 to: sysexBytesRead.
	action := dispatchDict at: sysexCommand ifAbsent: [ self error: 'Unknown sysex command ' , sysexCommand hex].
	self perform: action with: data.