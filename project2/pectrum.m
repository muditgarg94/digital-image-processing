%%%%%%%%%%%%% pectrum.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Calculate pectrum for the given image
%
% Input Variables:
%       size_dis     
%       total_area    
%      
% Returned Results:
%       pecs 
%
% Processing Flow:
%       1.  
%
% The following functions are called: None
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/20/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function pecs = pectrum(size_dis,total_area)

[m,n]=size(size_dis);
pecs=zeros(m,n);


for i=1:m
    for j=1:n-1
        pecs(i,j)=((size_dis(i,j)-size_dis(i,j+1))/total_area(i));         
    end
end
        %plotting pectral 
        %pecstralPlot = plot(pecs);
        %xlabel = 'x';
        %ylabel = 'f(x)';
        %title('Pectrum diagram');

return