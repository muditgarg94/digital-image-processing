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

[imgx,imgy] = find(A); % location of 1s in the image
[sex,sey] = find(B); % location of 1s in structuring element

% now get indices of structuring elements relative to the centre of the array
sex = sex - floor(p/2) - 1;
sey = sey - floor(q/2) - 1;

dil=zeros(m,n);

% loop over each white pixel in the image
for i = 1:numel(imgx)
    % these are just the indices of the pixel
    r1 = imgx(i);
    c1 = imgy(i);

    % now loop over each non-zero element of the structuring array
    for j = 1:numel(sex)
        % the position of the pixel to change is (r,c)
        r = r1+sex(j);
        c = c1+sey(j);

        % if the pixel is inside the image, we make it a 1
        if r>0 && c>0 && r<=m && c<=n
            dil(r,c) = 1;
        end
    end
end

return