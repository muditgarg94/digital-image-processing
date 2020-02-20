%%%%%%%%%%%%% mbr.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%  Date:        02/19/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [bounds, obj_img]= mbr(img)

[labeled_img,object_count]=bwlabel(img);
% disp(object_count);
[m,n]=size(img);
obj_img=zeros(m,n,object_count);
bounds=zeros(object_count,4);
for label=1:object_count
    output=zeros(m,n);
    [r,c]=find(labeled_img==label);
    %form the image
     for i=1:length(r)
         output(r(i),c(i))=1;
     end
    xmin=min(c)-1;
    xmax=max(c)+1;
    ymin=min(r)-1;
    ymax=max(r)+1;
    bounds(label,:)=[xmin ymin xmax-xmin ymax-ymin];
    obj_img(:,:,label)=output;
%     figure, imshow(output);
%     rectangle('Position',[xmin ymin xmax-xmin ymax-ymin],'EdgeColor','r');
end

%disp(bounds);

return



