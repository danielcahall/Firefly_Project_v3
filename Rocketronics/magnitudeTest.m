w = 0:1/500:pi/2;
h = sin(w*3)./(3*sin(w));
plot(w/pi, abs(h));