clc
clear all
clear

% Converting GIF extension to PNG
imageList = {'texture1.gif','texture2.gif', 'd4d29.gif','d9d77.gif'};
giftopng(imageList)

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
imageList2 = {'texture1.png','texture2.png', 'd4d29.png','d9d77.png'};
for i = 1 : numel(imageList2)
  I = imread(imageList2{i});
  %[row, col, x] = size(I);
  imshow(I)
 % Apply Gabor Filter
  m1 = gaborFilter(I, gamma, lambda, theta, phi, sigma)
  imshow(m1)
  imwrite(m1,sprintf('%d.jpg',i))
% Apply smoothing Filter
% smoothImg = smoothingFilter();
end