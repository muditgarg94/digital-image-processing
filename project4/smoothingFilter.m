

function [g_x,g_y] = smoothingFilter(sigma, width)

sigma = 24;
newRange = sigma * width;
xRange = -newRange : newRange;
yRange = -newRange : newRange;

U = F * cosd(theta);
V = F * sind(theta);

for i = 1 : length(xRange)
    g_x(i) = (exp(-((xRange(i)).^2) / (2*(sigma^2)))) /(2*pi) * (sigma^2);
end

for j = 1 : length(yRange)
    g_y(j) = (exp(-((yRange(j)).^2) / (2*(sigma^2)))) / (2*pi) * (sigma^2);
end

end