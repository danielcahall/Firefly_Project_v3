K = Kalman;
newXAngle = zeros(size(yAngle));
P = zeros(2);
for i = 1:length(yAngle)
    newYAngle(i) = getAngle(K,K.angle, yAngle(i), 1/100);
end