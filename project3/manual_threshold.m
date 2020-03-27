%%%%%%%%%%%%% manual_threshold.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       To threshold the image manually
%
% Input Variables:
%       img     Input Image
%
%
% Returned Results:
%       output   Theshold image
%
% Processing Flow:

% The following functions are called:  
%     None
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/27/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function output=manual_threshold(img)
[m,n]=size(img);
output=zeros(m,n);
for i=1:m
    for j=1:n
        if(img(i,j)<=100 && img(i,j)>= 90)
            output(i,j)=1;
        end
    end
end

figure, imshow(output);
return
