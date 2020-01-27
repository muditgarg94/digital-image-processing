%reading the image
img=imread('RandomDisks-P10.jpg');
%converting it to grayscale image
img=rgb2gray(img);
%imshow(img);
[M,N]=size(img);

%creating a variable that will store the image without salt and pepper
%noise
filtered_img=zeros(M,N);

%applying median filter to remove salt and pepper noise
for i=2:M-1
    for j=2:N-1
        filter=[img(i-1,j-1),img(i-1,j),img(i-1,j+1),img(i,j-1),img(i,j),img(i,j+1),img(i+1,j-1),img(i+1,j),img(i+1,j+1)];
        filtered_img(i,j)=median(filter);
    end
end
%converting the datatype of img from double to uint8
filtered_img=uint8(filtered_img);
imshow(filtered_img);