%%%%%%%%%%%%% skeletonization.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Perform the homotopic skeletonization on images
%
% Input Variables:
%       image   Inputs an image 
%       b_b     Structuring element B - background
%       b_f      Structuring element B - foreground
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

function skeleton=skeletonization(image, b_f, b_b)

initImg = image;
skeleton = image;

while true
    for j = 1 : size(b_f,3)
        skeleton = thinning(skeleton, b_f(:,:,j), b_b(:,:,j));
    end
    if(skeleton == initImg)
        break;
    end
    initImg = skeleton;

end

return