

% Parameters initialization
F = 0.059;
%F = 0:042;
theta = 135;
phi = 0;
sigma = 8;
%sigma = 24;
phi = 0;
lambda = 1 ./ F;
gamma = 1;

% Reading the image
%img = imread('texture2.gif');
[I,cmap] = imread('texture1.gif','frames','all');
image(I);
colormap(cmap);
[row, col, x] = size(I);

% Apply Gabor Filter
m1 = gaborFilter(I, gamma, lambda, theta, phi, sigma)

% Apply smoothing Filter