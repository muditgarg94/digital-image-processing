function [ M ] = partofimage( A,B,i,j )

M=[];
[mb,nb]=size(B);
    for x=1:mb
        for y=1:nb
            M(x,y)=A((x+i-1),(y+j-1));
        end
    end

end