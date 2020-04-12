%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       to apply the alphatrimmed filter on an image using a given mask and
%       alpha
%
% Input Variables:
%       img     Input Image
%       sigma   sigma value
%       mask    Mask Size
%
% Returned Results:
%       filtered_img      Image after applying alpha trimmed filter on a given image
%       'img'
%
% Processing Flow:
%       1.  If the mask size is not given, default to 5.
%       2.  If the sigma value is not given, default it to 20.
%       2.  Create a padding around the image.
%       3.  Slide over the padded image equal to the size of mask.
%       4.  Subtract each pixel in sliding window with the middle pixel of
%       the window
%       5.  If the difference is less than equal to sigma, add the pixel
%       value to a variable.       
%       6.  If the sum is not 0, set the average value as pixel value of
%       filtered img.
%       7.  Else, set the original value as pixel value.
%
% The following functions are called:  
%       padding:   Applies the padding of size mask/2 to the given image and returns the padded image. 
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc
clear all


% Converting GIF extension to PNG
%imageList = {'texture1.gif','texture2.gif', 'd4d29.gif','d9d77.gif'};
%giftopng(imageList)

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
  [h_x, h_y] = gaborFilter(F, sigma, theta, width);

  %Apply convolution
  [m1] = convolut(I, h_x, sigma, range);
 
  % Output image visualization 
  imshow(m1)
  imwrite(m1,sprintf('%d.jpg',i))
  
  % Apply smoothing Filter
  [g_x, g_y] = smoothingFilter(sigma, width);
  
  %Apply convolution
  [m1] = convolut(I, g_x, sigma, range);
 
  % Output image visualization 
  imshow(m1)
  imwrite(m1,sprintf('%d.jpg',i))
  
end