other commands
fullSysex: aByteArray 
	"send start, bytes and end"	
			
	self startSysex .
	self port nextPutAll: aByteArray.
	self endSysex