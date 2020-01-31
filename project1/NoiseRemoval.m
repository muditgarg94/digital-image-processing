%%%%%%%%%%%%% NoiseRemoval.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Remove the salt and pepper noise from the image "RandomDisks-P10"
%
% Input Variables:
%      img              Input image "RandomDisks-P10.jpg"
%
% Returned Results:
%      noNoiseImg       Final image with no noise.
%
% Processing Flow:
%      1.  
%      2. 
%
%
%
%  Authors:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/27/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function noNoiseImg = NoiseRemoval(img)

%applying median filter to remove salt and pepper noise
%for i=2:M-1
 %   for j=2:N-1
  %      filter=[img(i-1,j-1),img(i-1,j),img(i-1,j+1),img(i,j-1),img(i,j),img(i,j+1),img(i+1,j-1),img(i+1,j),img(i+1,j+1)];
   %     filtered_img(i,j)=median(filter);
    %end
%end

% Remove noise using open-close operations.
% strel function to create an structuring element
strucElement = zeros(3);

%imclose to apply close operation
img1 = close_op(img, strucElement); 
%figure, imshow(img1);
%imclose to apply open operation
noNoiseImg = open_op(img1, strucElement);
%figure,imshow(noNoiseImg);

%removing borders
%the size of border around image is approximately 4 pixels.
[m,n] =size(noNoiseImg);

for i=1:m
    for j=1:4
        noNoiseImg(i,j)=1;
    end
end

for i=1:4
    for j=1:n
        noNoiseImg(i,j)=1;
    end
end


for i=1:m
    for j=n-4:n
        noNoiseImg(i,j)=1;
    end
end

return


