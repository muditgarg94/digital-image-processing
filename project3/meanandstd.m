%%%%%%%%%%%%% meanandstd.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       To get the mean and stanadard deviation of the large disk
%
% Input Variables:
%       img     Input Image
%
%
% Returned Results:
%       mu      mean of the large disk
%       std     standard deviation of large disk
%
% Processing Flow:

% The following functions are called:  
%       mu:     mean of the region
%       std:    standard deviation of region
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/23/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [mu,std]= meanandstd(img)

disk=img(50:180,32:152);
mu=mean2(disk);
std=std2(disk);

return