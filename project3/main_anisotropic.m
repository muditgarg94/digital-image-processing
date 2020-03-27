%%%%%%%%%%%%% main_anisotropic.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%       to apply the mean filter on an image using a given mask
%
% Input Variables:
%       img     Input Image
%       mask    Mask Size
%
% Returned Results:
%       filtered_img      Image after applying mean filter on a given image
%       img
%
% Processing Flow:
%       1. Run all the filters on given image.
%       2. Save the images at 1st and 5th iteration
%       3. Save the histogram of the final iteration of each filter.
%
% The following functions are called:  
%       mean_filter
%       median_filter
%       alphatrimmed
%       sigma_filter
%       snn_mean_filter
%       str2func
%       histogram
%
%  Author:      Mudit Garg, Mayank Murali, Niranjan Thirusangu
%  Date:        03/22/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Exponential conduction coefficent
%anisotropic_diffusion('cwheelnoise.gif',20,100,1);
%anisotropic_diffusion('cwheelnoise.gif',30,100,1);
%anisotropic_diffusion('cwheelnoise.gif',40,100,1);
%anisotropic_diffusion('cwheelnoise.gif',50,100,1);

%% Inverse Quadratic conduction coefficient
%anisotropic_diffusion('cwheelnoise.gif',6,100,2);
%anisotropic_diffusion('cwheelnoise.gif',7,100,2);
%anisotropic_diffusion('cwheelnoise.gif',8,100,2);
%anisotropic_diffusion('cwheelnoise.gif',9,100,2);
diff_img=anisotropic_diffusion('cwheelnoise.gif',10,100,2);

%
% Exponental coefficents did not work well.
% it worked fine for quadratic coefficients with samller values of K k=9 or k=10
% gave best answers
%%

