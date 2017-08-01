other commands
startSysex
"Sends a Start Sysex message"
self port  nextPutAll: (ByteArray with: FirmataConstants startSysex  ).