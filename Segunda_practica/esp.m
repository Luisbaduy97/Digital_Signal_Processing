function [w, val, letra] = esp(signal, fs, letra)
L = length(signal);
NFFT = 2^nextpow2(L);
F = fft(signal, NFFT)/L;
w = fs/2*linspace(0,1,NFFT/2);
val = 2*abs(F(1:NFFT/2));
plot(w, val)
% title(letra)
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
end
