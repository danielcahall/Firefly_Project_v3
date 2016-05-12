function angle = getAngle(obj, newAngle, newRate, dt)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
obj.rate = newRate - obj.bias;
angle = obj.angle + (dt * obj.rate);

obj.P(1,1) = obj.P(2,2) + dt*(dt*obj.P(1, 1) - obj.P(1, 2) - obj.P(2,1) + obj.Q_angle);
obj.P(1,2) = obj.P(1, 2) - dt * obj.P(2,2);
obj.P(2,1) = obj.P(2,1) - (dt * obj.P(2,2));
obj.P(2,2) = obj.P(2,2) + obj.Q_bias * dt;

obj.S = obj.P(2,2) + obj.R_measure;
obj.K(1) = obj.P(2,2) / obj.S;
obj.K(2) = obj.P(2,1) / obj.S;

obj.y = newAngle - angle;
angle = angle+ obj.K(1) * obj.y;
obj.bias = obj.bias+ obj.K(2)* obj.y;

obj.P(2,2) = obj.P(2,2) - obj.K(1) * obj.P(2,2);
obj.P(1,2) = obj.P(1, 2)- obj.K(1) * obj.P(1, 2);
obj.P(2,1) = obj.P(2,1)- obj.K(2) * obj.P(2,2);
obj.P(2,2) = obj.P(2,2) - obj.K(2) * obj.P(1,2);
end
