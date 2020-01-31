%%%%%%%%%%%%% open_op.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the open operation on image
%
% Input Variables:
%      img     image on which open operation needs to be performed
%      B       structuring element 
%      
% Returned Results:
%      output   image opened by B
%
% Processing Flow:
%      1.  Perform the erosion on image using B.
%      2.  Perform the dilation on eroded image usng B.
%
% The following functions are called:
%      erosion.m     perform the erosion operation.
%      dilation.m    perform the dilation operation.
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/28/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function output=open_op(img,B)

output=erosion(img,B);
output=dilation(output,B);

return 