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
%       1. Run all the filters on given image.
%       2. Save the images at 1st and 5th iteration
%       3. Save the histogram of the final iteration of each filter.
%
% The following functions are called:  
%       mean_filter
%       median_filter
%       alphatrimmed
%       sigma_filter
%       snn_mean_filter
%       str2func
%       histogram
%       meanandstd
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/14/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

original_img=imread('disk.gif');
%figure, imshow(original_img);

filters=["mean_filter";"median_filter";"alphatrimmed";"snn_mean_filter";"sigma_filter"];

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
            [mu,std]=meanandstd(img);
            disp('mean of larger disk after applying '+name+' = '+mu);
            disp('std of larger disk after applying '+name+' = '+std);
            %figure, imshow(img);
            filename=sprintf('%s_5.gif',name{1});
            imwrite(img,filename);
            filename=sprintf('%s_hist.jpg',name{1});
            histogram(img,filename);
            
        end
    end
end