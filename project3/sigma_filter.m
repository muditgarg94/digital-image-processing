%%%%%%%%%%%%% alphatrimmed.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       to apply the alphatrimmed filter on an image using a given mask and
%       alpha
%
% Input Variables:
%       img     Input Image
%       sigma   sigma value
%       mask    Mask Size
%
% Returned Results:
%       filtered_img      Image after applying alpha trimmed filter on a given image
%       'img'
%
% Processing Flow:
%       1.  If the mask size is not given, default to 5.
%       2.  If the sigma value is not given, default it to 20.
%       2.  Create a padding around the image.
%       3.  Slide over the padded image equal to the size of mask.
%       4.  Subtract each pixel in sliding window with the middle pixel of
%       the window
%       5.  If the difference is less than equal to sigma, add the pixel
%       value to a variable.       
%       6.  If the sum is not 0, set the average value as pixel value of
%       filtered img.
%       7.  Else, set the original value as pixel value.
%
% The following functions are called:  
%       padding:   Applies the padding of size mask/2 to the given image and returns the padded image. 
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function filtered_img=sigma_filter(img,sigma,mask)
if nargin==1
    mask=5;
    sigma=20;
elseif nargin ==2
        mask=5;
    
end

padded_img=padding(img,mask);
[m,n]=size(padded_img);
[a,b]=size(img);
filtered_img=zeros(a,b);
p=floor(mask/2);
sigma=2*sigma;

for i=p+1:m-p
    for j=p+1:n-p
        count=0;
        sum_val=0;
        mid=padded_img(i,j);
        for new_i=i-p:i+p
            for new_j=j-p:j+p
                if padded_img(new_i,new_j)-mid<=sigma
                    sum_val=sum_val+padded_img(new_i,new_j);
                    count=count+1;
                end
            end
        end
        if(count~=0)
            filtered_img(i-p,j-p)=round(sum_val/count);
        else
            filtered_img(i-p,j-p)=mid;
        end
        
    end
end
return