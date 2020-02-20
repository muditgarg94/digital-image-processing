%%%%%%%%%%%%% complexity.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

function entropy=complexity(pectrum)

[m,n]=size(pectrum);
entropy=zeros(m,1);
for i=1:m
    val=0;
    for j=1:n
        if(pectrum(i,j)~=0)
            cal=-pectrum(i,j)*log2(pectrum(i,j));
            val=val+cal;
        end
    end
    entropy(i)=val;
end

return