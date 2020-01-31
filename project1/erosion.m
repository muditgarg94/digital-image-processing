%%%%%%%%%%%%% erosion.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the erosion operation on image
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
%      fit into the image.
%      4.  If all the values of image and structuring element match, set
%      eroded_img=1 else set it to 0.
%      5.  Repeat 3 & 4 until all the elements are accessed
%
%
%  Authors:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/28/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function eroded_val=erosion(A,B)

[m,n]=size(A);

p=round(size(B,1)/2);
q=round(size(B,2)/2);
eroded_val=A;

for i=p:m-p
    for j=q:n-q
        flag=true;
        b_i=1;
        for new_i=i-p+1:i+p-1
            b_j=1;
            for new_j=j-q+1:j+q-1
                if(B(b_i,b_j)==0 && A(new_i,new_j)==1)
                    flag=false;
                    break;
                end
                b_j=b_j+1;
            end
            b_i=b_i+1;
        end
        if(flag)
            %disp('i='+i);
            %disp('j='+j);
            eroded_val(i,j)=0;
        else
            eroded_val(i,j)=1;
        end
        
    end
end

return