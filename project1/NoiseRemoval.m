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
%  Authors:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
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
strucElement1 = strel('disk',2);

%imclose to apply close operation
img1 = imclose(img, strucElement1); 

%imclose to apply open operation
strucElement2 = strel('disk',3);
noNoiseImg = imopen(img1, strucElement2);

% Primary image before noise removal
figure
imshow(img)
disp('Original image of "RandomDisks-P10"')

% Image after removing noise
figure
imshow(noNoiseImg)
disp('Image of "RandomDisks-P10" after noise removal')


%converting the datatype of img from double to uint8
%filtered_img=uint8(filtered_img);
%imshow(filtered_img);

