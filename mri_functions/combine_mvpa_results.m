function [allGuess,allActs,allCor,allDesireds] = combine_mvpa_results(results)
% Usage:
%   [allGuess,allActs,allCor,allDesireds] = combine_mvpa_results(results)
%
% This function combines the guesses, act, corrects and desired values
% across all iterations from a results structure variable from the
% Princeton MVPA toolbox into a single vector. This scipt has only been
% tested on results structures returned form ridge regression, but may work
% on others. 
%
% Author: Joshua D. Koen (joshua.koen@utdallas.edu)
% Date: Nov. 22, 2013

% Initialize the guess and acts variables. Time is in the column (2nd)
% dimension.
allGuess = [];
allActs = [];
allCor = [];
allDesireds = [];

% Loop through all iterations and add to allGuess and allActs
for i = 1:length(results.iterations)
    allGuess = [allGuess results.iterations(i).perfmet.guesses];
    allActs = [allActs results.iterations(i).acts];
    allCor = [allCor results.iterations(i).perfmet.corrects];
    allDesireds = [allDesireds results.iterations(i).perfmet.desireds];
end

end