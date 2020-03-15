%%%%%%%%%%%%% histogram.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       To plot the gray-scale histogram of image
%
% Input Variables:
%       img     Input Image
%
%
% Returned Results:
%       Plots the histogram of given image
%
% Processing Flow:

% The following functions are called:  
%       imhist:  generates the histogram of image
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/14/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function histogram(img,name)

fh=figure;
imhist(img);
saveas(fh,name,'png');
close(fh);

end