instance creation
onPort: portNumber baudRate: aNumber
	^ self new
		connectOnPort: portNumber baudRate: aNumber;
		yourself