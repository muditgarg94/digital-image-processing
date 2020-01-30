%%%%%%%%%%%%% complement.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Return the complement of given image
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
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
%  Date:        1/28/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function output=complement(img)

[m,n]=size(img);
output=zeros(m,n);

for i=1:m
    for j=1:n
        if(img(i,j)==1)
            output(i,j)=0;
        else
            output(i,j)=1;
        end
    end
end

return