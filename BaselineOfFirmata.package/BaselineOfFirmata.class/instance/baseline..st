baselines
baseline: spec

	<baseline>
	spec for: #common do: [ 
		self declareSerialPortOn: spec .
		spec package: #Firmata.

		spec group: 'default' with: #( 'Firmata' ) ]