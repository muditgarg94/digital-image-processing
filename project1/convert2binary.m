%%%%%%%%%%%%% convert2binary.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Convert the image to binary image
%
% Input Variables:
%      img     input 3D/2D image
%      
% Returned Results:
%      y       binary image
%
% Processing Flow:
%      1.  Calculate the size of given image.
%      2.  If it is a colored image, convert it to grayscale image.
%      3.  Calculate the threshold of a grayscale image. In our code, tnreshold is the avg value of
%      pixel.
%      4.  Iterate the grayscaled image. If value > threshold, set value
%       to 1. Set others as 0.
%      5. Return the binary image.
%          
%
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
%  Date:        1/28/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function y=convert2binary(img)

[p,q,r]=size(img);

%converting the colored image to grayscaled image
if(r==3)
    red=img(:,:,1);
    green=img(:,:,2);
    blue=img(:,:,3);
    img=0.2989 * red + 0.5870 * green + 0.1140 * blue;

end

%evaluating the threshold
val=sum(sum(img));
threshold=val/(p*q);

%creating a binary image
y=zeros(p,q);
img=double(img);
for i=1:p
    for j=1:q
        if(img(i,j)>threshold)
            y(i,j)=1;
        end
    end
end

return