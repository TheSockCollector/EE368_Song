function [Ck,Thetak,DFSx,fcDFT,FdDFT,f0exact]=DFSmodified(x_samples,Fs)
%function [Ck,Thetak,DFSx,fcDFT,FdDFT]=DFS(x_samples,Fs)
% Modified DFS function from Lab edited to eliminate the plots and sounds
% generated from within the function
% Input Arguments:
%   x-samples = Array of time-domain wave samples to analyze
%   Fs = Sampling Rate (in Hz)
% Function computes the Discrete Fourier Transform, Discrete Fourier Series
% and an approximation of the polar form of C-T Fourier Series magnitude
% Coefficients.  Returns the values of the Discrete Fourier Series
% and equivalent continuous time (fcDFT) and digital
% frequency (FdDFT)axes for plotting, with the arrays limited to the Nyquist frequency and
% axes covering the principal range -Fs/2 -> +Fs/2.
% Calls FT() to perform the above, and then expands the axes for easier 
% Interrogation

% If the x_samples are a row vector, then transpose to a column
size_x=size(x_samples);
if (size_x(2) > size_x(1))
    x_samples = x_samples.';
end;

% Remove any DC from the waveform
x_samples = x_samples-mean(x_samples);
% Normalize the peak amplitude value to 1.0
x_samples = x_samples./max(abs(x_samples));

% Find where the sound starts and ends (past silence at beginning)
env_x=abs(hilbert(squeeze(x_samples)));  % Find the signal envelope
[env_big_indices]=find(env_x > 0.2.*max(env_x));
env_big_indices(2);  %skip the 1st envelop point in case wraparound

% Be sure to start after the initial attack (1st 0.05 second)
fifty_msec_second_index = round(0.05 * Fs);
env_start_index = max([env_big_indices(2), fifty_msec_second_index]);

env_end_index = env_big_indices(length(env_big_indices));

% Remove the silence at the beginning and end.
x_samples=x_samples(env_start_index:env_end_index);


% REDUCE LEAKAGE BY USING AS EXACT A NUMBER OF PERIODS AS POSSIBLE.

% Truncate the samples to an exact number of periods
[x_samples,f0exact] = TruncateToExactPeriods(x_samples,Fs);

%Repeat the FFT using exact periods (as close as possible) to reduce
%leakage, and flat-top window for best amplitude measurement
[DFSx,fcDFT,FdDFT]=FT(x_samples,Fs);
%[DFSx,fcDFT,FdDFT]=FT(x_samples.*flattopwin(length(x_samples)),Fs,1);
%[DFSx,fcDFT,FdDFT]=FT(x_samples.*hamming(length(x_samples)),Fs,1);


% Normalize the DFS magnitude spectrum peak to Ckmax=1.0  ( X[k]max=0.5 )
DFSx = 0.5.*DFSx./max(abs(DFSx));

Harmonic_index_spacing = f0exact/Fs*length(abs(DFSx))
Harmonic_indices=round((1:floor(Fs/2/f0exact)).*Harmonic_index_spacing);
Harmonic_indices = 1 + Harmonic_indices;
ExpFS=fftshift(DFSx).';

% Check for peaks within +/- 2 frequency samples
searchpeaks=[abs(ExpFS(Harmonic_indices-4)); abs(ExpFS(Harmonic_indices-3)); abs(ExpFS(Harmonic_indices-2));abs(ExpFS(Harmonic_indices-1));abs(ExpFS(Harmonic_indices));...
    abs(ExpFS(Harmonic_indices+1));abs(ExpFS(Harmonic_indices+2));abs(ExpFS(Harmonic_indices+3));abs(ExpFS(Harmonic_indices+4))];
searchindices=[(Harmonic_indices-4);(Harmonic_indices-3);(Harmonic_indices-2);(Harmonic_indices-1);Harmonic_indices;...
    (Harmonic_indices+1);(Harmonic_indices+2);(Harmonic_indices+3);(Harmonic_indices+4)];
[peaks, pkInd]=max(searchpeaks,[],1);

% Use the peak search row indices to extract the frequency axis indices of
% the peaks
Hind=0;
for ii=1:length(Harmonic_indices),
    Hind=[Hind,searchindices(pkInd(ii),ii)]; end;
Harmonic_indices= Hind(2:length(Hind));

HarmonicSeries=ExpFS(Harmonic_indices);
Ck= 2.*abs(HarmonicSeries(1:min([50,length(HarmonicSeries)])))
Thetak= angle(HarmonicSeries(1:min([50,length(HarmonicSeries)])))
return;

function [exact_periods_samples,f0exact] = TruncateToExactPeriods(x_samples,Fs)

% Iterate 3 times
for iteration=1:3,
    
    % Apply a window to reduce leakage and improve harmonic amplitude accuracy
    %x_samples_wind=x_samples.*flattopwin(length(x_samples));
    %x_samples_wind=x_samples.*hann(length(x_samples));
    % Use NO added window, because the exact frequency partial bin computation
    % is based on a rectangular window function frequency response
    x_samples_wind=x_samples;
    
    % Find the frequency spectrum (with leakage) to determine fundamental f0
    [DFSx,fcDFT,FdDFT]=FT(x_samples_wind,Fs,1);
    
    %Find the peak frequency (usually fundamental frequency)
    [DFSf0,f0_index]=max(abs(DFSx(1:floor(length(DFSx)/2)))); %look at negative F half of spectrum
    f0=fcDFT(f0_index);
    
    % Make sure there is no peak at a lower frequency (less negative, so higher index)
    [lower_f0_index]=find(abs(DFSx(1:floor(length(DFSx)/2)))> 0.1*DFSf0);
    
    if abs(lower_f0_index(length(lower_f0_index))-f0_index)> abs(0.2*f0/Fs*length(DFSx)),  % If a lower peak is more than 1/5 of the harmonic distance away
        [DFSf0,f0_index1]=max(abs(DFSx(lower_f0_index(length(lower_f0_index))-10:lower_f0_index(length(lower_f0_index))+10)));
        f0_index=lower_f0_index(length(lower_f0_index))-10+f0_index1-1;
    end;
    
    % Compute the exact fundamental freq by finding the frequency bin fraction
    % where the actual peak occurs, between the two highest response bins.
    % Assumes the frequency response has leakage, and that the leakage follows
    % the spectral response of a rectangular window.
    % Ref: http://www.tedknowlton.com/resume/FFT_Bin_Interp.html
    %Am2 = abs(DFSx(f0_index-2));
    Am1 = abs(DFSx(f0_index-1));
    A0 = abs(DFSx(f0_index));
    Ap1 = abs(DFSx(f0_index+1));
    %Ap2 = abs(DFSx(f0_index+2));
    f0_initial=fcDFT(f0_index);
    del_f_bin=fcDFT(f0_index)-fcDFT(f0_index-1);
    
    % NOTE: spectral peak found in the negative frequency bins
    if (Am1>Ap1)
        f0exact= abs(f0_initial)+(Am1/(Am1+A0))*del_f_bin
    else
        f0exact= abs(f0_initial)-(Ap1/(Ap1+A0))*del_f_bin
    end;
    
    %Compute the # samples in a period of the fundamental
    samp_per_period=Fs/f0exact;
    %samp_per_period=round(samp_per_period)
    % Compute the max # of exact periods available in waveform
    num_periods=length(x_samples) / samp_per_period;
    num_periods=floor(num_periods);
    
    %Truncate the samples to an exact number of periods
    %x_samples=x_samples(1:round((num_periods-1)*Fs/f0exact));  %Truncate
    %x_samples=x_samples(1:round((num_periods)*Fs/f0exact));  %Truncate
    % Find the peak of the 1st cycle.  Make this the starting point for min
    % phase
    [cycle_peak,cycle_peak_index]=max(x_samples(1:round(Fs/f0exact)));
    x_samples=x_samples(cycle_peak_index:cycle_peak_index+round((num_periods-1)*Fs/f0exact));  %Truncate
    
end;  % End of iteration loop
exact_periods_samples=x_samples;
return;