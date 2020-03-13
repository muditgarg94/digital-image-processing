%%%%%%%%%%%%% alphatrimmed.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       to apply the alphatrimmed filter on an image using a given mask and
%       alpha
%
% Input Variables:
%       img     Input Image
%       alpha   alpha value
%       mask    Mask Size
%
% Returned Results:
%       filtered_img      Image after applying alpha trimmed filter on a given image
%       'img'
%
% Processing Flow:
%       1.  If the mask size is not given, default to 5.
%       2.  If the alpha value is not given, default it to 0.25.
%       2.  Create a padding around the image.
%       3.  Slide over the padded image equal to the size of mask.
%       4.  Store each pixel value in an array
%       5.  Once the silding window is iterated completely, sort the array.
%       6.  Calculate the sum of the sorted array values from
%       [floor(alpha*n)+1 to n-floor(alpha*n)].
%       7.  Divide the sum_val with the no of elements used for
%       calculating the sum.
%       8.  Set this average value as the pixel value of variable
%       'filtered_img'.
%
% The following functions are called:  
%       padding:   Applies the padding of size mask/2 to the given image and returns the padded image. 
%       sort:      Sort the array in ascending order
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/13/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function filtered_img=alphatrimmed(img,alpha,mask)
if nargin==1
    mask=5;
    alpha=0.25;
elseif nargin ==2
        mask=5;
    
end

padded_img=padding(img,mask);
[m,n]=size(padded_img);
[a,b]=size(img);
filtered_img=zeros(a,b);
p=floor(mask/2);
len=mask*mask;
an=floor(len*alpha);
alpha_len=len-2*(an);
arr=zeros(len,1);

for i=p+1:m-p
    for j=p+1:n-p
        col=1;
        for new_i=i-p:i+p
            for new_j=j-p:j+p
                arr(col)=padded_img(new_i,new_j);
                col=col+1;
            end
        end
        arr=sort(arr);
        sum_val=0;
        for k=an+1:len-an
            sum_val=sum_val+arr(k);
        end
        filtered_img(i-p,j-p)=sum_val/(alpha_len);
    end
end
return