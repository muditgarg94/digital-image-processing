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
bear=bear==1;

penn=imread(img(2));
penn=penn==1;
% generate the 16 structuring elements
bb=zeros(3,3,8);
bf=zeros(3,3,8);
bb(:,:,1)=[1,1,1;0,0,0;0,0,0];
bf(:,:,1)=[0,0,0;1,1,0;1,1,1];
bb(:,:,2)=[0,1,1;0,0,1;0,0,0];
bf(:,:,2)=[0,0,0;1,1,0;1,1,0];
bb(:,:,3)=[0,0,1;0,0,1;0,0,1];
bf(:,:,3)=[1,0,0;1,1,0;1,0,0];
bb(:,:,4)=[0,0,0;0,0,1;0,1,1];
bf(:,:,4)=[1,1,0;1,1,0;0,0,0];

for i=1:4
    bb(:,:,i+4)=rotate180(bb(:,:,i));
    bf(:,:,i+4)=rotate180(bf(:,:,i));
end


bear_skeleton=skeletonization(bear,bf,bb);
penn_skeleton=skeletonization(penn,bf,bb);



