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
%      1.  Perform the dilation operation on image using structuring
%      element B.
%      2.  Perform the erosion operation on dilated image using B.
%      5.  Return the binary image.
% 
% The following functions are called:
%      erosion.m       performs erosion
%      dilation.m      performs dilation
%          
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/29/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function closed_img=close_op(X,B)

closed_img=dilation(X,B);
closed_img=erosion(closed_img,B);

return