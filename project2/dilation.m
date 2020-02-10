%%%%%%%%%%%%% dilation.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the dilation operation on image
%
% Input Variables:
%      A     input binary image on which operation will be performed
%      B     structuring element using which operation will be performed
%      
% Returned Results:
%      eroded_val       eroded image
%
% Processing Flow:
%      1.  Calculate the size of image.
%      2.  Take the round of size(structuring element)/2;
%      3.  Iterate the image such that the entire structuring element is
%      slid on the original image.
%      4.  If any of the pixel of structuring element B hit on the original
%      image A then set the pixel to 0.
%      5.  Repeat 3 & 4 until all the elements are accessed
%
%
%  Authors:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/28/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function dil=dilation(A,B)

[m,n]=size(A);
[p,q]=size(B);
dil=ones(m,n);
for i=1:m
    for j=1:n
        if A(i,j)==0
            for k=1:p
                for l=1:q
                    if(B(k,l)==0)
                        dil(i+k,j+l)=0;
                    end
                end
            end
        end
    end
end
return