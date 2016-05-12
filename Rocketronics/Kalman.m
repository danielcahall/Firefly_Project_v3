classdef Kalman
    %UNTITLED12 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Q_angle; %% Process noise variance for the accelerometer
        Q_bias; %% Process noise variance for the gyro bias
        R_measure; %% Measurement noise variance - this is actually the variance of the measurement noise
        
        angle; %% The angle calculated by the Kalman filter - part of the 2x1 state vector
        bias; %% The gyro bias calculated by the Kalman filter - part of the 2x1 state vector
        rate; %% Unbiased rate calculated from the rate and the calculated bias - you have to call getAngle to update the rate
        
        P; %% Error covariance matrix - This is a 2x2 matrix
        K; %% Kalman gain - This is a 2x1 vector
        y; %% Angle difference
        S; %% Estimate error
    end
    
    methods
        function obj = Kalman() 
        %We will set the variables like so, these can also be tuned by the user
        obj.P = zeros(2);
        obj.Q_angle = 0.001;
        obj.Q_bias = 0.003;
        obj.R_measure = 0.1;
        obj.K = [0 0];

        obj.angle = 0; %% Reset the angle
        obj.bias = 0; %% Reset bias
        end
        
    end
end

