%%%%%%%%%%%%% main_anisotropic.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

img=imread('cwheelnoise.gif');