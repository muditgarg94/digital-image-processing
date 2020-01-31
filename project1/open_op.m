%%%%%%%%%%%%% open_op.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the open operation on image
%
% Input Variables:
%      img     image for which complement needs to be returned.
%      
% Returned Results:
%      output   complement of image
%
% Processing Flow:
%      1.  Calculate the size of image.
%      2.  Iterate the image. 
%      3.  If img(i,j)=1, set output(i,j)=0 else output(i,j)=1
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/28/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function output=open_op(img,B)

output=erosion(img,B);
output=dilation(output,B);

return 