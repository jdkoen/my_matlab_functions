function pR = compute_source_pR(hits,inc,dk)
% USE:
%   pR = compute_source_pR(hits,inc,dk);
%
% DESCRIPTION:
%   COMPUTE_SOURCE_PR calculates a single-high threshold estimate of source
%   accuracy correcting for guesses and don't know responses. This can be
%   used to caluclate source pR from a task wihtout a don't know (DK)
%   option simply by entering the dk input to 0.
%
%   The inputs should all be frequencies, as the proportion of source
%   memory hits, source incorrects, and source don't know responses are
%   computed by taking one value (hits) and dividing it by the sum of all
%   three values. 
%
% INPUTS:
%   hits - Number of trials receiving an accurate source memory response
%          (source hits)
%   inc  - Number of trials receiving an incorrect source memory response
%          (source incorrect)
%   dk   - Number of trials receiving a don't know response on the source
%          memory judgment (source don't know)
%
% Created by Joshua D. Koen
% Created on September 5, 2017

% Provide warning if not a whole number
if all(rem([hits inc dk],1) ~= 0)
    warning('One of the inputs appears to be a decimal...check inputs before trusting results.')
end

% Compute number of trials
nTrials = sum([hits,inc,dk]);

% Compute trial proportions
pHit = hits / nTrials;
pInc = inc / nTrials;
pDK = dk / nTrials;

% Compute pR
pR = (pHit - .5*(1-pDK)) / (1 - .5*(1-pDK));

end