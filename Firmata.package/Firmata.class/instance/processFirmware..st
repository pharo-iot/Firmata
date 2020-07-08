sysex processing
processFirmware: data
	majorVersion := data at: 1.
	minorVersion := data at: 2.
	firmwareName := ByteArray new: ((data size - 2) / 2).
	3 to: data size by: 2 do:
		[ :i | firmwareName at: ((i - 1) / 2) put: (data at: i) ]