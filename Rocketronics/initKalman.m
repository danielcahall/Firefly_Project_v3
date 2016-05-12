


function [bias, angle] = initKalman( input_args )
P = zeros(2);%initalize covariance matrix
Q_angle = 0.001;
Q_bias = 0.003;
R_measure = 0.03;

angle = 0; %reset angle
bias = 0;  %reset bias


end

