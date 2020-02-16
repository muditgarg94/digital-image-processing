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


function thin=thinning(x,b_f,b_b)

hmt=hitormiss(x,b_f,b_b);
hmt_comp=complement(hmt);
thin=intersection(x,hmt_comp);

return