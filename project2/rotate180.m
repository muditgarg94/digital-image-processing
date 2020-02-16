%%%%%%%%%%%%% rotate180.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Perform the thinning operation
%
% Input Variables:
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

function x=rotate180(x)
[m,n]=size(x);

for i=1:m/2
    for j=1:n
        tmp=x(i,j);
        x(i,j)=x(m-i+1,n-j+1);
        x(m-i+1,n-j+1)=tmp;
    end
end
return