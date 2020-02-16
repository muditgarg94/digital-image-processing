%%%%%%%%%%%%% skeletonization.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Perform the homotopic skeletonization on images
%
% Input Variables:
%       img     array of images
%       b_f
%       b_b
%      
% Returned Results:
%       y       binary image
%
% Processing Flow:
%       1.  
%
%
% The following functions are called:
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/16/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function skeleton=skeletonization(img,bf,bb)

init=img;
skeleton=img;

while true
    for j=1:size(bf,3)
        skeleton=thinning(skeleton,bf(:,:,j),bb(:,:,j));
    end
    if(skeleton==init)
        break;
    end
    init=skeleton;

end

return