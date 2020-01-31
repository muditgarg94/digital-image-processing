function [ B ] = hole_lma( r )

% Determine diameter of the disk
d = 2*r;

% Create matrix of zeros with side length D+1 (this allows for a middle
% pixel)
B = zeros(d+1);

% Scan through horizontal and vertical pixels, if the radial distance from
% the center is less thanor eqaul the specified R0 value, then make the 
% pixel to 1.
for i=1:(d+1)
    for j=1:(d+1)
        R  = sqrt((i-r-1).^2 + (j-r-1).^2);
        if R<=r
            B(i,j)=1;
        end
    end
end


end