%%%%%%%%%%%%% snn_mean_filter.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       to apply the symmetric nearest neighbor mean on an image using a given mask
%
% Input Variables:
%       img     Input Image
%       mask    Mask Size
%
% Returned Results:
%       filtered_img      Image after applying snn mean filter on a given image
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
%  Date:        03/13/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function filtered_img=snn_mean_filter(img,mask)
if nargin==1
    mask=5;
end

padded_img=padding(img,mask);
[m,n]=size(padded_img);
[a,b]=size(img);
filtered_img=zeros(a,b);
p=floor(mask/2);

nn=zeros((mask*mask)-1,2);
for i=p+1:m-p
    for j=p+1:n-p
        window=padded_img(i-p:i+p,j-p:j+p);
        
        row=1;
        for new_i=1:p+1
            for new_j=1:mask
                if(new_i==p+1 && new_j>p)
                    break;
                else
                    nn(row,1)=window(new_i,new_j);
                    nn(row,2)=window(end-new_i+1,end-new_j+1);
                    row=row+1;
                end
            end
        end
        nn_diff=nn-padded_img(i,j);
        sum_val=0;
        for k=1:length(nn)
            if nn_diff(k,1)<=nn_diff(k,2)
                val=nn(k,1);
            else
                val=nn(k,2);
            end
            sum_val=sum_val+val;
        end
        avg=sum_val/length(nn);
        filtered_img(i-p,j-p)=(avg+padded_img(i,j))/2;
        
    end
end
return