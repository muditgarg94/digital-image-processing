%%%%%%%%%%%%% union_op.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the union of two images
%
% Input Variables:
%      img1     input image 1
%      img2     input image 2
%      
% Returned Results:
%      result       union of img1 and img2
%
% Processing Flow:
%      1.  create a matrix of ones with a size of any of the image
%           (Assuming both the images are of same size)
%      2.  Iterate the matrix. If any of the images at current pixel has
%      value 0, set the value to 0
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/31/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function result= union_op(img1, img2)

[m,n]=size(img1);

result=ones(m,n);

for i =1:m
    for j=1:n
        if(img1(i,j)==0 || img2(i,j)==0)
            result(i,j)=0;
        end
    end
end

result=result==1;

return