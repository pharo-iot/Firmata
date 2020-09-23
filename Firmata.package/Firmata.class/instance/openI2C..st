i2c
openI2C: deviceAddress 
	"creates and returns an I2CFirmataConnection for the specified i2c deviceAddress
	This equivalent to the way WiringPi reifies the I2C Connection
	and can directly be used in the ArduinoFirmataDriver of PharoThings"
	| connection |
	connection := I2CFirmataConnection new.
	connection address: deviceAddress.
	connection firmata: self.
	self i2cConfig ."no problem that this will be executed for each I2C device"
	^connection