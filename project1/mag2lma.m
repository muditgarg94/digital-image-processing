function [ f1 ] = threshold_lma( f )
[M, N] = size(f);
for x = 1 : M
    for y = 1 : N
        if f(x,y) > 127
            f1(x,y) = max(f(x,y),255);
        else
            f1(x,y) = 0;
        end
    end
end
f1=f1>1;
end