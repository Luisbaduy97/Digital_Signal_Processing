function Hd = high_pass
%HIGH_PASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.1 and the Signal Processing Toolbox 7.3.
% Generated on: 16-Oct-2019 12:12:56

% FIR Window Highpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = 250;  % Sampling Frequency

N    = 300;      % Order
Fc   = 0.3;      % Cutoff Frequency
flag = 'scale';  % Sampling Flag

% Create the window vector for the design algorithm.
win = hamming(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'high', win, flag);
Hd = dfilt.dffir(b);

% [EOF]
