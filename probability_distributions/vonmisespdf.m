% USAGE:
%   p = vonmisespdf(x,mu,sigma)
%
% DESCRIPTION:
%   Returns the probability density at each x from a von Mises
%   distribution. The input parameters are mu (peak position of 
%   distribution) and the scaling factor. The order of the modified Bessel
%   function is set to 0. 
%
% INPUTS:
%   x       - Vector of observed data point(s). All values must be between
%             pi and -pi.
%   mu      - (Scaler) Mean of the distribution.
%   sigma   - (Scalar) Standard devision of the distribution. In the
%             formula, convert to the scale factor (1/sigma)
%
% Created by: Joshua D. Koen
% Created on: 11/18/2015

function p = vonmisespdf(x,mu,sigma)

p = exp( (1/sigma) * cos(x-mu) ) / (2 * pi * besseli(0,(1/sigma)) );
    
end