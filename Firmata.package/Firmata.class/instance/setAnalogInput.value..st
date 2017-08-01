analog pins
setAnalogInput: pin value: value
"Stores analog value data in array"
	analogInputData at: pin + 1 put: value