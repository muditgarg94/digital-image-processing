%%%%%%%%%%%%% pectrum.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


function pecs=pectrum(size_dis,total_area)

[m,n]=size(size_dis);
pecs=zeros(m,n);


for i=1:m
    for j=1:n-1
        pecs(i,j)=((size_dis(i,j)-size_dis(i,j+1))/total_area(i));
    end
end

return