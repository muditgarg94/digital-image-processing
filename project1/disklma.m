function [ A ] = disk_lma( r )
% Determine the diameter of the disk
s = 2*r;

% Create matrix of zeros with side length D+1 (this allows for a middle
% pixel)
A = zeros(s+1);

% Scan through horizontal and vertical pixels, if the radial distance from
% the center is less thanor eqaul the specified R0 value, then make the 
% pixel to 1.
for i=1:(s+1)
    for j=1:(s+1)
        x = i - r - 1;
        y = j - r - 1;
        R  = sqrt((x).^2 + (y).^2);
        if R<=r
            A(i,j)=1;
        end
    end
end

% Invert the image to create a window with a disk of radius R0
A = ~A;

end