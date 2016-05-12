function [x] = weightedMovingAverage(x, N)

M = N*(N+1)/2;
for i = N:length(x)
    y = 0;
    for j = 1:N
        y = y + j/M*x(j);
    end
    x(i) = y;
end


end

