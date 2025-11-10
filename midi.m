function waveform = midi(number, duration)
frequency = (440*2^((number-69)/12));


waveform = myCos(frequency, 0, duration, 41400);