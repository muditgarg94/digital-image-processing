

function [gaussian] = smoothingFilter(sigma)

width = 4*sigma + 1;
[xx,yy] = meshgrid(-width : width, -width : width);
gaussian = exp(-1/(2*sigma^2) * (xx.^2 + yy.^2));

end