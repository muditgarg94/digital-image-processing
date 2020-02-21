%%%%%%%%%%%%% dist_calculation.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Calculate the distance between two pecstrums
%
% Input Variables:
%       fn    
%       frn
%       wt      Weight
%      
% Returned Results:
%       distance 
%
% Processing Flow:
%       1.  Run a  nested loop calculate the distance d of object given by eqn (6.11.1) from 
%           PitasCh6.
%
% The following functions are called: None
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/20/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function distance = dist_calculation(fn, frn, wt)

[m,n] = size(fn);
distance = zeros(m, m);

for i = 1 : m
    for j = 1 : n
        q = 1;
        while q <= 4
            distance(i, q) = distance(i, q) + ((fn(i, j) - frn(q,j)).^2);
            q = q + 1;
        end
    end
end

distance = distance.*wt;
return