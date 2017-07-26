function runs = create_mvpa_runs_selector(nTRs)
% Usage:
%   runs = create_mvpa_runs_selector(nTRs)
%
% CREATE_MVPA_RUNS_SELECTOR creates a column vector with numeric IDs for
% the runs. The number of runs is equal to the number of columsn in the
% nTRs input. 
%
% Required Input:
%   nTRs - A 1 x M column vector where the number of columns corresponds to
%   the number of sessions in an fMRI scan, and the number in each column
%   corresponds to the number of volumes collected in a given session. For
%   example, the input [100 95] can be read as the 1st fMRI session has 100
%   volumes and the second fMRI session has 95 volumes. 

% Create runs and load it into the subj structure, and create xval indices
runs = [];
for curTR = 1:length(nTRs)
    runs = [runs ones(1,nTRs(curTR))*curTR]; %#ok<AGROW>
end

end
