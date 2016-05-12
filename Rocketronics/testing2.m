dt = 0.01; % seconds per sample 
N = 1024; % number of samples 
t = 0 : dt : (N-1)*dt; % in seconds 
wave_freq = 1; % in Hertz 
acc_time_data = sin(2*pi*wave_freq*t);
disp_time_data = deriveDisp(acc_time_data, dt);
plot(t, acc_time_data);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
figure;
plot(t, disp_time_data);
xlabel('Time (s)');
ylabel('Displacement (m)');
figure;
analytic_disp = -1/(2*pi*wave_freq)^2*sin(2*pi*wave_freq*t);
plot(t, analytic_disp);
xlabel('Time (s)');
ylabel('Displacement (m)');
