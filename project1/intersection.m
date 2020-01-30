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
%      1.  Calculate the size of image.
%      2.  Iterate the image. 
%      3.  If img(i,j)=1, set output(i,j)=0 else output(i,j)=1
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
%  Date:        1/28/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function output=intersection(A,B)

output=(double(A)-double(B))==0;

return