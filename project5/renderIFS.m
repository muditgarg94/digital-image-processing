%%%%%%%%%%%%% renderIFS.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       To run the IFS algorithm given by Peitgin
%
% Input Variables:
%
% Returned Results:
%
% Processing Flow:
%
% The following functions are called:  
%       win.m
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        04/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function img=renderIFS(L,M,P,num,xmin,xmax,ymin,ymax)
I=zeros(L,M);
x=0;
y=0;
Imax=0;
for n=1:num
    r=rand();
    if(r<0)
        r=0;
    elseif(r>1)
        r=1;
    end
    
    sum=P(1);
    k=1;
    while(sum<r)
        k=k+1;
        sum=sum+P(k);
    end
    
    [x,y]=win(x,y,k);
    
    if(x>xmin && x<xmax && y>ymin && y<ymax)
        l=ceil(L*(x-xmin)/(xmax-xmin));
        m=ceil(M*(y-ymin)/(ymax-ymin));
        I(l,m)=I(l,m)+1;
        Imax=max(Imax,I(l,m));
    end
end

%I=int8(I>1)*255;
img=I;


return