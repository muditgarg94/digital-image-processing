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
%      1.  
%      2. 
%
%   The following functions are called:
%      find.m      find the locations of the specified pizel
%      imfill.m    fill image regions
%      intersection.m  return the intersection of 2 images
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