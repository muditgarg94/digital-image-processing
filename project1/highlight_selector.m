%%%%%%%%%%%%% highlight_selector.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Hightlights the object detected after transformation
%
% Input Variables:
%      original_img     filtered original image on which tasks are
%      performed
%      transformed_img   image after performing hit or miss transform
%      
% Returned Results:
%      new_img       highlighted  image
%
% Processing Flow:
%      1.  Find the locations in transformed image where pixel=0
%      2.  Fill the original image at the locations found in step 1.
%      3.  intersect the original image and and the complement of image
%      formed in step 2.
%      4.  Perform the logical operation on new_img
%
%   The following functions are called:
%      find.m          find the locations of the specified pizel
%      imfill.m        fill image regions
%      intersection.m  return the intersection of 2 images
%      complement.m    return the complement of image passed.
%
%  Authors:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/31/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function new_img=highlight_selector(original_img,transformed_img)



[row,col]=find(transformed_img==0);

x=imfill(original_img,[row,col]);

new_img=intersection(original_img,complement(x));

new_img=new_img==1;
return