%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       To generate the fern shaped fractal
%
% Input Variables:
%
% Returned Results:
%
% Processing Flow:
%
% The following functions are called:  
%       renderIFS.m
%       
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        04/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear;

L=1024;
M=1024;
P=[0.2,0.35,0.35,0.1];
num=100000000;
img= renderIFS(L,M,P,num,-3,3,0,9);

figure,imshow(img)