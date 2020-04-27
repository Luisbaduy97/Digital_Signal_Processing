%% 
clear all
close all
clc

load 'ecgclase.mat'

fs=1000;
f=[0.1 0.9];
M=[0 1];
devs=[0.2 0.2];
[n,Wn,beta,ftype] = kaiserord(f,M,devs,fs);
n=300;
b= fir1(n,Wn,ftype,hanning(n+1),'noscale');

figure(1)
freqz(b,1,1024,fs)

%filtro pasa alto
figure(2)
plot(realecg);
title('señal ECG con ruido')
B=filter(b,1,realecg);
figure(3)
plot(B,'m')
title('ECG con pasa altos')
figure(4) 
title('Señal filtrada con pasa alto/ADC')
hold on 
plot(B,'r')
plot(ADC)
hold off

%filtro pasa bajos
fs=1000;
f=[100 110];
M=[1 0];
devs=[0.2 0.2];

[n,Wn,beta,ftype] = kaiserord(f,M,devs,fs);
b1=fir1(n,Wn,ftype,hanning(n+1),'noscale');
figure(5)
freqz(b1,1,1024,fs)

%filtrado pasa bajos
B1=filter(b1,1,B);
figure(6)
plot(B1,'m')
title('ECG con los dos filtros')
figure(7)
title('Señal filtrada con pasa alto y bajo/ADC')
hold on
plot(B1,'r')
plot(ADC)
hold off




