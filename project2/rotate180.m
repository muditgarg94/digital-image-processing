%%%%%%%%%%%%% rotate180.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Function to rotate the image X by 180.
%
% Input Variables:
%      
% Returned Results:
%       rotate_img      rotated image
%
% Processing Flow:
%       1.  Run a nested for loop to rotate the image by 180.
%
%
% The following functions are called:
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/16/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function rotate_img = rotate180(x)
[m,n] = size(x);
p = 1;
rotate_img = zeros(m, n);
for i = m:-1:1 
    q = 1;
    for j = n:-1:1
            rotate_img(p,q) = x(i,j);
            q = q + 1;
    end
    p = p + 1;
end
           
return