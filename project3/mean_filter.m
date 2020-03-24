%%%%%%%%%%%%% mean_filter.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       to apply the mean filter on an image using a given mask
%
% Input Variables:
%       img     Input Image
%       mask    Mask Size
%
% Returned Results:
%       filtered_img      Image after applying mean filter on a given image
%       img
%
% Processing Flow:
%       1.  If the mask size is not given, default to 5.
%       2.  Create a padding around the image.
%       3.  Slide over the padded image equal to the size of mask.
%       4.  Calculate the sum using each pixel value in a sliding window.
%       5.  Once the silding window is iterated completely, divide the sum
%       with the size of mask.
%       6. Set the average value as the pixel value of filtered_img.
%
% The following functions are called:  
%       padding: Applies the padding of size mask/2 to the given image and returns the padded image. 
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/10/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function filtered_img=mean_filter(img,mask)
if nargin==1
    mask=5;
end

padded_img=padding(img,mask);
[m,n]=size(padded_img);
[a,b]=size(img);
filtered_img=zeros(a,b);
p=floor(mask/2);


for i=p+1:m-p
    for j=p+1:n-p
        sum_val=0;
        for new_i=i-p:i+p
            for new_j=j-p:j+p
                sum_val=sum_val+padded_img(new_i,new_j);
       
            end
        end
        filtered_img(i-p,j-p)=round(sum_val/(mask*mask));
        
    end
end
return