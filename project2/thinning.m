%%%%%%%%%%%%% thinnig.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


function thin = thinning(X, b_f, b_b)

hmt = hitormiss(X, b_f, b_b);
hmt_comp = complement(hmt);
thin = intersection(X, hmt_comp);

return