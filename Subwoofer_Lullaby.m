%% Subwoofer Lulluby

%% notes
count = 0.875;
half = (count/2);

a3 = midi(57, count);
f3 = midi(53, count);
g3 = midi(55, count);
a4 = midi(69, count);
c4 = midi(60, count);
b4 = midi(71, count);
f4 = midi(65, count);
g4 = midi(67, count);
a5 = midi(81, count);
b5 = midi(83, count);
c5 = midi(72, count);
d5 = midi(74, count);
e5 = midi(76, count);
g5 = midi(79, count);
e6 = midi(88, count);
g6 = midi(91, count);
a6 = midi(93, count);
d6 = midi(86, count);
f6 = midi(89, count);
c6 = midi(84, count);

a5s = midi(81, half);
b5s = midi(83, half);
e5s = midi(76, half);
f5s = midi(77, half);
c6s = midi(84, half);
d6s = midi(86, half);
e6s = midi(88, half);
f6s = midi(89, half);

c6l = midi(84, count*2);
e6l = midi(88, count*1.5);
d6l = midi(86, count*2);
g6l = midi(91, count*2.5);
b5l = midi(83, count*2.5);
e5l = midi(76, count*2.5);
b4l = midi(71, count*2.5);

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
sound(e5, fs, bits)
sound(b4, fs, bits)
pause(half)

sound(b5, fs, bits)
pause(half)

sound(c6l, fs, bits)
sound(c5, fs, bits)
sound(c4, fs, bits)
pause(count)

sound(e5, fs, bits)
sound(b4, fs, bits)
pause(count)

sound(g5, fs, bits)
sound(g4, fs, bits)
pause(count)

%% 11th bar
sound(b5, fs, bits)
sound(e5, fs, bits)
sound(b4, fs, bits)
pause(count)

sound(b5s, fs, bits)
sound(a4, fs, bits)
sound(a3, fs, bits)
pause(half)

sound(e6s, fs, bits)
pause(half)

sound(d6s, fs, bits)
sound(e5, fs, bits)
sound(c5, fs, bits)
pause(half)

sound(e6, fs, bits)
pause(half)

sound(a4, fs, bits)
pause(half)

sound(g6, fs, bits)
pause(half)

%12th bar
sound(e5, fs, bits)
sound(c5, fs, bits)
pause(half)

sound(e6l, fs, bits)
pause(half)

sound(a4, fs, bits)
sound(a3, fs, bits)
pause(count)

sound(d6l, fs, bits)
sound(e5, fs, bits)
sound(c5, fs, bits)
pause(count)

sound(a4, fs, bits)
pause(count)

%13th bar

sound(b5, fs, bits)
sound(e5, fs, bits)
sound(c5, fs, bits)
pause(count)

sound(f6s, fs, bits)
sound(f4, fs, bits)
sound(f3, fs, bits)
pause(half)

sound(e6, fs, bits)
pause(half)

sound(c5, fs, bits)
sound(a4, fs, bits)
pause(half)

sound(c6, fs, bits)
pause(half)

sound(f4, fs, bits)
pause(half)

sound(a5s, fs, bits)
pause(half)

%14th bar

sound(c6, fs, bits)
sound(c5, fs, bits)
sound(a4, fs, bits)
pause(count)

sound(b5s, fs, bits)
sound(g4, fs, bits)
sound(g3, fs, bits)
pause(half)

sound(g5, fs, bits)
pause(half)

sound(d5, fs, bits)
sound(b4, fs, bits)
pause(half)

sound(e6, fs, bits)
pause(half)

sound(g4, fs, bits)
pause(half)

sound(d6s, fs, bits)
pause(half)

%15th bar

sound(e5s, fs, bits)
sound(d5, fs, bits)
sound(b4, fs, bits)
pause(half)

sound(f5s, fs, bits)
pause(half)

sound(f6s, fs, bits)
sound(f4, fs, bits)
sound(f3, fs, bits)
pause(half)

sound(e6, fs, bits)
pause(half)

sound(c5, fs, bits)
sound(a4, fs, bits)
pause(half)

sound(c6, fs, bits)
pause(half)

sound(f4, fs, bits)
pause(half)

sound(a5s, fs, bits)
pause(half)

%16th bar

sound(a6, fs, bits)
sound(c5, fs, bits)
sound(a4, fs, bits)
pause(count)

sound(g6, fs, bits)
sound(g4, fs, bits)
sound(g3, fs, bits)
pause(count)

sound(e6s, fs, bits)
sound(d5, fs, bits)
sound(b4, fs, bits)
pause(half)

sound(d6, fs, bits)
pause(half)

sound(g4, fs, bits)
pause(half)

sound(b5, fs, bits)
pause(half)

%% 17th bar
sound(g5, fs, bits)
sound(d5, fs, bits)
sound(b4, fs, bits)
pause(count)

sound(c4, fs, bits)
pause(count)

sound(g6, fs, bits)
sound(b5, fs, bits)
sound(c5, fs, bits)
pause(count)

sound(e6, fs, bits)
sound(g5, fs, bits)
sound(c4, fs, bits)
pause(count)

%18th bar
sound(g6, fs, bits)
sound(b5, fs, bits)
sound(c5, fs, bits)
pause(count)

sound(c4, fs, bits)
pause(count)

sound(g6, fs, bits)
sound(b5, fs, bits)
sound(e5, fs, bits)
sound(b4, fs, bits)
pause(count)

sound(e6, fs, bits)
sound(g5, fs, bits)
sound(c4, fs, bits)
pause(count)

%19th bar
sound(g6, fs, bits)
sound(b5, fs, bits)
sound(e5, fs, bits)
sound(b4, fs, bits)
pause(count)

sound(c4, fs, bits)
pause(count)

sound(g6, fs, bits)
sound(b5, fs, bits)
sound(c5, fs, bits)
pause(count)

sound(e6, fs, bits)
sound(g5, fs, bits)
sound(c4, fs, bits)
pause(count)

%20th bar
sound(g6, fs, bits)
sound(b5, fs, bits)
sound(c5, fs, bits)
pause(count)

sound(c4, fs, bits)
pause(count)

sound(g6, fs, bits)
sound(b5, fs, bits)
sound(e5, fs, bits)
sound(b4, fs, bits)
pause(count)

sound(e6, fs, bits)
sound(g5, fs, bits)
sound(c4, fs, bits)
pause(count)

%21st bar
sound(g6l, fs, bits)
sound(b5l, fs, bits)
sound(e5l, fs, bits)
sound(b4l, fs, bits)




% I used https://onlinesequencer.net/1187399 and https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.phys.unsw.edu.au%2Fjw%2Fgraphics%2Fnotes.GIF&f=1&nofb=1&ipt=31d5228003e6dcd2c39359fb15ee3350ba1863989583ae9891423135d3fb4913
% ^^ for the mapping and conversion.