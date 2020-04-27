%% Codigo EMG
clear all 
close all
clc

load 'emg.mat';
load('EMG_2.txt');
H = HP_EMG;
B = BP_EMG;
SOS = [1,-2,1,1,-1.94669754075618,0.948081706106740];
G = [0.973694811715731;1];
SOS_L = [1,2,1,1,-1.34896774525279,0.513981894219676];
G_L = [0.0412535372417203;1];
x=0; 
y=0; 
z=0; 
w=0;
x1=0; 
y1=0; 
z1=0; 
w1=0;
for i=1:1:length(emg)
    x=G(1,1)*emg(i);
    y(i)=SOS(1,1)*x+z;
    z=SOS(1,2)*x-SOS(1,5)*y(i)+w;
    w=SOS(1,3)*x-SOS(1,6)*y(i);
    x1=G_L(1,1)*y(i);
    y1(i)= SOS_L(1,1)*x1+z1;
    z1=SOS_L(1,2)*x1-SOS_L(1,5)*y1(i)+w1;
    w1=SOS_L(1,3)*x1-SOS_L(1,6)*y1(i);
    
end

plot(y1, 'b')%filtrado
hold on
plot(emg, 'r')%original
legend('EMG Filtrado', 'EMG Original')


load('EMG_2.txt');