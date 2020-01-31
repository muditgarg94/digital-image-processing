%%%%%%%%%%%%% intersection.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Return the intersection of two images
%
% Input Variables:
%      A     binary image1
%      B     binary image2
%      
% Returned Results:
%      output   intersection between A and B
%
% Processing Flow:
%      1.  Subtract the two images.
%      2.  Check condition if subtraction of 2 images is 0.
%      3.  Return the output image.
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/30/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function output=intersection(A,B)

[m,n]=size(A);
output=ones(m,n);
for i=1:m
    for j=1:n
        if(A(i,j)==0 && B(i,j)==0)
            output(i,j)=0;
        end
    end
end

return