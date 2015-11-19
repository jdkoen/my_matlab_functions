% USAGE:
%   p = cauchypdf(x,mu,scale)
%
% DESCRIPTION:
%   Returns the probability density at each x from a Cauchy
%   distribution. The input parameters are the peak position of
%   distribution (a) and the scaling factor (b). 
%
% INPUTS:
%   x       - Vector of observed data point(s). 
%   a       - (Scaler) Location of peak density.
%   b       - (Scalar) Scaling factor.
%
% Created by: Joshua D. Koen
% Created on: 11/18/2015

function p = cauchypdf(x,a,b)

p = ( pi.*b + pi.*b.*((x-a)./b).^2 ).^-1;
    
end