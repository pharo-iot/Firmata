pin modes
pinsWithMode: aMode
	"return collection with true or falsee for each pin number"
	^allPins collect: [ :pin | pin capableOfMode: aMode ]