function waveform = myCos(frequency, phase, duration, Fs)
Ts = 1/Fs; % sampling rate
N = 1+round(duration/Ts); % number of samples
t = linspace(0,duration, N); % the time array from determined parameters
waveform = cos(2*pi*frequency*t+phase); % declaring the cosine
%[DFTx1,fc_axis]=FT(waveform,Fs);

% figure;
% hx=stem(t,waveform,'Marker','.');
% %set(hs,'Marker','.')
% grid on
% xlabel('my Cos')
% xlim([0 duration])
% ylabel('Amplitude')
% title('cosine wave','FontWeight','bold')
%plot(t, waveform);

end