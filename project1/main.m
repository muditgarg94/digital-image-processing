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
%      1.  Read the image.
%      2.  convert to binary image.
%      2.  remove the salt and pepper noise from the binary image.
%      3.  Create  structuring elements of disk shape of radii 8 and 30.
%      4.  Create window based structuring element of size 37 and 10.
%      5.  Perform hit-or-miss operation and get the disks of a specific
%      size.
%      6.  Highlight the disks and save them on the machine.
%      7. Perform the steps 5 and 6 on noisy binary image.
%
%
% The following functions are called:
%      imread.m              read the image
%      convert2binary.m      convert the image to a binary image
%      Noiseremoval.m        remove the salt and pepper noise from binary image
%      hitormiss.m           perform the hit and miss transform on the binary image
%      imwrite.m             saves the image to disk
%      disk.m                creates a disk shaped strcuturing elements.
%      highlight_selector.m  highlights the object in the image.
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
big=hitormiss(noNoiseImg,Ab,Bb);
big_disk=highlight_selector(noNoiseImg,big);
figure, imshow(big_disk);
imwrite(big_disk,'big_disk.gif');


As=~disk(8); %% Generated disk A for smallest disk
Bs=disk(10); %% Generated w-a mask (B) for smallest disk

small=hitormiss(noNoiseImg,As,Bs);
small_disk=highlight_selector(noNoiseImg,small);
figure, imshow(small_disk);
imwrite(small_disk,'small_disk.gif');


% perform hit or miss on noisy image

big_noise=hitormiss(img,Ab,Bb);
big_noise_img=highlight_selector(img,big_noise);
%figure, imshow(big_noise_img);
imwrite(big_noise_img,'NoisyBigRadii.gif');

small_noise=hitormiss(img,As,Bs);
small_noise_img=highlight_selector(img,small_noise);
%figure, imshow(small_noise_img);
imwrite(big_noise_img,'NoisySmallRadii.gif');

