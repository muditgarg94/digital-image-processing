%%%%%%%%%%%%% hitandmiss.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the Hit-or-Miss Transformation on image "RandomDisks-P10"
%
% Input Variables:
%      X     input binary image
%      A     first structuring element
%      B     second structuring element
%      
% Returned Results:
%      transform       output image after hit-or-miss transformation
%
% Processing Flow:
%      1.  Perform the erosion operation on image X using A.
%      2.  Perform the erosion operation on complement(X) using B.
%      3.  Find the intersection between the images found in step 1 and
%      step 2.
%
%   The following functions are called:
%      erosion.m       perform the erosion operation
%      complement.m    return the complement of image
%      intersection.m  return the intersection of 2 images
%
%  Authors:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/30/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function transform = hitormiss(X, B, A)

img1 = erosion(X, A);
%figure, imshow(img1);
compl = complement(X);
img2 = erosion(compl, B);
%figure, imshow(img2);
transform = intersection(img1, img2);

return

