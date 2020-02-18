%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Perform the homotopic skeletonization on penn256 and bear images
%
% Input Variables:
%       img     array of images
%       bear    bear image
%       penn    penn256 image
%      
% Returned Results:
%       y       binary image
%
% Processing Flow:
%       1.  Read images "bear.gif" and "penn256.gif".
%       2.  Create the structuring element B, both background and
%           foreground.
%       3.  Call skeltonization function for both images individually to
%           perfor homotopic skeletonization.
%
% The following functions are called:
%      
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/16/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear;
%reading both images ("bear.gif" and "penn256.gif")
img = ["bear.gif" ; "penn256.gif"];

bear = imread(img(1));
bear = bear == 1;

penn = imread(img(2));
penn = penn == 1;

%% Generate the 16 structuring elements for performing Skeletonization
%  bb denotes structuring element B - background,
%  bf denotes structuring element B - foreground.

bb = zeros(3,3,8);
bf = zeros(3,3,8);
bb(:,:,1) = [1,1,1;0,0,0;0,0,0];
bf(:,:,1) = [0,0,0;1,1,0;1,1,1];
bb(:,:,2) = [0,1,1;0,0,1;0,0,0];
bf(:,:,2) = [0,0,0;1,1,0;1,1,0];
bb(:,:,3) = [0,0,1;0,0,1;0,0,1];
bf(:,:,3) = [1,0,0;1,1,0;1,0,0];
bb(:,:,4) = [0,0,0;0,0,1;0,1,1];
bf(:,:,4) = [1,1,0;1,1,0;0,0,0];
% bb(:,:,1) = [0,0,0;1,1,1;1,1,1];
% bf(:,:,1) = [1,1,1;0,0,1;0,0,0];
% bb(:,:,2) = [1,0,0;1,1,0;1,1,1];
% bf(:,:,2) = [1,1,1;0,0,1;0,0,1];
% bb(:,:,3) = [1,1,0;1,1,0;1,1,0];
% bf(:,:,3) = [0,1,1;0,0,1;0,1,1];
% bb(:,:,4) = [1,1,1;1,1,0;1,0,0];
% bf(:,:,4) = [0,0,1;0,0,1;1,1,1];

for i = 1 : 4
    bb(:,:,i+4) = rotate180(bb(:,:,i));
    bf(:,:,i+4) = rotate180(bf(:,:,i));
end

%% Applying homotopic skeletonization to images "bear.gif" and "penn256.gif"

bear_skeleton = skeletonization(bear, bf, bb);

penn_skeleton = skeletonization(penn, bf, bb);


%% testing
%printing structuring elements
%for i = 1 : 4
%    figure, imshow(bb(:,:,i))
%    title('Structuring element background')
%    figure, imshow(bf(:,:,i))
%    title('Structuring element foreground')
%end

%printing input and output
figure, imshow(bear)
title('Bear image - original')
figure, imshow(bear_skeleton)
title('Bear image - after homotopic skeletonization')
figure, imshow(penn)
title('PennState image - original')
figure, imshow(penn_skeleton)
title('PennState image - after homotopic skeletonization')


