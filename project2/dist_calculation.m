%%%%%%%%%%%%% dist_calculation.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Calculate the distance between two pecstrums
%
% Input Variables:
%       size_dis     
%       total_area    
%      
% Returned Results:
%       distance 
%
% Processing Flow:
%       1.  
%
% The following functions are called: None
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/20/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function distance=dist_calculation(fn, frn)

% assuming weight is 1
distance=zeros(4,1);
[m,n]=size(fn);

for i=1:m
    val=0;
    for j=1:n
        val=val+((fn(i)-frn(i)).^2);
    end
    distance(i)=sqrt(val);
end


return