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


function [gx,gy]=gaussian(sigma, range)
x=-(sigma*range):(sigma*range);

y=-(sigma*range):(sigma*range);

gx=zeros(size(x));
gy=zeros(size(y));

denom = (sqrt(2*pi)*sig);

for i=1:length(x)
   gx(i)=exp(-(x(i)^2)/(2*(sig^2))); 
end
gx=gx./denom;

for i=1:length(y)
   gy(i)=(exp(-(y(i)^2)/(2*(sig^2)))); 
end

gy=gy./denom;
return;