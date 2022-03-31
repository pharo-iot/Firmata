Helper class to  implement I2C access to Firmata driver in the same way as WiringPi does, and with an equivalent protocol

Instvars:
firmata - the Firmata instance this connection belongs to (the real driver!)
address - the address of the I2C device; this has the same role as handle in WiringPiDeviceConnection 
readDelay - a Duration to wait before the result of a read request is read. Due to the asynchronous nature of the Firmata protocol we set it to 20 milliseconds, the smallest sample interval of a Firmata sketch.

Note that Firmata I2C reads and returns byteArrays. On reading results, the first byte is the register number.