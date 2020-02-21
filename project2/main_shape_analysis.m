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
%       1.  Calculate the pecstral value by calling granular_analysis
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
    H = plot(sd1,'b');
    xlabel('r');
    ylabel('U(r)');
    % figure, stairs(H)    

[sd2,fn2,cmplx2]=granular_analysis('match3.gif',true);

% plot size distribution sd1 

% sdPlot = plot(sd1);
% xlabel('r');
% ylabel('U(r)');
% title('Size Distribution');
% plot pecstrum fn1


% In our case, match3 is the image whose objects are to be matched.
% Hence, referenced image is match1
distance=dist_calculation(fn2,fn1,[1.505,2,1,2]);


