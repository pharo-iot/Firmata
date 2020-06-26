initialize-release
initializeVariables
	digitalOutputData := Array new: 16 withAll: 0.
	digitalInputData := Array new: 16 withAll: 0.
	analogInputData := Array new: 16 withAll: 0.
	storedInputData := Array new: (FirmataConstants maxDataBytes) * 5 withAll: 0.
	allPins := OrderedCollection new.
	parsingSysex := false.
	sysexBytesRead := waitForData := executeMultiByteCommand := multiByteChannel := majorVersion := minorVersion := 0.
	pinMap := Dictionary new.  "With analog pin number as key"
	i2cData := Dictionary new.  "with i2c address as key and a bytearray as data"
	encoderData := Dictionary new. "encoder number as key"
	dataGuard := Mutex new