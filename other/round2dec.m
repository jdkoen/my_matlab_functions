function data = round2dec(x,decDigs)
% Usage:
%   data = round2dec(x,decDigs)
%
% ROUND2DEC takes X as an input, and rounds each value of x to the number
% of decimals defined by decDigs. 
%
% Example:
%   If x = .946123, 
%
%   then round2dec(x,2) returns .95

% Round to decDigs
data = round((x*10^decDigs)) ./ (10^decDigs);

end