clc; close all; clear all; format compact;

ts = .01;
t = 0:ts:10;

f1 = 1; %[Hz]
f4 = 4;
f8 = 8;

w1 = f1 * 2*pi; %[rad/s = 1/s * rad]
w4 = f4 * 2*pi;
w8 = f8 * 2*pi;

x1 = sin(w1*t);
x4 = sin(w4*t);
x8 = sin(w8*t);

X1 = fft(x1);
X4 = fft(x4);
X8 = fft(x8);

n = length(X1);
f = (1:n)/n/ts; %see ece630/wk3/DFTFrequencies.pdf

figure;
subplot(2,1,1); hold on;
plot(t,x1);
plot(t,x4);
plot(t,x8);

xlabel('Time [s]');

subplot(2,1,2); hold on;
plot(f,abs(X1),'k.-');
plot(f,abs(X4),'b.-');
plot(f,abs(X8),'r.-');
% plot(f,fftshift(abs(X8)),'g.-');

xlabel('Frequency [Hz]');