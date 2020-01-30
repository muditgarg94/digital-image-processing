%reading the image
img=imread('RandomDisks-P10.jpg');

%convert the image to binary
img=convert2binary(img);

%remove noise using close and open operation
