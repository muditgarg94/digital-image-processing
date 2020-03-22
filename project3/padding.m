%%%%%%%%%%%%% padding.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Pad the image as per the mask size.
%
% Input Variables:
%       img     image to be padded.
%       mask    mask value
%
% Returned Results:
%       padded_img      padded image
%
% Processing Flow:
%       1.  Let [m,n] be the original image size
%       2.  Create a matrix of zeros of size [m+2p,n+2p], where p
%       =floor(mask/2)
%       3.  Start from p+1 and fill in with the image values.
%       4.  In the end, new image will be padded all around by zeros of
%       size p.
%
%
% The following functions are called:  
%       None
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/10/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function padded_img=padding(img,mask)


p=floor(mask/2);
padded_img=zeros(size(img,1)+2*p,size(img,2)+2*p);

[m,n]=size(padded_img);

for i=p+1:m-p
    for j=p+1:n-p
        %disp(i+","+j)
        padded_img(i,j)=img(i-p,j-p);
    end
end
return