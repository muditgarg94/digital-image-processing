function [ big ] = hitandmiss_big(  X,Ab,Bb )
%% count number of 1's and 0's in the mask used

[c1Ab,c0Ab,rab,cab]=count10_lma(Ab);
[c1Bb,c0Bb,rbb,cbb]=count10_lma(Bb);
disp('counted number of 1 and 0 in mask of bigger disk')
%% computing hit and miss for biggest disk
temp=e2(X,rab,c1Ab); %%% computing X minksub A
disp('computed minksub of image X with A')
temp2=minksum(X,Bb);   %% computing X minksum B
disp('computed minksum of image X with B')

%% Comapre and magnify the result to get desired result

out=compare_lma(temp,temp2); % compare the result of minksum and minksub
big=magnify2_lma(out,5); % magnify image
for loop=1:14
  big=magnify2_lma(big,5);  
end
big=compare_lma(X,big);  % compare with image X to get desired shape


end