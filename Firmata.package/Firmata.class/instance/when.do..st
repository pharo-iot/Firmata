announce requests
when: anEvent do: aBlock
	"return the subscription so it can be removed"
	
	^announcer when: anEvent do: aBlock