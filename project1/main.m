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
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        1/29/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
%reading the image
img=imread('RandomDisks-P10.jpg');

%convert the image to binary
img=convert2binary(img);
%figure, imshow(img);
imwrite(img,'binaryimage.gif');

%remove noise using close and open operation
noNoiseImg = NoiseRemoval(img);
%figure,imshow(noNoiseImg);
imwrite(noNoiseImg,'filtered_img.gif')




Ab=~disk(30); %% Generated disk A for biggest disk
Bb=disk(37); %% Generated w-a mask (B) for biggest disk

%big=erosion(noNoiseImg,As);
big=hitandmiss(noNoiseImg,Ab,Bb);
big_disk=highlight_selector(noNoiseImg,big);
figure, imshow(big_disk);
imwrite(big_disk,'big_disk.gif');


As=~disk(8); %% Generated disk A for smallest disk
Bs=disk(10); %% Generated w-a mask (B) for smallest disk

small=hitandmiss(noNoiseImg,As,Bs);
small_disk=highlight_selector(noNoiseImg,small);
figure, imshow(small_disk);
imwrite(small_disk,'small_disk.gif');

