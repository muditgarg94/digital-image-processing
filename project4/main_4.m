%%%%%%%%%%%%% main_3.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Main matlab function for problem 1
%
% Input Variables:
%
% Returned Results:
%
%
% Processing Flow:
%
% The following functions are called:  
%           gabor_filter
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        04/11/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;

% Parameters initialization
F = 0.6038;
theta = -50.5;
sigma = 8;
range = 2;

I = imread('d4d29.gif');
%img=ones(size(I));
img=double(I);
% for i=1:size(I,1)
%     for j=1:size(I,2)
%         %disp(I(i,j));
%         if(I(i,j)>=112 && I(i,j)<=210)
%             %disp("Iside")
%             img(i,j)=0;
%         end
%     end
% end

gabor_img = gaborFilter(img,F, sigma, theta, range);
figure, imshow(gabor_img,[])

%%smoothen the image
[gx,gy]=gaussian(40,range);

i1=convolution(gabor_img,gx,1,40,range);
i2=convolution(i1,gy,2,40,range);

figure, imshow(i2,[]);

mask=segmentation(i2,img);
figure, imhist(mask);
[r,c]=size(mask);
segmented=zeros(r,c);

for i=1:r
    for j=1:c
        %0.81735
        if(mask(i,j)>0.92754)
            segmented(i,j)=1;
        end
    end
end

[y,x]=find(segmented==1);
disp("minx="+(min(x)));
disp("maxx="+(max(x)));
disp("miny="+ (min(y)));
disp("maxy="+(max(y)));
output=segmented.*img;

figure, imshow(output)

fused=imfuse(img,segmented);
figure, imshow(fused);
figure(2);
hold on;
imshow(img,[]);
% Then, from the help:
rectangle('Position',[min(x),min(y),max(x)-min(x),max(y)-min(y)], 'LineWidth',2,'EdgeColor','red');

