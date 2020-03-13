%%%%%%%%%%%%% mean_filter.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


function filtered_img=mean_filter(img,mask)
if nargin==1
    mask=5;
end

padded_img=padding(img,mask);
[m,n]=size(padded_img);
[a,b]=size(img);
filtered_img=zeros(a,b);
p=floor(mask/2);


for i=p+1:m-p
    for j=p+1:n-p
        sum_val=0;
        for new_i=i-p:i+p
            for new_j=j-p:j+p
                sum_val=sum_val+padded_img(new_i,new_j);
       
            end
        end
        filtered_img(i-p,j-p)=sum_val/(mask*mask);
        
    end
end
return