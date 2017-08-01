other commands
queryVersion
"Send a version report query"
self port nextPutAll: (ByteArray with: FirmataConstants reportVersion ).