%%%%%%%%%%%%% convolution.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       To compute 1D convolution
%
% Input Variables:
%       img     Input Image
%       sigma   sigma value
%       mask    Mask Size
%
% Returned Results:
%       filtered_img      Image after applying alpha trimmed filter on a given image
%       'img'
%
% Processing Flow:
%       1.  If the mask size is not given, default to 5.
%       2.  If the sigma value is not given, default it to 20.
%       2.  Create a padding around the image.
%       3.  Slide over the padded image equal to the size of mask.
%       4.  Subtract each pixel in sliding window with the middle pixel of
%       the window
%       5.  If the difference is less than equal to sigma, add the pixel
%       value to a variable.       
%       6.  If the sum is not 0, set the average value as pixel value of
%       filtered img.
%       7.  Else, set the original value as pixel value.
%
% The following functions are called:  
%       padding:   Applies the padding of size mask/2 to the given image and returns the padded image. 
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function conv_img=convolution(img, h,axis,sigma, range)
[m,n]=size(img);

index=sigma*range;

conv_img=zeros(m,n);

%disp(length(h))
%% axis=1 represents row wise
if( axis==1)
    disp(size(h));
    for i=index+1: m-(index+1)
        for j=index+1:n-(index+1)
            %disp(size(img(i-index:i+index,j)));
            conv_img(i,j)=sum((img(i, j-index: j+index).*h));
%             tmp=0;
%             for k=-index:index
%                 tmp=tmp+(img(i+k,j)*h(index+1+k));
%             end
%             conv_img(i,j)=tmp;
        end
    end
    
end
%% axis=2 represents col wise

if(axis==2)
    
    for i=index+1:m-(index+1)
        for j=index+1:n-(index+1)
            
            conv_img(i,j)=sum((img(i-index:i+index,j).*h'));
%             tmp=0;
%             for k=-index:index
%                 tmp=tmp+(img(i,j+k)*h(index+1+k));
%             end
%             conv_img(i,j)=tmp;
        end
    end
end

%% axis =3 represents absolute
if(axis==3)
    for i=1:m
        for j=1:n
            conv_img(i,j)=abs(img(i,j));
        end
    end
end
return