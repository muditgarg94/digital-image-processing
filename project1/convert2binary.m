function y=convert2binary(img)

[p,q,r]=size(img);

%covnerting the colored image to grayscaled image
if(r==3)
    img=rgb2gray(img);
end

%evaluating the threshold
val=sum(sum(img));
threshold=val/(p*q);

%creating a binary image
y=zeros(p,q);
img=double(img);
for i=1:p
    for j=1:q
        if(img(i,j)>threshold)
            y(i,j)=255;
        end
    end
end
%changing the datatype of new image y
y=uint8(y);
return