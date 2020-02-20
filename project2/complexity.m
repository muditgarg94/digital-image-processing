%%%%%%%%%%%%% complexity.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To calculate the measure of complexity an image H(X|B) as per
%       Maragos-Schafer, eq.(40).
%
% Input Variables:
%       pectrum     the pectrum of the image
%      
% Returned Results:
%       entropy     the average uncertainity or entropy
%
% Processing Flow:
%       1.  	Q
%
% The following functions are called: pectrum
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/20/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function entropy = complexity(pectrum)

[m, n] = size(pectrum);
entropy = zeros(m, 1);
for i = 1 : m
    val = 0;
    for j = 1 : n
        if(pectrum(i,j)~= 0)
            cal =- pectrum(i,j) * log2(pectrum(i,j));
            val = val + cal;
        end
    end
    entropy(i) = val;
end

return