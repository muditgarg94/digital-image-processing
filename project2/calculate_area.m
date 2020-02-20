%%%%%%%%%%%%% calculate_area.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To calculate the area 
%
% Input Variables:
%       img        array of images
%       mbr_dim    dimensions of minimum bounding rectangle (MBR)
%      
% Returned Results:
%       area       calculated area for the image
%
% Processing Flow:
%       1.  Obtain dimensions such as height, width, xmin and ymin from
%           mbr_dim.
%       2.  Set area, default to 0.
%       3.  Run nested loop to calculate area if the pixel denotes '1'.
%
% The following functions are called: None.
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/19/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function area=calculate_area(img,mbr_dim)

xmin=mbr_dim(1);
ymin=mbr_dim(2);
width=mbr_dim(3);
height=mbr_dim(4);
area=0;
for i=ymin:height+ymin
    for j=xmin:width+xmin
        if img(i,j)==1
            area=area+1;
        end
    end
end
return
