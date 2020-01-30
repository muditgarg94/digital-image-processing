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

%reading the image
img=imread('RandomDisks-P10.jpg');
%converting it to binary image
img=convert2binary(img);
%imshow(img);
[M,N]=size(img);

%creating a variable that will store the image without salt and pepper
%noise
filtered_img=zeros(M,N);

%removing the noise using open/close operation



%converting the datatype of img from double to uint8
%filtered_img=uint8(filtered_img);
%imshow(filtered_img);

