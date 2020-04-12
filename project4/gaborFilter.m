%%%%%%%%%%%%% gaborFilter.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

function final_img = gaborFilter(img,F, sigma, theta, range)


% newRange = sigma * width;
% xRange = -newRange : newRange;
% yRange = -newRange : newRange;
% 
% U = F * cosd(theta);
% V = F * sind(theta);
% 
% for i = 1 : length(xRange)
%     g_x(i) = (exp(-((xRange(i)).^2) / (2*(sigma^2)))) / (2*pi) * (sigma^2);
% end
% 
% for j = 1 : length(yRange)
%     g_y(j) = (exp(-((yRange(j)).^2) / (2*(sigma^2)))) / (2*pi) * (sigma^2);
% end
% 
% h_x = zeros( size(g_x));
% h_y = zeros( size(g_y));
% 
% 
% for ii = 1 : length(xRange)
%     h_x(ii) = gx(ii) * exp(1ii * 2 * pi * U * xRange(ii));
% end
%     
% for jj = 1 : length(yRange)
%     h_y(jj) = gy(jj) * exp(1jj * 2 * pi * V * yRange(jj));
% end

%calculate gef
[hx,hy]=gef(F,theta,sigma,range);

%apply convoolution row wise
i1=convolution(img,hx,1,sigma,range);
%apply convolution col wise
i2=convolution(i1,hy,2,sigma,range);
% taking absolue values
final_img=convolution(i2,hx,3,sigma,range);

end