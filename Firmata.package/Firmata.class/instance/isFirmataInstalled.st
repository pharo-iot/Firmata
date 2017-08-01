testing
isFirmataInstalled
"I check if Firmata responds well to queryVersion. I try for 5 seconds"
| t timeout |
t := Time millisecondClockValue.
timeout := 5000.
[self queryVersion. 500 milliSeconds asDelay wait.
self version > 0 or: [(Time millisecondsSince: t) > timeout]] whileFalse.
^self version > 0