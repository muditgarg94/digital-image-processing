%%%%%%%%%%%%% size_distribution.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       This function determines the size distribution for the objects in
%       the image.
%
% Input Variables:
%       img         image having the objects
%       mbr_dim     minimum bounding rectangle dimension
%      
% Returned Results:
%       sdis      size distribution values.
%
% Processing Flow:
%       1.  For radius 1 to 12, run a for loop to radius rB.
%       2.  Call function open_op to calculate the area when function
%           calculate_area is called.
%
% The following functions are called:  open_op
%                                      calculate_area
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/19/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function sdis = size_distribution(img, mbr_dim)

sdis = zeros(1, 12);
for radius = 1 : 12
    rB = ones(3 + 2*(radius-1));
    opened_img = open_op(img,rB);
    area = calculate_area(opened_img, mbr_dim);
    sdis(radius) = area;
    %X = sprintf('Area %d rad %d',area,radius);
    %disp(X)
   % plot(area)
   % xlabel('r')
   % ylabel('U(r)')
end



%disp(sdis);
return

