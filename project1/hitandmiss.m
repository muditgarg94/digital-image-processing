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
%      transform       output image after hit and miss transformation
%
% Processing Flow:
%      1.  
%      2. 
%
%   The following functions are called:
%      erosion.m       perform the erosion operation
%      complement.m    return the complement of image
%      intersection.m  return the intersection of 2 images
%
%  Authors:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
%  Date:        1/30/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function transform=hitandmiss(X,A,B)

img1 = erosion(X,A);
figure, imshow(img1);
compl=complement(X);
img2=erosion(compl,B);
figure, imshow(img2);
transform=intersection(img1,img2);


return

