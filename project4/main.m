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
width = 2;

% Reading the image
imageList2 = {'texture1.png','texture2.png', 'd4d29.png','d9d77.png'};
for i = 1 : numel(imageList2)
  I = imread(imageList2{i});
  imshow(I)
  [h_x,h_y] = gaborFilter(F, sigma, theta, width);

  %Apply convolution
  [i1] = convolut(I, h_x, sigma, range);
 
  
  imshow(m1)
  imwrite(m1,sprintf('%d.jpg',i))
  
% Apply smoothing Filter
smoothImg = smoothingFilter(sigma);
end