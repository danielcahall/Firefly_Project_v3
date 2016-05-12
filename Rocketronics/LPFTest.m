fc = 2; % Cut-off frequency (Hz)
fs = 100; % Sampling rate (Hz)
order = 5; % Filter order
t = 0:1/100:(length(a)/12/100)-1/100;
[B,A] = butter(order,2*fc/fs); % [0:pi] maps to [0:1] here
y = filter(B, A, Accel);
plot(t, y);
hold on;
plot(t, yAccel);