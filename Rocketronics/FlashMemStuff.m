clear all
A = fopen('flashmem8.txt', 'r');
a = fscanf(A, '%x %x %x');
a = a';
x = 1;
for i = 1:6:length(a) - (length(a)/6)
    temp(x) = a(i);
    a(i) = [];
    x = x+1;
end
len = length(a);
for i = 1:6:len
    xAccel_1 = dec2bin(a(i), 8);
    xAccel_2 = dec2bin(a(i+1), 8);
    xAccel = strcat(xAccel_1, xAccel_2);
    xAccel = bin2dec(xAccel);
end
y = 1;
for i = 3:6:len
    yAccel_1 = dec2bin(a(i), 8);
    yAccel_2 = dec2bin(a(i+1), 8);
    yAccel = strcat(yAccel_1, yAccel_2);
    yAccel = bin2dec(yAccel);
    yAcceleration(y) = yAccel;
    y = y+1;
end
z = 1;
for i = 5:6:len
    zAccel_1 = dec2bin(a(i), 8);
    zAccel_2 = dec2bin(a(i+1), 8);
    zAccel = strcat(zAccel_1, zAccel_2);
    zAccel = bin2dec(zAccel);
    zAcceleration(z) = zAccel;
    z = z+1;
end
    
    