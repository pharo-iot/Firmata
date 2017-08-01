error control
controlConnection
	self isConnected
		ifFalse: [ ^ self error: 'Serial port is not connected' ]