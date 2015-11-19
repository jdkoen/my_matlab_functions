% USAGE:
%   p = wrapped_cauchy_mix_unif_pdf(x,mu,scale,lambda,LL,UL)
%
% DESCRIPTION:
%   Returns the probability density at each x from a mixture of a wrapped
%   Cauchy distribution and a continuous uniform distribution. The input
%   parameters are mu (peak position of distribution), the scaling factor,
%   the mixing parameter (lambda), and the lower (LL) and upper (UL)
%   limits of the distributions. 
%
% INPUTS:
%   x       - Vector of observed data point(s). All values must be between
%             pi and -pi.
%   mu      - (Scaler) Mean of the (unwrapped) distribution.
%   scale   - (Scalar) Scaling factor.
%   lambda  - (Scalar) Mixing rate of the wrapped Cauchy (lambda) and the
%             uniform (1-lambda) distributions. 
%   LL      - (Scalar) Lower limit of the uniform distribution.
%   UL      - (Scalar) Upper limit of the uniform distribution.
%
% SEE ALSO:
%   UNIFPDF.m WRAPPED_CAUCHYPDF.m
%
% Created by: Joshua D. Koen
% Created on: 11/18/2015

function p = wrapped_cauchy_mix_unif_pdf(x,mu,scale,lambda,LL,UL)

p = ( lambda * wrapped_cauchypdf(x,mu,scale) ) + ...
    ( ( 1 - lambda ) * unifpdf(x,LL,UL) );

end