function output=complement(img)

[m,n]=size(img);
output=zeros(m,n);

for i=1:m
    for j=1:n
        output(i,j)=bitcmp(img);
    end
end

return