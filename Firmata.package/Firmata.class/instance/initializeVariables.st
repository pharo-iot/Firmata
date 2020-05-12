initialize-release
initializeVariables
	digitalOutputData := Array new: 16 withAll: 0.
	digitalInputData := Array new: 16 withAll: 0.
	analogInputData := Array new: 16 withAll: 0.
	storedInputData := Array new: (FirmataConstants maxDataBytes) * 4 withAll: 0.
	allPins := OrderedCollection new.
	parsingSysex := false.
	sysexBytesRead := waitForData := executeMultiByteCommand := multiByteChannel := majorVersion := minorVersion := 0