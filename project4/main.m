


I = imread(imfile); 
[row, col, x] = size(I);
 

J = (2.^(0 : log2(col/8)) - .5) ./ col;
F = [ (.25 - J) (.25 + J) ]; F = sort(F);
lambda = 1 ./ F;
gamma = 1;
b = 1; 
theta = 0:pi/6:pi-pi/6; 
phi = 0;
m1 = gaborFilter(gamma, lambda, b, theta, phi)