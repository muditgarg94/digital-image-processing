%%%%%%%%%%%%% anisotropic_diffusion.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Performs Perona-Malik anisotropic diffusion
%
% Input Variables:
%       img_name     Input Image name
%       k       k value
%       iter
%       coeff_type
%       name   name of image
%
% Returned Results:
%       diffused_img      Image after applying anisotropic diffusion on
%       given image
%
% Processing Flow:
%       1. Calculate the north, south, east west gradients as per the
%       Perona Malik.
%       2. Calculate conduction coefficients based on coeff_type. If it is
%       1, it si exponentaial,else its inverse quadratic
%
% The following functions are called:
%       histogram
%       ploty128
%
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function diffused_img=anisotropic_diffusion(img_name, k,iter,coeff_type)
name_ext=split(img_name,'.');
name=name_ext(1);
img=imread(img_name);
img=double(img);
[m,n]=size(img);
lambda=0.25;

for t=1:iter
    %east gradient
    east=zeros(m,n);
    east(2:end,:)=img(1:end-1,:);
    east(1,:)=img(1,:);
    east_grad=east-img;

    %west gradient
    west=zeros(m,n);
    west(1:end-1,1:end)=img(2:end,1:end);
    west(end,:)=img(end,:);
    west_grad=west-img;

    %north gradient
    north=zeros(m,n);
    north(:,1:end-1)=img(:,2:end);
    north(:,end)=img(:,end);
    north_grad=north-img;

    %south gradient
    south=zeros(m,n);
    south(:,2:end)=img(:,1:end-1);
    south(:,1)=img(:,1);
    south_grad=south-img;

    %diffusion coefficients
    g_north=(north_grad./k).^2;
    g_east=(east_grad./k).^2;
    g_south=(south_grad./k).^2;
    g_west=(west_grad./k).^2;
    
    if coeff_type==1
        cn=exp(-g_north);
        cs=exp(-g_south);
        ce=exp(-g_east);
        cw=exp(-g_west);
    elseif coeff_type==2
        cn=1./(1+g_north);
        cs=1./(1+g_south);
        ce=1./(1+g_east);
        cw=1./(1+g_west);
    end
 
    diffused_img=img+lambda.*(cn.*north_grad+cs.*south_grad+ce.*east_grad+cw.*west_grad);
    for i=1:m
        for j=1:n
            if(diffused_img(i,j)>255)
                diffused_img=255;
            elseif diffused_img(i,j)<0
                diffused_img(i,j)=0;
            end
        end
    end
    img=diffused_img;
    if(t==5||t==20||t==100)
        if(coeff_type==1)
            filename=sprintf('%s_k%d_%d_exp_anisotropic.gif',name{1},k,t);
            histname=sprintf('%s_k%d_%d_exp_hist',name{1},k,t);
            plotname=sprintf('%s_k%d_%d_exp_ploty',name{1},k,t);
        else
            filename=sprintf('%s_k%d_%d_quad_anisotropic.gif',name{1},k,t);
            histname=sprintf('%s_k%d_%d_quad_hist',name{1},k,t);
            plotname=sprintf('%s_k%d_%d_quad_ploty',name{1},k,t);
        end
        imwrite(uint8(diffused_img),filename);
        histogram(uint8(diffused_img),histname);
        ploty128(uint8(diffused_img), plotname);
    end
end

return