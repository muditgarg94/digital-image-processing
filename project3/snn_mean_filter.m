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
%       3.  Get the window equal to size of mask.
%       4.  For each window, group together the symmetrical pairs.
%       5.  Subtract the middle most element of the window with each value
%       in pair.
%       6. Select the pixel from each pair that is closed to middle pixel
%       i.e have the least difference.
%       7. Take the average of all these pixels.
%       8. Again take the mean of the averaged value and the original pixel
%       9. Set this mean value as the filtered image value.
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

nn=zeros(((mask*mask)-1)/2,2);
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
                    nn(row,2)=window(mask-new_i+1,mask-new_j+1);
                    %disp(new_i);
                    %disp(new_j);
                    %disp(mask-new_i+1);
                    %disp(mask-new_j+1);
                    row=row+1;
                end
            end
        end
        %disp(nn);
        nn_diff=nn-padded_img(i,j);
        %disp(nn_diff)
        sum_val=0;
        for k=1:length(nn)
            if abs(nn_diff(k,1))<=abs(nn_diff(k,2))
                val=nn(k,1);
            else
                val=nn(k,2);
            end
            sum_val=sum_val+val;
        end
        avg=(sum_val+padded_img(i,j))/(length(nn)+1);
        %avg=sum_val/length(nn);
        filtered_img(i-p,j-p)=round(avg);
        
    end
end
return