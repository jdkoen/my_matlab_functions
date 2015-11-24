% USAGE:
%   p = vonmises_mix_unif_pdf(x,mu,sigma,lambda,LL,UL)
%
% DESCRIPTION:
%   Returns the probability density at each x from a mixture of a von Mises
%   distribution and a continuous uniform distribution. The input
%   parameters are mu (peak position of distribution), the scaling factor,
%   the mixing parameter (lambda), and the lower (LL) and upper (UL)
%   limits of the uniform distribution. 
%
% INPUTS:
%   x       - Vector of observed data point(s). All values must be between
%             pi and -pi.
%   mu      - (Scaler) Mean of the (unwrapped) distribution.
%   sigma   - (Scalar) Standard devision of the distribution. In the
%             formula, convert to the scale factor (1/sigma)
%   lambda  - (Scalar) Mixing rate of the wrapped Cauchy (lambda) and the
%             uniform (1-lambda) distributions. 
%   LL      - (Scalar) Lower limit of the uniform distribution.
%   UL      - (Scalar) Upper limit of the uniform distribution.
%
% SEE ALSO:
%   UNIFPDF.m VONMISESPDF.m
%
% Created by: Joshua D. Koen
% Created on: 11/18/2015

function p = vonmises_mix_unif_pdf(x,mu,sigma,lambda,LL,UL)

p = ( lambda * vonmisespdf(x,mu,sigma) ) + ...
    ( ( 1 - lambda ) * unifpdf(x,LL,UL) );

end