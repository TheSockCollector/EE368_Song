%% Subwoofer Lulluby

%% notes
count = 0.875;
half = (count/2);

b5 = midi(83, count);
c5 = midi(72, count);
e5 = midi(76, count);
g5 = midi(79, count);
c4 = midi(60, count);
b4 = midi(71, count);
e6 = midi(88, count);
g6 = midi(91, count);
a6 = midi(93, count);

b5s = midi(83, half);
c6s = midi(84, half);
d6s = midi(86, half);
e6s = midi(88, half);

fs = 44100;
bits = 24;

%% song
sound(c5, fs, bits);
pause(count)

sound(e5, fs, bits)
sound(b5, fs, bits)
pause(count);

sound(g5, fs, bits)
pause(count);

%start of 4th bar (on MIDI chart)
sound(e5, fs, bits)
sound(b5, fs, bits)
pause(count);

sound(c5, fs, bits);
pause(count)

sound(e5, fs, bits)
sound(b5, fs, bits)
pause(count);

sound(g5, fs, bits)
pause(count);

%5th bar
sound(e5, fs, bits)
sound(b5, fs, bits)
pause(count);

sound(c5, fs, bits);
sound(c4, fs, bits);
pause(count);

sound(e5, fs, bits)
sound(b5, fs, bits)
sound(c5, fs, bits);
pause(count);

sound(c4, fs, bits)
sound(g5, fs, bits)
pause(count);

%6th bar
sound(e5, fs, bits)
sound(b5, fs, bits)
sound(c5, fs, bits);
pause(count);

sound(c5, fs, bits);
sound(c4, fs, bits);
pause(count);

sound(e5, fs, bits)
sound(b5, fs, bits)
sound(b4, fs, bits);
pause(count);

sound(c4, fs, bits)
sound(g5, fs, bits)
pause(count);

%7th bar
sound(e5, fs, bits)
sound(b5, fs, bits)
sound(b4, fs, bits);
pause(count);

sound(c5, fs, bits);
sound(c4, fs, bits);
pause(count);

sound(e5, fs, bits)
sound(b5, fs, bits)
sound(c5, fs, bits);
pause(count);

sound(c4, fs, bits)
sound(g5, fs, bits)
pause(count);

%8th bar
sound(e5, fs, bits)
sound(b5, fs, bits)
sound(c5, fs, bits);
pause(count);

sound(c5, fs, bits);
sound(c4, fs, bits);
pause(count);

sound(e5, fs, bits)
sound(b5, fs, bits)
sound(b4, fs, bits);
pause(count);

sound(c4, fs, bits)
sound(g5, fs, bits)
pause(count);

%% 9th bar
sound(e5, fs, bits)
sound(b5, fs, bits)
sound(b4, fs, bits)
pause(count);

sound(b5s, fs, bits)
sound(c5, fs, bits)
pause(half)

sound(c6s, fs, bits)
pause(half)

sound(d6s, fs, bits)
sound(e5, fs, bits)
sound(b4, fs, bits)
pause(half)

sound(e6, fs, bits)
pause(half)

sound(g4, fs, bits)
pause(half)

sound(d6, fs, bits)
pause(half)

%10th bar




% I'm using https://onlinesequencer.net/1187399 and https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.phys.unsw.edu.au%2Fjw%2Fgraphics%2Fnotes.GIF&f=1&nofb=1&ipt=31d5228003e6dcd2c39359fb15ee3350ba1863989583ae9891423135d3fb4913
% ^^ for the mapping and conversion.