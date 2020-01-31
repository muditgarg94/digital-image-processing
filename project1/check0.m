function [ c0 ] = checkzeros( M,p,q )

 c0=0;
    for k=1:length(p)
        if M(p(k),q(k)) == 0
        c0=c0+1  ;   %if a zero is present then increase the count and 
                     % break loop
        break
        end
    
    end

end
