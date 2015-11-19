%  USAGE:
%   p = cauchy_mix_unif_pdf(x,a,b,lambda,LL,UL)
%
% DESCRIPTION:
%   Returns the probability density at each x from a mixture of a wrapped
%   Cauchy distribution and a continuous uniform distribution. The input
%   parameters are peak position of distribution (a), the scaling factor
%   (b), the mixing parameter (lambda), and the lower (LL) and upper (UL)
%   limits of the uniform distribution. 
%
% INPUTS:
%   x       - Vector of observed data point(s). All values must be between
%             pi and -pi.
%   a       - (Scaler) Location of peak density.
%   b       - (Scalar) Scaling factor.
%   lambda  - (Scalar) Mixing rate of the Cauchy (lambda) and the
%             uniform (1-lambda) distributions. 
%   LL      - (Scalar) Lower limit of the uniform distribution.
%   UL      - (Scalar) Upper limit of the uniform distribution.
%
% SEE ALSO:
%   UNIFPDF.m WRAPPED_CAUCHYPDF.m
%
% Created by: Joshua D. Koen
% Created on: 11/18/2015

function p = cauchy_mix_unif_pdf(x,a,b,lambda,LL,UL)

p = ( lambda * wrapped_cauchypdf(x,a,b) ) + ...
    ( ( 1 - lambda ) * unifpdf(x,LL,UL) );

end