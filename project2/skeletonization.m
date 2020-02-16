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

function skeleton=skeletonization(img,b_f,b_b)

init=img;
skeleton=img;

while true
    for j=1:8
        skeleton=thinning(skeleton,b_f(j),b_b(j));
    end
    if(skeleton==init)
        break;
    end
    init=skeleton;

end

return