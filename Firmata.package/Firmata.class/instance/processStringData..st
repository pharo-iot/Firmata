sysex processing
processStringData: data
	" what to do with received string data? For now provide a popup	
		I should strip the null bytes from the string!!"
			
	stringData := ByteArray new: ((data size) / 2).
	1 to: data size by: 2 do:
		[  :i | stringData at: ((i + 1) / 2) put: (data at: i)]