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

function rotate_img=rotate180(x)
[m,n]=size(x);
p=1;
rotate_img=zeros(m,n);
for i = m:-1:1 
    q=1;
    for j = n:-1:1
            rotate_img(p,q)=x(i,j);
            q=q+1;
    end
    p=p+1;
end
           
return