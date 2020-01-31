function [ c1,c0,r,cl ] = count10_lma( X )

[r,cl]=size(X);

% % %  counting 1's in X
c=0;
for i = 1:r
    for j= 1:cl
        c=c+X(i,j);
    end
end
c1=c; 
c0=(r*cl)-c1;  %   counting 0's in X

% If number of output arguments is 1 then return value of c1(number of 1's)
if nargout == 1
    c1=c1;
end

end
