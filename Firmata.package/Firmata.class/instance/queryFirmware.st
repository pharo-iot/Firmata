other commands
queryFirmware
"Send a Firmware Name and Version query"
self startSysex.
self port  nextPutAll: (ByteArray with: FirmataConstants reportFirmware ).