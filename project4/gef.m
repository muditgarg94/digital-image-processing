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

x=linspace(-(sigma*range),(sigma*range),2*range*sigma+1);
%y=linspace(-(sigma*range),(sigma*range),2*range*sigma+1);
y=x';

U=F*cosd(theta);
V=F*sind(theta);

[gx,gy]=gaussian(sigma,range);

hx=gx.*(exp(1i*2*pi*U*x));
hy=gy.*(exp(1i*2*pi*V*y));
% hx=zeros(size(x));
% hy=zeros(size(y));

% for i=1:length(x)
%     hx(i)=gx(i)*exp(1i*2*pi*U*x(i));
% end
% 
% for i=1:length(y)
%     hy(i)=gy(i)*exp(1i*2*pi*V*y(i));
% end

%disp(size(hx))
% for i=1:length(x)
%     hx(i)=gx(i)*exp(1i*2*pi*U*x(i));
% end
% 
% for i=1:length(y)
%     hy(i)=gy(i)*exp(1i*2*pi*V*y(i));
% end


return 
