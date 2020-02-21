%%%%%%%%%%%%% main_peanuts.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       This file matches the 4 solid objects from "Peanuts" comic strip to
%       complementary image "shadow1rotated" using the min distance.
%
% Input Variables:
%       img     array of images
%      
% Returned Results:
%       y       binary image
%
% Processing Flow:
%       1.  Read images "bear.gif" and "penn256.gif".
%       2.  Create the structuring element B, both background and
%
% The following functions are called:  granular_analysis
%                                      dist_calculation
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/20/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 clear;


%fill labels 2,4,5,7,8,10
[sd1,fn1]=granular_analysis('shadow1.gif',false,[2,4,5,7,8,10]); 

%fill lables 1,4,5,7,9
[sd2,fn2]=granular_analysis('shadow1rotated.gif',false,[1,4,5,7,9]);


% In this case, taking shadow1 as referenced image
%wt=[0.0262 0.0220 0.0377 0.0502 0.1444 0.3431 0 0.3556 0 0 0 0];
wt= [1,1,1,1,1,1,1,1,1,0,1,0];  
distance=dist_calculation(fn1,fn2,wt)