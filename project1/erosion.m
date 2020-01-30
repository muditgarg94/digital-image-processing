%%%%%%%%%%%%% erosion.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the erosion operation on image
%
% Input Variables:
%      A     input binary image on which operation will be performed
%      B     structuring element using which operation will be performed
%      
% Returned Results:
%      eroded_val       eroded image
%
% Processing Flow:
%      1.  Load input image
%      2.  If it is colored, covert to gray scale
%      3.  Calculate threshold. In our code, tnreshold is the avg value of
%      pixel.
%      4.  Iterate the grayscaled image. If value > threshold, set value
%       to 255. Set others as 0.
%      5.  Convert the data type of binary image to uint8 and return it.
%
%
%  Authors:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
%  Date:        1/28/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function eroded_val=erosion(A,B)
return