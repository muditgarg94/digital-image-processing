%%%%%%%%%%%%% granular_analysis.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Perform the homotopic skeletonization on penn256 and bear images
%
% Input Variables:
%       img     array of images
%       bear    bear image
%       penn    penn256 image
%      
% Returned Results:
%       y       binary image
%
% Processing Flow:
%       1.  Read images "bear.gif" and "penn256.gif".
%       2.  Create the structuring element B, both background and
%           foreground.
%       3.  Call skeltonization function for both images individually to
%           perfor homotopic skeletonization.
%
% The following functions are called:
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/20/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function[un,fn,shp_complex]= granular_analysis(img)

match1=imread(img);
match1=match1==1;

%find the  minimum bounding boxes
[bounds, obj_img]=mbr(match1);

figure, imshow(match1);

for i=1:size(bounds,1)
    rectangle('Position',bounds(i,:),'EdgeColor','g');
end


un=zeros(4,12);
mx=zeros(4,1);
for i=1:size(obj_img,3)
    un(i,:)=size_distribution(obj_img(:,:,i),bounds(i,:));
    mx(i)=calculate_area(obj_img(:,:,i),bounds(i,:));
end


fn=pectrum(un,mx);
%plot(fn);
shp_complex=complexity(fn);

return