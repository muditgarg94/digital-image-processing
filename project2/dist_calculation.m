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


function distance=dist_calculation(pecs, ref_pecs,wt)

[m,n]=size(ref_pecs);
distance=zeros(m,m);


for i=1:m
    for j=1:n
        q=1;
        while q<=4
            distance(i,q)=distance(i,q)+(wt(q)*((pecs(q,j)-ref_pecs(i,j)).^2));
            q=q+1;
        end
    end
end


return