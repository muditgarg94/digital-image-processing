%%%%%%%%%%%%% gef.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       get the gabor filters 
%
% Input Variables:
%       F     
%       theta   
%       sigma    
%       range
%
% Returned Results:
%       [hx hy]
%
% Processing Flow:
%
% The following functions are called:  
%      cosd
%      sind
%       gaussian

%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [hx,hy]=gef(F, theta, sigma, range)

x=-(sigma*range):(sigma*range);
y=-(sigma*range):(sigma*range);

U=F*cosd(theta);
V=F*sind(theta);

[gx,gy]=gaussian(sigma,range);

hx=zeros(length(x));
hy=zeros(length(y));

% for i=1:length(x)
%     hx(i)=gx(i)*exp(1i*2*pi*U*x(i));
% end
% 
% for i=1:length(y)
%     hy(i)=gy(i)*exp(1i*2*pi*V*y(i));
% end

for i=1:length(x)
    hx(i)=gx(i)*exp(1i*2*pi*U*i);
end

for i=1:length(y)
    hy(i)=gy(i)*exp(1i*2*pi*V*i);
end


return 
