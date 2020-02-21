%%%%%%%%%%%%% thinning.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Perform the thinning operation
%
% Input Variables:
%       X         Original image
%       b_f       Array of foreground structuring elements
%       b_b       Array of background structuring elements
% Returned Results:
%       thin       image after performing thinning
%
% Processing Flow:
%       1.  Call hitormiss function with parameters image and structuring
%           elements.
%       2.  Call complement function to complement the hitormiss output as
%           per P&V eq.(6.10.1). 
%       3. Finally, perform intersection to complete the thinning.
%
% The following functions are called:  hitormiss
%                                      complement
%                                      intersection
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/16/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function thin = thinning(X, b_f, b_b)

hmt = hitormiss(X, b_f, b_b);
hmt_comp = complement(hmt);
thin = intersection(X, hmt_comp);

return