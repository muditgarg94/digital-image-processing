%%%%%%%%%%%%% granular_analysis.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Perform the homotopic skeletonization on penn256 and bear images
%
% Input Variables:
%       img     array of images
%
% Returned Results:
%       un              binary image
%       fn              binary image
%       shp_complex     binary image
%
% Processing Flow:
%       1.  Read images "bear.gif" and "penn256.gif".

%
% The following functions are called:
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/20/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function[un,fn,shp_complex] = granular_analysis(img,labels_to_be_filled)

match1 = imread(img);
match1 = match1 == 1;

if nargin==2
    lbl=bwlabel(match1);
    for i=1: length(labels_to_be_filled)
        [r,c]=find(lbl==labels_to_be_filled(i));
        for p=1:length(r)
            for q=1:length(c)
                match1(r(p),c(q))=0;
            end
        end
    end
end

%find the  minimum bounding boxes
[bounds, obj_img] = mbr(match1);

% figure, imshow(match1);
% 
% for i = 1 : size(bounds, 1)
%     rectangle('Position', bounds(i,:), 'EdgeColor', 'g');
% end

 for i=1:size(obj_img,3)
     name_ext=split(img,'.');
     name=name_ext(1);
     filename=sprintf('obj%d_%s.gif',i,name{1});

     imwrite(obj_img(:,:,i)==1,filename);
 end

un = zeros(4, 12);
mx = zeros(4, 1);
for i = 1 : size(obj_img, 3)
    un(i, :) = size_distribution(obj_img(:,:,i), bounds(i,:));
    mx(i) = calculate_area(obj_img(:,:,i), bounds(i,:));
end


fn=pecstrum(un,mx);
%plot(fn);
shp_complex=complexity(fn);

return