digital pins
pin: pin mode: mode
"Sends an individual Pin Mode message"
self port nextPutAll: (ByteArray with: FirmataConstants setPinMode with: pin with: mode).