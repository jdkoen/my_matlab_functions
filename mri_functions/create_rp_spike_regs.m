% USAGE:
%   spikeMat = create_rp_spike_regs(rpDisp,tThresh,rThresh,spikeWin)
%
% DESCRIPTION:
%   This function creates regressors for movement spikes estimated from
%   displacement in the translation and rotation realignment parameters. 
%
% INPUTS:
%   rpDisp      - M x N matrix of motion parameters with values reflecting
%                 the change from the previous scan. The rows represent
%                 time, and the columns represent the motion parameters in
%                 the following order: X, Y, Z, Pitch, Roll, Yaw. 
%   tThresh     - Scalar value representing the threshold at which a
%                 translation displacement is considered a spike. The units
%                 for this is mm. 
%   rThresh     - Scalar value representing the threshold at which a
%                 rotation displacement is considered a spike. The units
%                 for this is degrees. 
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

function spikeMat = create_rp_spike_regs(rpDisp,tThresh,rThresh,spikeWin)

%% Check inputs
% Size of rpDisp
if size(rpDisp,2) ~= 6
    error('rpDisp does not have six columns.')
end

% tThresh and rThesh
if ~isscalar(tThresh) || ~isscalar(rThresh)
    error('tThresh and rThresh must be scalar inputs')
end

% Check spikeWin
if ~isvector(spikeWin) || numel(spikeWin) ~= 2
    error('spikeWin must be a 2-element vector.')
end

%% Create spikeMat
% Convert rThresh to radians
rThresh = rThresh * (pi/180);

% Get absolute values of rpDisp
rpDisp = abs(rpDisp);

% Get a matrix of bad volums
spikes = [rpDisp(:,1:3) > tThresh rpDisp(:,4:end) > rThresh];
spikes = find(sum(spikes,2) > 0);
spikes = [spikes spikes-spikeWin(1) spikes+spikeWin(2)];
spikes = unique(spikes(:)); % Ensure spikes is a vector and remove duplicates
spikes(spikes > size(rpDisp,1)) = []; % Remove spikes after last scan
spikes(spikes < 1) = []; % Remove spikes before 1st scan

% Mark spikes in a matrix
if ~isempty(spikes)
    spikeMat = zeros(size(rpDisp,1),length(spikes));
    for i = 1:length(spikes)
        spikeMat(spikes(i),i) = 1;
    end
else
    spikeMat = [];
end

end
