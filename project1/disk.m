function disk_str=disk(r)

d=2*r;

disk_str=zeros(d+1);

for i=1:d+1
    for j=1:d+1
        x = i - r - 1;
        y = j - r - 1;
        R  = x*x+y*y;
        if R<=(r*r)
            disk_str(i,j)=1;
        end
    end
end


return