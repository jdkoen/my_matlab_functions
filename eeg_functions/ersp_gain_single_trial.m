function ersp = ersp_gain_single_trial(data,times)

% Get number of trials
nTrials = size(data,3);
nTimes = size(data,2);

% Get baseline period 
if ~any(times < 0)
    error('no negative values in times...cannot compute prestim baseline power spectrum.');
else
    tMask = times < 0;
end

% Baseline correct each trial
for i = 1:nTrials
    
    % Baseline Power
    bPow = mean(data(:,tMask,i),2);
    
    % Compute P% gain for this trial
    ersp(:,:,i) = data ./ repmat(bPow,1,nTimes);
    
end

% Compute averaged ERSP
ersp = mean(ersp,3);
ersp = 10*log10(ersp);

end