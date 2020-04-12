function final_img = gaborFilter(img,F, sigma, theta, range)


% newRange = sigma * width;
% xRange = -newRange : newRange;
% yRange = -newRange : newRange;
% 
% U = F * cosd(theta);
% V = F * sind(theta);
% 
% for i = 1 : length(xRange)
%     g_x(i) = (exp(-((xRange(i)).^2) / (2*(sigma^2)))) / (2*pi) * (sigma^2);
% end
% 
% for j = 1 : length(yRange)
%     g_y(j) = (exp(-((yRange(j)).^2) / (2*(sigma^2)))) / (2*pi) * (sigma^2);
% end
% 
% h_x = zeros( size(g_x));
% h_y = zeros( size(g_y));
% 
% 
% for ii = 1 : length(xRange)
%     h_x(ii) = gx(ii) * exp(1ii * 2 * pi * U * xRange(ii));
% end
%     
% for jj = 1 : length(yRange)
%     h_y(jj) = gy(jj) * exp(1jj * 2 * pi * V * yRange(jj));
% end

%calculate gef
[hx,hy]=gef(F,theta,sigma,range);

%apply convoolution row wise
i1=convolution(img,hx,1,sigma,range);
%apply convolution col wise
i2=convolution(i1,hy,2,sigma,range);
% taking absolue values
final_img=convolution(i2,hx,3,sigma,range);

end