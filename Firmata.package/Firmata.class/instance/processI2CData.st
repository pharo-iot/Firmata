i2c
processI2CData
	| buffer address|
	address := (storedInputData at: 2) + ((storedInputData at: 3) bitShift: -7).
	buffer := OrderedCollection new.
	4 to: sysexBytesRead  by: 2 do: 
		[ :x | buffer add: ((storedInputData at: x) + ((storedInputData at: (x + 1)) bitShift: -7)) ].
	i2cData at: address put: (buffer asByteArray)
	


