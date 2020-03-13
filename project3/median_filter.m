%%%%%%%%%%%%% median_filter.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Given image "match1", perform object extraction using suitable
%       structuring element and calculate the size distribution U(n), pectrum f(n),
%       and complexity H(X|B) of each object. Also, based on the pecstral
%       value, determine the distance as per eqn.(6.11.10) PitasCh6 to
%       match the objects in "match1" to objects in "match3".
%
% Input Variables:
%       img     image "match1"
%
% Returned Results:
%       distance      distance obtained from eqn.(6.11.10) PitasCh6
%
% Processing Flow:
%       1.  Calculate the size distribution, pecstrum and shape complexity of the images
%           function.
%       2.  Determine the distance as per eqn.(6.11.10) PitasCh6 by calling
%           dist_calculation and identify the matching objects.
%
% The following functions are called:  granular_analysis
%                                      dist_calculation
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/10/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function filtered_img = median_filter(img, mask)

img = ones(10:10)
%if nargin ==1
mask = 5;

%end

padded_img = padding(img, mask);
[a, b] = size(img);
[m, n] = size(padded_img);
[p, q] = size(mask);
filtered_img = zeros(a, b);
p = floor(mask/2);
mask = (mask*mask);
for i = 1 : a
        for j = 1 : b
            mIndexArray=double([]);
            subArray = double(img(i:i+double(p-1),j:j+double(p-1)));
            subArray = subArray(:)';
            for k = 1:length(mask)
                x = mask(k);
                for l = 1:x
                     mIndexArray = [mIndexArray,subArray(k)];
                end
            end
            filteredIm(i,j) = double(median(mIndexArray));
       end
    end    

%return




 

