%%%%%%%%%%%%% main_shape_analysis.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       Given image "match1", perform object extraction using suitable
%       structuring element and calculate the size distribution U(n), pectrum f(n),
%       and complexity H(X|B) of each object. Also, based on the pecstral
%       value, determine the distance as per eqn.(6.11.10) PitasCh6 to
%       match the objects in "match1" to objects in "match3".
%
% Input Variables:
%       img     image "match1"
%
% Returned Results:
%       distance      distance obtained from eqn.(6.11.10) PitasCh6
%
% Processing Flow:
%       1.  Calculate the size distribution, pecstrum and shape complexity of the images
%           function.
%       2.  Determine the distance as per eqn.(6.11.10) PitasCh6 by calling
%           dist_calculation and identify the matching objects.
%
% The following functions are called:  granular_analysis
%                                      dist_calculation
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        02/19/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;

[sd1,fn1,cmplx1]=granular_analysis('match1.gif',true);


%displaying size distribution
disp('size distribution of all the objects in match1.gif');
disp(sd1);

%plotting size distribution
figure, 
h = plot(sd1(1,:),'.');
set(h,'MarkerSize',24)
figure, plot(sd1(1,:));
xlabel('r');
ylabel('U(r)');
title('size distribution of clover in match1.gif')

figure, 
h = plot(sd1(2,:),'.');
set(h,'MarkerSize',24)
figure, plot(sd1(2,:));
xlabel('r');
ylabel('U(r)');
title('size distribution of steer in match1.gif')

figure, 
h = plot(sd1(3,:),'.');
set(h,'MarkerSize',24)
figure, plot(sd1(3,:));
xlabel('r');
ylabel('U(r)');
title('size distribution of airplane in match1.gif')

figure, 
h = plot(sd1(4,:),'.');
set(h,'MarkerSize',24)
figure, plot(sd1(4,:));
xlabel('r');
ylabel('U(r)');
title('size distribution of spade in match1.gif')


%displaying pecstrum
disp('pecstrum of all objects of match1.gif')
disp(fn1);

% plot pecstrum fn1
figure, stem(fn1(1,:));
xlabel('r');
ylabel('f(r)');
title('Pecstrum of colver in image match1.gif');

figure, stem(fn1(2,:));
xlabel('r');
ylabel('f(r)');
title('Pecstrum of steer in image match1.gif');

figure, stem(fn1(3,:));
xlabel('r');
ylabel('f(r)');
title('Pecstrum of airplane in image match1.gif');

figure, stem(fn1(4,:));
xlabel('r');
ylabel('f(r)');
title('Pecstrum of spade in image match1.gif');

%shape complexity
disp('shape complexity of objects of match1.gif');
disp(cmplx1);

[sd2,fn2,cmplx2]=granular_analysis('match3.gif',true);

% In our case, match3 is the image whose objects are to be matched.
% Hence, referenced image is match1
wt= [1,1,1,1,1,1,1,1,1,0,1,0];
distance=dist_calculation(fn2,fn1,wt);
disp('distance between objects is');
disp(distance);



