connection
disconnect
	self isConnected
		ifTrue: [self stopSteppingProcess.
			port close.
			port := nil.
			self initializeVariables]