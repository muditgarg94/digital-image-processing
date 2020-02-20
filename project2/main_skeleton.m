%%%%%%%%%%%%% main_skeleton.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       Perform the homotopic skeletonization on penn256 and bear images
%
% Input Variables:
%       img     array of images
%       bear    bear image
%       penn    penn256 image
%      
% Returned Results:
%       bear_skeleton       skeleton image of "bear.gif" after performing
%                           thinning.
%       penn_skeleton       skeleton image of "penn256.gif" after performing
%                           thinning.
%
% Process Flow:
%       1.  Read images "bear.gif" and "penn256.gif".
%       2.  Create the structuring element B, both background and
%           foreground.
%       3.  Call skeltonization function for both images individually to
%           perfor homotopic skeletonization.
%
% The following functions are called: skeletonization
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
bf(:,:,1) = [0,0,0;0,1,0;1,1,1];
bb(:,:,2) = [0,1,1;0,0,1;0,0,0];
bf(:,:,2) = [0,0,0;1,1,0;1,1,0];
bb(:,:,3) = [0,0,1;0,0,1;0,0,1];
bf(:,:,3) = [1,0,0;1,1,0;1,0,0];
bb(:,:,4) = [0,0,0;0,0,1;0,1,1];
bf(:,:,4) = [1,1,0;1,1,0;0,0,0];


for i = 1 : 4
    bb(:,:,i+4) = rotate180(bb(:,:,i));
    bf(:,:,i+4) = rotate180(bf(:,:,i));
end

%% Applying homotopic skeletonization to images "bear.gif" and "penn256.gif"

bear_skeleton = skeletonization(bear, bf, bb);
bear_skeleton=bear_skeleton==1;
penn_skeleton = skeletonization(penn, bf, bb);
penn_skeleton= penn_skeleton==1;


%% testing
%printing structuring elements
%for i = 1 : 4
%    figure, imshow(bb(:,:,i))
%    title('Structuring element background')
%    figure, imshow(bf(:,:,i))
%    title('Structuring element foreground')
%end

%printing input and output
% figure, imshow(bear)
% title('Bear image - original')
 figure, imshow(bear_skeleton);
 title('Bear image - after homotopic skeletonization');
 imwrite(bear_skeleton, 'bear_skeleton.gif');
% figure, imshow(penn)
% title('PennState image - original')
 figure, imshow(penn_skeleton);
 title('PennState image - after homotopic skeletonization');
 imwrite(penn_skeleton, 'penn_skeleton.gif');


