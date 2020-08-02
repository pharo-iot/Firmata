other commands
queryFirmware
"Send a Firmware Name and Version query"

self port  nextPutAll: (ByteArray with: FirmataConstants startSysex with: FirmataConstants reportFirmware with: FirmataConstants endSysex).