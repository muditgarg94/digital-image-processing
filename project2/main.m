%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Perform the homotopic skeletonization on penn256 and bear images
%
% Input Variables:
%       img     array of images
%       bear    bear image
%       penn    penn256 image
%      
% Returned Results:
%       y       binary image
%
% Processing Flow:
%       1.  
%
%
% The following functions are called:
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/16/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
%reading both images (bear.gif and penn256.gif)
img = ["bear.gif" ; "penn256.gif"];

bear=imread(img(1));
penn=imread(img(2));

% generate the 16 structuring elements
bb=zeros(3,3,8,1);
bf=zeros(3,3,8,1);
b1_b=[0,0,0;1,1,1;1,1,1];
b1_f=[1,1,1;1,0,1;0,0,0];









