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

p=round(size(B,1)/2);
q=round(size(B,2)/2);
dil=zeros(m,n);

for i=p:m-p
    for j=q:n-q
        flag=false;
        b_i=1;
        for new_i=i-p+1:i+p-1
            b_j=1;
            for new_j=j-q+1:j+q-1
                if(B(b_i,b_j)==1 && A(new_i,new_j)==1)
                    flag=true;
                    break;
                end
                b_j=b_j+1;
            end
            b_i=b_i+1;
        end
        if(flag)
            %disp('i='+i);
            %disp('j='+j);
            dil(i,j)=1;
        end
        
    end
end

return