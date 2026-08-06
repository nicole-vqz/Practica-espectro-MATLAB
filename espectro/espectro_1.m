clear
close all
clc

fs = 48000;

%Notas musicales(frecuencias)
g = 391.9;
a = 440;%a y b son las distancia de frecuencia la distancia de cada uno
b = 493.2;%el punto (.) es la division ritmica
c = 523.25;%cantidad de ciclo por segunos
d = 587.33;
e = 659.26;

t = 0:1/fs:1;

% sin_1 = sin(2*pi*f*t);
% z = zeros(1,length(sin_1));
% secuencia_1 = [sin_1 z sin_1 z sin_1 z sin_1 z sin_1 z sin_1 z];

sg = sin(2*pi*g*t);
sa = sin(2*pi*a*t);
sb = sin(2*pi*b*t);
sc = sin(2*pi*c*t);
sd = sin(2*pi*d*t);
se = sin(2*pi*e*t);
z = zeros(1,length(sg));
x = [sg sa sb sg sg sa sb sg sb sc sd  z sb sc sd z sd se sd sc sb sg sd se sd sc sb sg sa sd sg z sa sd sg];
%"z" es el silencio
t = 0:1/fs:(length(x)-1)/fs;
%Cualquier senal se puede formar de seno y coseno
sound(x, fs); % Reproduce la melodía

% f = 440;
% fs = 8000;
% t = 0:1/fs:1;
% x = sin(2*pi*f*t);



% [x,fs] = audioread('speech_sample.wav');
% % info = audioinfo('soplo_cardiaco.wav');
% % [x fs] = audioread('soplo_cardiaco.wav');
% t = 0:1/fs:(length(x)-1)/fs;

L = length(x);
Y = fft(x);
P2 = abs(Y/L);
P1 = P2(1:floor(L/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;

figure;%para abrir la ventana
subplot(2,1,1)
plot(t,x);
title('Original')
grid on
subplot(2,1,2)
plot(f,P1) 
title('Espectro de X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
grid on