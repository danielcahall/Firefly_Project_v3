function kinematicAnalysis(accelerometer_data, fs)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Ts = 1/fs;
accel_samples = length(accelerometer_data);
velocity = zeros(size(accelerometer_data));
displacement = velocity;
t = 0 : Ts : (accel_samples-1)*Ts
for i = 2:accel_samples-1
    velocity(i-1) = (accelerometer_data(i-1)+accelerometer_data(i))*Ts;
    displacement(i-1) = (velocity(i-1)+velocity(i))*Ts;
end

plot(t, displacement);
xlabel('Time(s)');
ylabel('Displacement(m)');
figure;
plot(t, velocity);
xlabel('Time(s)');
ylabel('Velocity(m/s)');
end

