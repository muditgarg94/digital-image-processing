%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Convert the image to binary image
%
% Input Variables:
%      img     input 3D/2D image
%      
% Returned Results:
%      y       binary image
%
% Processing Flow:
%      1.  Calculate the size of given image.
%      2.  If it is a colored image, convert it to grayscale image.
%      3.  Calculate the threshold of a grayscale image. In our code, tnreshold is the avg value of
%      pixel.
%      4.  Iterate the grayscaled image. If value > threshold, set value
%       to 1. Set others as 0.
%      5. Return the binary image.
%
%
% The following functions are called:
%      imread.m            read the image
%      convert2binary.m    convert the image to a binary image
%      Noiseremoval.m      remove the salt and pepper noise from binary image
%      hitandmiss.m        perform the hit and miss transform on the binary image
% 
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusaga
%  Date:        1/29/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%reading the image
img=imread('RandomDisks-P10.jpg');

%convert the image to binary
img=convert2binary(img);
%imwrite(img,'binaryimage.jpg');

%remove noise using close and open operation
noNoiseImg = NoiseRemoval(img);
%imwrite(noNoiseImg,'filtered_img.jpg')

%find the zdisk of largest size using hit and miss transform
%A=~disk(32);
%B=disk(64);

As=disk_lma(8); %% Generated disk A for smallest disk
Bs=hole_lma(10); %% Generated w-a mask (B) for smallest disk

Ab=disk_lma(31); %% Generated disk A for biggest disk
Bb=hole_lma(36); %% Generated w-a mask (B) for biggest disk

%small = hitandmiss_small( noNoiseImg,As,Bs );
%figure;imshow(small);title('smallest disk');
%imwrite(small,'smallest_disk.jpg')


big = hitandmiss_big(  noNoiseImg,Ab,Bb );
figure;imshow(big);title('biggest disk');
imwrite(big,'biggest_disk.jpg')
%big=hitandmiss(noNoiseImg,double(A),B);
%figure, imshow(big);

%find the disk of the smallest size using hit and miss transform