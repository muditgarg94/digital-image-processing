%%%%%%%%%%%%% main_1.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Main matlab function for problem 1
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
%  Date:        04/11/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;

% Parameters initialization
F = 0.059;
theta = 135;
sigma = 8;
width = 2;

I = imread('texture2.gif');
%img=zeros(size(I));
img=double(I.*255);


figure, imshow(img, []);

gabor_img = gaborFilter(img,F, sigma, theta, width);
% for i=1:size(gabor_img,1)
%     for j=1:size(gabor_img,2)
%         if(gabor_img(i,j)>0)
%             gabor_img(i,j)=255;
%         end
%     end
% end


figure, imshow(gabor_img, []);

%figure, mesh(I), colormap(jet);
%figure, mesh(gabor_img), colormap(jet);

%%smoothen the image
[gx,gy]=gaussian(24,width);

i1=convolution(gabor_img,gx,1,24,width);
i2=convolution(i1,gy,2,24,width);

figure, imshow(i2,[]);

mask=segmentation(i2,img);
%figure, imhist(mask);
[r,c]=size(mask);
segmented=zeros(r,c);

for i=1:r
    for j=1:c
        if(mask(i,j)>0.6)
            segmented(i,j)=1;
        end
    end
end

output=segmented.*img;

figure, imshow(output)

fused=imfuse(img,segmented);
figure, imshow(fused);
% for index = 1 : numel(imageList)
%   
%   
%   %imshow(I)
%   
% 
%   %Apply convolution
%   [m1] = convolut(I, h_x, sigma, range);
%  
%   % Output image visualization 
%   imshow(m1)
%   imwrite(m1,sprintf('%d.jpg',i))
%   
%   % Apply smoothing Filter
%   [g_x, g_y] = smoothingFilter(sigma, width);
%   
%   %Apply convolution
%   [m1] = convolut(I, g_x, sigma, range);
%  
%   % Output image visualization 
%   imshow(m1)
%   imwrite(m1,sprintf('%d.jpg',i))
%   
% end