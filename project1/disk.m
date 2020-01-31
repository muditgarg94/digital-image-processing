%%%%%%%%%%%%% disk.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Return the structuring element in the shape of disk
%
% Input Variables:
%      r     radius of the disk
%     
%      
% Returned Results:
%      disk_str the disk of radius r
%
% Processing Flow:
%       1.  Calculate the diameter.
%       2.  Create a matrix of size d+2.
%       3.  Now, iterate over the matrix.
%       4.  Set the pixel to 1 if it lies within the radius range
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/30/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function disk_str=disk(r)

d=2*r;

disk_str=zeros(d+2);

for i=1:d+1
    for j=1:d+1
        x = i - r - 1;
        y = j - r - 1;
        R  = x*x+y*y;
        if R<=(r*r)
            disk_str(i,j)=1;
        end
    end
end


return