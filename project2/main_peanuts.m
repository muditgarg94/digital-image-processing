%%%%%%%%%%%%% main_peanuts.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%       1.  Read images "bear.gif" and "penn256.gif".
%       2.  Create the structuring element B, both background and
%           foreground.
%       3.  Call skeltonization function for both images individually to
%           perfor homotopic skeletonization.
%
% The following functions are called:
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/20c/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear;


%fill labels 2,4,5,7,8,10
[sd1,fn1]=granular_analysis('shadow1.gif',false,[2,4,5,7,8,10]); 

%fill lables 1,4,5,7,9
[sd2,fn2]=granular_analysis('shadow1rotated.gif',false,[1,4,5,7,9]);


% In this case, taking shadow1 as referenced image
distance=dist_calculation(fn2,fn1,[0.022,0.037,0.09,0.62])