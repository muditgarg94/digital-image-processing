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

function skeleton=skeletonization(image, b_f, b_b,img_name)

initImg = image;
skeleton = image;
i=0;
while true
    i=i+1;
    for j = 1 : size(b_f,3)
        skeleton = thinning(skeleton, b_f(:,:,j), b_b(:,:,j));
    end
    if(i==2 || i==5 || i==10)
        imwrite(skeleton==1,sprintf('%s_X%d.gif',img_name,i));
        c=imfuse(image,skeleton);
        figure, imshow(c);
        %imwrite(c==1,sprintf('%s_fused_X%d.gif',img_name,i))
    end
    %figure, imshow(skeleton);
    %figure, imshow(initImg);
    if(skeleton == initImg)
        %disp(i);
        break;
    end
    initImg = skeleton;

end

return