function [ temp ] = magnify_lma( s,sof )

if nargin == 1
        sof = 3;
    end

rew= round(sof/2);
rew1=rew-1;
[m, n]=size(s);
temp= zeros(m,n);
% Place the filter such that the center of the filter is offsetted from the
% edge of the image by (sof)/2 
   for i=rew:(m-rew)
       for j= rew:(n-rew)
           count=0;
           for p=i-rew1:i+rew1 
               for q= j-rew1: j+rew1
                   count=count + s(p,q);
               end
           end
           
           if count < (sof*sof)
               temp (i,j)= 0;  %% set black
           else
               temp(i,j)=1;
           end
       end
   end

   
end