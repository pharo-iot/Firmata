other commands
reset
	"send systemReset command"
			
	self port nextPutAll: (ByteArray with: FirmataConstants systemReset ).