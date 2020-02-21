%%%%%%%%%%%%% main_shape_analysis.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%  Date:        02/19/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;

[sd1,fn1,cmplx1]=granular_analysis('match1.gif',true);
    H = plot(sd1,'b');
    xlabel('r');
    ylabel('U(r)');
    % figure, stairs(H)    

[sd2,fn2,cmplx2]=granular_analysis('match3.gif',true);

% plot size distribution sd1 

% sdPlot = plot(sd1);
% xlabel('r');
% ylabel('U(r)');
% title('Size Distribution');
% plot pecstrum fn1


% In our case, match3 is the image whose objects are to be matched.
% Hence, referenced image is match1
wt= [1,1,1,1,1,1,1,1,1,0,1,0];  
distance=dist_calculation(fn2,fn1,wt);



