function [h_x, h_y] = gaborFilter(F, sigma, theta, width)

newRange = sigma * width;
xRange = -newRange : newRange;
yRange = -newRange : newRange;

U = F * cosd(theta);
V = F * sind(theta);

denominator = (sqrt(2*pi)) * sigma;
for i = 1 : length(xRange)
    g_x(i) = (exp(-((x(i)).^2) / (2*(sigma^2)))) / denominator;
end

for j = 1 : length(yRange)
    g_y(j) = (exp(-((y(j)).^2) / (2*(sigma^2)))) / denominator;
end

h_x = zeros( size(g_x));
h_y = zeros( size(g_y));


for ii = 1 : length(xRange)
    h_x(ii) = gx(ii) * exp(1ii * 2 * pi * U * x(ii));
end
    
for jj = 1 : length(yRange)
    h_y(jj) = gy(jj) * exp(1jj * 2 * pi * V * y(jj));
end

end