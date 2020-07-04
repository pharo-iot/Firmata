digital pins
extendedAnalogWrite: pinNr value: aNumber
	"allows addressing beyond pin 15 and also higherr resolution"	
			
	| data iNumber buffer|
	iNumber := aNumber rounded.
	data := OrderedCollection new.
	data add: (iNumber bitAnd: 16r7F).
	data add: ((iNumber bitShift: -7) bitAnd: 16r7F).
	iNumber := iNumber bitShift: -14.
	(iNumber ~=  0) ifTrue: [data add: (iNumber bitAnd: 16r7F)].
	buffer := (FirmataConstants startSysex) asByteArray,
					(FirmataConstants extendedAnalog) asByteArray,
					data asByteArray,
					(FirmataConstants endSysex ) asByteArray.
	port nextPutAll: buffer
	