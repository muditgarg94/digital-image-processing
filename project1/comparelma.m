function [ temps ] = compare_lma( temp2,temp3 )

[m,n]=size(temp2);
temps=ones(m,n);

for i=1:m
    for j=1:n
        if (temp2(i,j)== 0) && (temp3(i,j) == 0)
            temps(i,j) = 0;
        end
        end
end

end