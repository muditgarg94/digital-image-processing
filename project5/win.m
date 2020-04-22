%%%%%%%%%%%%% winn.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%  Date:        04/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [xval,yval]=win(x,y,k)

if k==1
    w=[0,0; 0,0.16];
    t=[0;0];
elseif k==2
    w=[.2,-0.26;0.23,0.22];
    t=[0;1.6];
elseif k==3
    w=[-0.15,0.28;0.26,0.24];
    t=[0;0.44];    
elseif k==4
    w=[0.85,0.04;-0.04,0.85];
    t=[0;1.6];
end
   
transform=w*[x;y]+t;

xval=transform(1);
yval=transform(2);

return 