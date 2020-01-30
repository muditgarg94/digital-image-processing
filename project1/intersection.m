%%%%%%%%%%%%% intersection.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Return the intersection of two images
%
% Input Variables:
%      A     binary image1
%      B     binary image2
%      
% Returned Results:
%      output   intersection between A and B
%
% Processing Flow:
%      1.  Subtract the two images.
%      2.  Check condition if subtraction of 2 images is 0.
%      3.  Return the output image.
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
%  Date:        1/30/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function output=intersection(A,B)

output=(double(A)-double(B))==0;

return