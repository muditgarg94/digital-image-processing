%%%%%%%%%%%%% ploty128.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       To plot the gray-scale histogram of image
%
% Input Variables:
%       img     Input Image
%       name    name of the image to be saved
%
% Returned Results:
%       Plots y=128 of given image
%
% Processing Flow:

% The following functions are called:  
%       plot:  plot the graph of given coordinates
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/27/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ploty128(img,name)

fh=figure;
plot(img(:,128));
saveas(fh,name,'png');
close(fh);

end