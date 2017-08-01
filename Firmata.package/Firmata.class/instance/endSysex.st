other commands
endSysex
"Sends an End Sysex message"
self port  nextPutAll: (ByteArray with: FirmataConstants endSysex  ).