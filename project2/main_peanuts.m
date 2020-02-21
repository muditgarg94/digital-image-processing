%%%%%%%%%%%%% main_peanuts.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       This file matches the 4 solid objects from "Peanuts" comic strip to
%       complementary image "shadow1rotated" using the min distance.
%
% Input Variables:
%       img     array of images
%      
% Returned Results:
%       distance       distance calculated using eqn.(6.11.10) PitasCh6
%
% Processing Flow:
%       1.  Calculate the pecstral value by calling granular_analysis
%           function.
%       2.  Determine the distance as per eqn.(6.11.10) PitasCh6 by calling
%           dist_calculation and identify the matching objects.
%
% The following functions are called:  granular_analysis
%                                      dist_calculation
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/20/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 clear;

%fill labels 2,4,5,7,8,10
[sd1,fn1] = granular_analysis('shadow1.gif',false,[2,4,5,7,8,10]); 

%fill lables 1,4,5,7,9
[sd2,fn2] = granular_analysis('shadow1rotated.gif',false,[1,4,5,7,9]);


% In this case, taking shadow1 as referenced image

%wt=[0.0262 0.0220 0.0377 0.0502 0.1444 0.3431 0 0.3556 0 0 0 0];
wt=[0.25,1,0.0001,0.7,0.1,0,0,0.023,0,0,0,0];  
distance=dist_calculation(fn2,fn1,wt);

disp(distance);


