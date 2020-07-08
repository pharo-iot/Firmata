sysex processing
processI2CData: data
	| buffer address|
	address := (data at: 1) + ((data at: 2) bitShift: -7).
	buffer := OrderedCollection new.
	3 to: (data size)  by: 2 do: 
		[ :x | buffer add: ((data at: x) + ((data at: (x + 1)) bitShift: -7)) ].
	i2cData at: address put: (buffer asByteArray)
	


