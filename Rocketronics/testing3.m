fs = 100; % samples per second 
N = 1024; % number of samples 
t = 0 : 1/fs : (N-1)*(1/fs); % in seconds 
wave_freq = 1; % in Hertz 
acc_time_data = sin(2*pi*wave_freq*t);
plot(t, acc_time_data);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
kinematicAnalysis(acc_time_data, fs);