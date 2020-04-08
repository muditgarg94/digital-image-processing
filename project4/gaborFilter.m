function [m1] = gaborFilter(gamma, lambda, b, theta, phi)
img = imread(imfile);
phi = 0;
sigma = (1 / pi) * sqrt(log(2)/2) * (2^b+1) / (2^b-1) * lambda;
s = sigma * gamma;

for x = -fix(sigma) : fix(sigma)
    for y = -fix(s) : fix(s)
        xp = x * cos(theta) + y * sin(theta);
        yp = y * cos(theta) - x * sin(theta);
        m(fix(s)+y+1,fix(sigma)+x+1) = ...
            exp(-.5*(xp^2+gamma^2*yp^2)/sigma^2) * cos(2*pi*xp/lambda+phi);
    end
end

m1 = conv2(img(:,:,1), double(m),'same');

end