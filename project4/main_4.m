%%%%%%%%%%%%% main_3.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Main matlab function for problem 1
%
% Input Variables:
%
% Returned Results:
%
%
% Processing Flow:
%
% The following functions are called:  
%           gabor_filter
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        04/11/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;

% Parameters initialization
F = 0.6038;
theta = -50.5;
sigma = 8;
range = 2;

I = imread('d4d29.gif');
%img=ones(size(I));
img=double(I);
% for i=1:size(I,1)
%     for j=1:size(I,2)
%         %disp(I(i,j));
%         if(I(i,j)>=112 && I(i,j)<=210)
%             %disp("Iside")
%             img(i,j)=0;
%         end
%     end
% end

gabor_img = gaborFilter(img,F, sigma, theta, range);
figure, imshow(gabor_img,[])