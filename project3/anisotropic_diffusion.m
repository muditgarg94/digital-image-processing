%%%%%%%%%%%%% anisotropic_diffusion.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Performs Perona-Malik anisotropic diffusion
%
% Input Variables:
%       img     Input Image
%       k       k value
%
% Returned Results:
%       diffused_img      Image after applying anisotropic diffusion on
%       given image
%
% Processing Flow:
%       1. Run all the filters on given image.
%       2. Save the images at 1st and 5th iteration
%       3. Save the histogram of the final iteration of each filter.
%
% The following functions are called:
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function diffused_img=anisotropic_diffusion(img, k,iter)

[m,n]=size(img);
lambda=0.25;

for i=1:iter
    %north gradient
    north=zeros(m,n);
    north(2:end,1:end)=img(1:end-1,1:end);
    north(1,:)=img(1,:);
    north_grad=north-img;

    %south gradient
    south=zeros(m,n);
    south(1:end-1,1:end)=img(2:end,1:end);
    south(end,:)=img(end,:);
    south_grad=south-img;

    %east gradient
    east=zeros(m,n);
    east(:,1:end-1)=img(:,2:end);
    east(:,end)=img(:,end);
    east_grad=east-img;

    %west gradient
    west=zeros(m,n);
    west(:,2:end)=img(:,1:end-1);
    west(:,1)=img(:,1);
    west_grad=west-img;

    %diffusion coefficients
    cn=exp(-(north_grad./k).^2);
    cs=exp(-(south_grad./k).^2);
    ce=exp(-(east_grad./k).^2);
    cw=exp(-(west_grad./k).^2);

    img=img+lambda.*(cn.*north_grad+cs.*south_grad+ce.*east_grad+cw.*west_grad);
end

diffused_img=img;
return