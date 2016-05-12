function [y] = butterLPF(x, fc, fs, t, order)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[B,A] = butter(order,2*fc/fs); % [0:pi] maps to [0:1] here
y = filter(B, A, x);
plot(t, y);
end

