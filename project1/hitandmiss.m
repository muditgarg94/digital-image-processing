%%%%%%%%%%%%% hitandmiss.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the Hit-or-Miss Transformation on image "RandomDisks-P10"
%
% Input Variables:
%      A     input the image "RandomDisks-P10.jpg"
%      B     structuring element using which operation will be performed
%      
% Returned Results:
%      noNoiseImg       finalImg
%
% Processing Flow:
%      1.  
%      2. 
%
%
%
%  Authors:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
%  Date:        1/30/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function transform=hitandmiss(X,A,B)

img1 = erosion(X,A);
compl=complement(X);
img2=erosion(compl,B);
transform=intersection(img1,img2);


return

