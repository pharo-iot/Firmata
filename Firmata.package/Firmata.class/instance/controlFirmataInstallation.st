error control
controlFirmataInstallation
	"If Firmata is not installed I throw an error"

	self isFirmataInstalled
		ifFalse: [ ^ self
				error:
					'Firmata doesn''t seem to be installed.
Please use the Arduino IDE to upload the StandardFirmata sketch' ]