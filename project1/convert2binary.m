function y=convert2binary(img)

[p,q,r]=size(img);

if(r==3)
    img=rgb2gray(img);
end

val=sum(sum(img));

threshold=val/(p*q);
y=zeros(p,q);
img=double(img);
for i=1:p
    for j=1:q
        if(img(i,j)>threshold)
            y(i,j)=255;
        end
    end
end
y=uint8(y);
return