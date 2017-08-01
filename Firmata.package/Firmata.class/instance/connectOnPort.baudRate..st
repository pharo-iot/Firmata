connection
connectOnPort: portName baudRate: aNumber
	"If the port cant't be open it stores nil, this way we can know if it is
	connected by asking if port is nil.
	In windows we can't open a port using the port name, so I convert the
	string to an integer"
	self isConnected ifTrue: [^ self].
	port := SerialPort new baudRate: aNumber.
	portName isString ifFalse: [ 
		self error: 'Expected port name. E.g. ''/dev/ttyACM0''' ].
	port openPort: portName.
	
	self isConnected ifTrue: [
		self
			startSteppingProcess;
			controlFirmataInstallation ]