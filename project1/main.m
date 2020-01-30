%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Convert the image to binary image
%
% Input Variables:
%      img     input 3D/2D image
%      
% Returned Results:
%      y       binary image
%
% Processing Flow:
%      1.  Calculate the size of given image.
%      2.  If it is a colored image, convert it to grayscale image.
%      3.  Calculate the threshold of a grayscale image. In our code, tnreshold is the avg value of
%      pixel.
%      4.  Iterate the grayscaled image. If value > threshold, set value
%       to 1. Set others as 0.
%      5. Return the binary image.
% 
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
%  Date:        1/29/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%reading the image
img=imread('RandomDisks-P10.jpg');

%convert the image to binary
img=convert2binary(img);

%remove noise using close and open operation
