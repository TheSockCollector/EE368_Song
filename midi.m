function waveform = midi(number, duration)
frequency = (440*2^((number-69)/12));


waveform = myCos(frequency, 0, duration, 44100) + 0.6*myCos(frequency/2, 0, duration, 44100) + 0.3*myCos(frequency/4, 0, duration, 44100);