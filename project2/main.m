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
%      1.  
%
%
% The following functions are called:
%      imread.m              read the image
%      convert2binary.m      convert the image to a binary image
%      hitormiss.m           perform the hit and miss transform on the binary image
%      imwrite.m             saves the image to disk
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/29/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
%reading both images (bear.gif and penn256.gif)
img = ["bear.gif" ; "penn256.gif"];

imgX=imread(img(1));
imgY=imread(img(2));

% generate the 16 structuring elements

%perform Hit or miss transformation

% Do Xi - corresponding hit or miss transform






