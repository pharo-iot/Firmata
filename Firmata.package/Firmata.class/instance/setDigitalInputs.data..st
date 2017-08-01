digital pins
setDigitalInputs: portNumber data: portData 
"Puts but masked On/Off data for a whole digital port into array"
	digitalInputData at: portNumber + 1 put: portData