testing
capableOfMode: aPinMode
	" answer true if this pin has aPinMode among its capabilities "
	capabilities detect: [ :each | (each mode) = aPinMode ]
					ifNone: [ ^false ].
			^true