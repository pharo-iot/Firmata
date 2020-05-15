utilities
to7Bits: aByteArray
	"return a BateArray with 2 seven bitscharacters fro each bye"	
			
	| buffer |
	buffer := OrderedCollection new .
	aByteArray do: [ :b | buffer add: (b bitAnd: 16r7F). buffer add: ((b bitShift: -7) bitAnd: 16r7F) ].
	^buffer asByteArray