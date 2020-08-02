I represent all that is known about an Arduino pin. I get created as a result of a capabilitiesrequest.
This should only be done once, presumably at initialisation of hte Firmata protocol.

Be aware that Arduino pins are numbered from 0, not 1!!

    Instance Variables
	analogPinNumber:		the correspponding amalog pinnumber, filled by analogMappingRequest
	capabilities:		a list of FirmataPinCapabilities
	maxTimestamp:		timestamp of maxValue latch
	maxValue:		maximum value latch
	minTimestamp:		timestamp of min value latch
	minValue:		minimmum value
	mode:		the actul mode (from  punStateRequest)
	state:		the pretended value (not measuered but reported)
	value:		the real value (analog or digital))


    Implementation Points