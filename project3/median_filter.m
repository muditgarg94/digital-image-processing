%%%%%%%%%%%%% median_filter.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Apply the median filter on a given image and a mask
%
% Input Variables:
%       img     input image
%       mask    mask size
%
% Returned Results:
%       filtered_img      image after applying the median filter on given
%       image 'img'
%
% Processing Flow:
%       
%
% The following functions are called:  
%           padding:   Applies the padding of size mask/2 to the given image and returns the padded image. 
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/13/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function filtered_img = median_filter(img, mask)

if nargin ==1
    mask = 5;
end

padded_img = padding(img, mask);
[a, b] = size(img);
[m, n] = size(padded_img);
filtered_img = zeros(a, b);
p = floor(mask/2);
arr = zeros(mask*mask,1);


for i=p+1:m-p
    for j=p+1:n-p
        col=1;
        for new_i=i-p:i+p
            for new_j=j-p:j+p
                arr(col)=padded_img(new_i,new_j);
                col=col+1;
            end
        end
        filtered_img(i-p,j-p)=median(arr);
    end
end

% 
% for i = 1 : a
%         for j = 1 : b
%             mIndexArray=double([]);
%             subArray = double(img(i:i+double(p-1),j:j+double(p-1)));
%             subArray = subArray(:)';
%             for k = 1:length(mask)
%                 x = mask(k);
%                 for l = 1:x
%                      mIndexArray = [mIndexArray,subArray(k)];
%                 end
%             end
%             filtered_img(i,j) = double(median(mIndexArray));
%         end
% end

return




 

