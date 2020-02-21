%%%%%%%%%%%%% granular_analysis.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Calculate the size distribution U(n), pecstrum f(n), and complexity H(X|B) of
%      each object. 
% Input Variables:
%       img                      array of images
%       cmplx                    true value
%       labels_to_be_filled      labels
%
% Returned Results:
%       un              The size distribution
%       fn              Pecstrum function
%       shp_complex     Shape complexity
%
% Processing Flow:
%       1.  Identify the minimum bounding rectangle for the objects.
%       2.  Call functions size_distribution and calculate_area to compute
%           size distribution.
%       3.  Call function pecstrum to determine the pecstrum value.
%       4.  Call functions complexity to determine the shape complexity of
%           the objects.
%
% The following functions are called:   size_distribution
%                                       calculate_area
%                                       pecstrum
%                                       complexity
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/20/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[un,fn,shp_complex] = granular_analysis(img,cmplx,labels_to_be_filled)

match1 = imread(img);
match1 = match1 == 1;

if nargin==3
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
if cmplx==true
    shp_complex=complexity(fn);
end

return