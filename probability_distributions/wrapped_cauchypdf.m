% USAGE:
%   p = wrapped_cauchypdf(x,mu,scale)
%
% DESCRIPTION:
%   Returns the probability density at each x from a wrapped Cauchy
%   distribution. The input parameters are mu (peak position of
%   distribution) and the scaling factor. 
%
% INPUTS:
%   x       - Vector of observed data point(s). All values must be between
%             pi and -pi.
%   mu      - (Scaler) Mean of the (unwrapped) distribution.
%   scale   - (Scalar) Scaling factor.
%
% Created by: Joshua D. Koen
% Created on: 11/18/2015

function p = wrapped_cauchypdf(x,mu,scale)

p = (sinh(scale)/(2*pi)) * (cosh(scale)-cos(x-mu)).^-1;
    
end