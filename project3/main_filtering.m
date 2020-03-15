%%%%%%%%%%%%% main_filtering.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%       mean_filter
%       median_filter
%       alphatrimmed
%       sigma_filter
%       snn_mean_filter
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/14/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

original_img=imread('disk.gif');
%figure, imshow(original_img);

filters=["mean_filter";"median_filter","alphatrimmed","snn_mean_filter"];

for i=1:length(filters)
    name=filters(i);
    filter=str2func(name);
    img=original_img;
    for j=1:5
        img=uint8(filter(img));
        if(j==1)
            %figure, imshow(img);
            filename=sprintf('%s_1.gif',name{1});
            imwrite(img,filename);
        elseif(j==5)
            %figure, imshow(img);
            filename=sprintf('%s_5.gif',name{1});
            imwrite(img,filename);
        end
    end
end