%%%%%%%%%%%%% dilation.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the dilation operation on image
%
% Input Variables:
%      A     input binary image on which operation will be performed
%      B     structuring element using which operation will be performed
%      
% Returned Results:
%      dil_val       dilated image
%
% Processing Flow:
%      1.  Calculate the size of given image and structuring element.
%      2.  Iterate over the image.
%      3.  If the value of a pixel is 1, iterate over the structuring
%      element.
%      4.  If the value of structuring element is 1, then the value of
%      dilated image at location(image)+location(structuring element) =1
%      5. Return the dilated image.
%
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
%  Date:        1/28/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function dil_val=dilation(A,B)
%size of image
[m,n]=size(A);

%size of structuring element
[p,q]=size(B);

dil_val=zeros(m,n);

%iterating the image
for i=1:m
    for j=1:n
        if A(i,j)==1
            for k=1:p
                for l=1:q
                    if B(k,l)==1
                        %adding the indexes of image and structing element
                        x=i+k;
                        y=j+l;
                        dil_val(x,y)=1;
                    end
                end
            end
        end
    end
end

return