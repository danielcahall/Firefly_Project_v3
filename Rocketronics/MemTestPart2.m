clear all
A = fopen('flashmem21.txt', 'r');
a = fscanf(A, '%x %x %x');
a = a';
x = 1;
t = 0:1/100:(length(a)/100);
g = 0;
for i = 1:length(a)-1
    MSB = dec2bin(a(i+1));
    LSB = dec2bin(a(i));
    y=strcat(MSB, LSB);
    y = logical((y(:)'-'0'));
    y = bi2de(y);
%     g = 0.9 * g + 0.1 * y;
%     y = y - g;
    yAccel(x) = y/2048;
    yAccel(x) = yAccel(x)/9.8;
    x = x+1;
end
x = 1;
for z = 1:length(a) - 1
    yJerk(x) = (yAccel(x+1) - yAccel(x))/(1/100);
    if yJerk(x) < 150
        yAccel(x) = 0;
    else
        yAccel(x) = yJerk(x) * 1/100;
    end
end
% yAccel(idx) = [];
% figure;plot(yAccel);
% idx = find(yAccel==max(yAccel),1,'first');
% yAccel(idx) = [];
% idx = find(yAccel==max(yAccel),1,'first');
% yAccel(idx) = [];
% idx = find(yAccel==max(yAccel),1,'first');
% yAccel(idx) = [];
% idx = find(yAccel==max(yAccel),1,'first');
% yAccel(idx) = [];
fs = 100;
m = length(a);
nfft = 2^nextpow2(m);
y = fft(yAccel,nfft)/m;
f = fs/2 * linspace(0,1,nfft/2+1);
power = abs(y);
figure;plot(f,power(1:nfft/2+1));
figure;plot(t(1:length(t)-2), yAccel);
yAccel = movingMedianFilter(yAccel, 10);
% yAccel = movingAverageFilter(yAccel, 10);
figure;plot(t(1:length(t)-2), yAccel);
figure;
disp = deriveDisp(yAccel, 1/100);
%disp = deriveDisp(yAccel, 1/100);
plot(t(1:length(t)-2), disp);
% figure;
% z = fft(disp,nfft)/m;
% power = abs(z);
% plot(f,power(1:nfft/2+1));
