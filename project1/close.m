%%%%%%%%%%%%% close.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the close operation on image
%
% Input Variables:
%      X     input 2D binary image
%      B     structuring element
%      
% Returned Results:
%      closed_img       image after performing close operation
%
% Processing Flow:
%      1.  Calculate the size of given image.
%      2.  If it is a colored image, convert it to grayscale image.
%      3.  Calculate the threshold of a grayscale image. In our code, tnreshold is the avg value of
%      pixel.
%      4.  Iterate the grayscaled image. If value > threshold, set value
%       to 1. Set others as 0.
%      5. Return the binary image.
% 
% The following functions are called:
%      erosion.m       performs erosion
%      dilation.m      performs dilation
%          
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
%  Date:        1/29/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function closed_img=close(X,B)

[m,n]=size(X);

closed_img=zeros(m,n);

return