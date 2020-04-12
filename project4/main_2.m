%%%%%%%%%%%%% main_2.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%  Date:        04/11/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;

% Parameters initialization
F = 0.042;
theta = 0;
sigma = 24;
width = 2;

I = imread('texture2.gif');
img=zeros(size(I));
  
for i=1:size(I,1)
    for j=1:size(I,2)
        if(I(i,j)==1)
            img(i,j)=255;
        end
    end
end
  
gabor_img = gaborFilter(img,F, sigma, theta, width);

figure, imshow(gabor_img);

%%smoothen the image
[gx,gy]=gaussian(24,2);

i1=convolution(gabor_img,gx,1,24,2);
i2=convolution(i1,gy,2,24,2);

figure, imshow(i2);


