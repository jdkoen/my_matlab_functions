% USAGE:
%   spikeMat = create_fd_spike_regs(FD,spikeThresh,spikeWin)
%
% DESCRIPTION:
%   This function creates regressors for movement spikes from a vector of
%   frame displacement (FD) values. 
%
% INPUTS:
%   FD          - Vector of FD values
%   spikeThresh - Scalar value indicating threshold above which a scan is
%                 labeled a spike" 
%   spikeWin    - 2 element vector specifying the number of scans before
%                 and after a spike to also call a spike. The first element
%                 corresponds to the number of scans before the spike, and
%                 the second element correspons to the number of scans
%                 after the spike. 
%
% OUTPUTS:
%   spikeMat   - M x N matrix of spike regressors. Each column represents a
%                spike for an inidividual scan, and should sum to 1. The
%                number of rows will be the same length as the FD vector.
%
% Created by: Joshua D. Koen
% Created on: 12/08/15

function spikeMat = create_fd_spike_regs(FD,spikeThresh,spikeWin)

%% Error check
% Check FD
if ~isvector(FD)
    error('FD must be a vector input.')
end

% Check spikeThresh
if ~isscalar(spikeThresh)
    error('spikeThresh must be scalas.')
end

% Check spikeWin
if ~isvector(spikeWin) || numel(spikeWin) ~= 2
    error('spikeWin must be a 2-element vector.')
end

%% Create spikeMat
% Find spikes above spikeThresh 
spikes = find(FD > spikeThresh);
spikes = [spikes spikes-spikeWin(1) spikes+spikeWin(2)];
spikes = unique(spikes(:)); % Ensure spikes is a vector and remove duplicates
spikes(spikes > length(FD)) = []; % Remove spikes after last scan
spikes(spikes < 1) = []; % Remove spikes before 1st scan

% Mark spikes in a matrix
if ~isempty(spikes)
    spikeMat = zeros(length(FD),length(spikes));
    for i = 1:length(spikes)
        spikeMat(spikes(i),i) = 1;
    end
else
    spikeMat = [];
end

end
    


