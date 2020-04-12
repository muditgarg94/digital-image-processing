%%%%%%%%%%%%% unprocessed_filter.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%      To set the unprocessed pixels as 0
%
% Input Variables:
%       img     Input Image
%       sigma   sigma value
%       range    range of the filter
%
% Returned Results:
%       output  Image with only the processed pixels values
%
% Processing Flow:
%
% The following functions are called:  
%       None
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        04/11/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function output=unprocessed_filter(img, sigma, range)

[m,n]=size(img);
output=zeros(m,n);

index=sigma*range;
for i=index+1:m-index
    for j=index+1:n-index
        output(i,j)=img(i,j);
    end
end

return