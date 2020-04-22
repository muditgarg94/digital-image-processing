%%%%%%%%%%%%% renderIFS.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       to apply the symmetric nearest neighbor mean on an image using a given mask
%
% Input Variables:
%       img     Input Image
%       mask    Mask Size
%
% Returned Results:
%       filtered_img      Image after applying snn mean filter on a given image
%       img
%
% Processing Flow:
%       1.  If the mask size is not given, default to 5.
%       2.  Create a padding around the image.
%       3.  Get the window equal to size of mask.
%       4.  For each window, group together the symmetrical pairs.
%       5.  Subtract the middle most element of the window with each value
%       in pair.
%       6. Select the pixel from each pair that is closed to middle pixel
%       i.e have the least difference.
%       7. Take the average of all these pixels.
%       8. Again take the mean of the averaged value and the original pixel
%       9. Set this mean value as the filtered image value.
%
% The following functions are called:  
%       padding: Applies the padding of size mask/2 to the given image and returns the padded image. 
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        04/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function img=renderIFS(L,M,P,num,xmin,xmax,ymin,ymax)
I=zeors(L,M);
x=0;
y=0;
Imax=0;
for n=1:num
    r=rand();
    if(r<0)
        r=0;
    elseif(r>1)
        r=1;
    end
    
    sum=P(1);
    k=1;
    while(sum<r)
        k=k+1;
        sum=sum+P(k);
    end
    
    [x,y]=win(x,y,k);
    
    if(x>xmin && x<xmax && y>ymin && y<ymax)
        l=ceil(L*(x-xmin)/(xmax-xmin));
        m=ceil(M*(y-ymin)/(ymax-ymin));
        I(l,m)=I(l,m)+1;
        Imax=max(Imax,I(l,m));
    end
end

I=int8(I>1)*255;
img=I;


return