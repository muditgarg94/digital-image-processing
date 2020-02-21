%%%%%%%%%%%%% mbr.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To identify and extract the minimum bounding rectangle (mbr).
%
% Input Variables:
%       img     image whose mbr is to be found
%      
% Returned Results:
%       bounds      bound of the object
%       obj_img     objects of the image
%
% Processing Flow:
%       1.  Run a loop for all extracted objects to determine the min and
%           max for the X-axis and Y-axis respectively to determine the
%           possible minimum bounding rectangle.
%
% The following functions are called: None
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/19/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [bounds, obj_img] = mbr(img)

[labeled_img, object_count] = bwlabel(img);
% disp(object_count);
[m, n] = size(img);
obj_img = zeros(m, n, object_count);
bounds = zeros(object_count, 4);
for label = 1 : object_count
    output = zeros(m, n);
    [r, c] = find(labeled_img == label);
    %form the image
     for i = 1 : length(r)
         output(r(i), c(i)) = 1;
     end
    xmin = min(c) - 1;
    xmax = max(c) + 1;
    ymin = min(r) - 1;
    ymax = max(r) + 1;
    bounds(label, :) = [xmin ymin xmax-xmin ymax-ymin];
    obj_img(:, :, label) = output;
%     figure, imshow(output);
%     rectangle('Position',[xmin ymin xmax-xmin ymax-ymin],'EdgeColor','r');
end

%disp(bounds);

return



