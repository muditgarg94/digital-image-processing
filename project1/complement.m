function output=complement(img)

[m,n]=size(img);
output=zeros(m,n);

for i=1:m
    for j=1:n
        if(img(i,j)==1)
            output(i,j)=0;
        else
            output(i,j)=1;
        end
    end
end

return