% USAGE:
%   sessRegs = create_session_regs(nScans,allSessions)
%
% DESCRIPTION:
%   This function creates session regressors to model the mean signal in
%   multiple concatenated MRI sessions.
%
% INPUTS:
%   nScans      - Vector of values representing the number of scans in each
%                 session. The number of sessions is determined by
%                 length(nScans).  
%   allSessions - Logical input. If true, each session will have a regressor
%                 representing the mean of the session. If false, which is
%                 recommended, the first session will not have a regressor
%                 for the mean, whereas sessions 2:N will have a regressor
%                 for their respective mean.  
%
% OUTPUTS:
%   sessRegs    - M x N matrix of regressors where the number of columns
%                 represents the number of sessions and the rows represents
%                 the number of scans concatenated across sessions. If
%                 allSessions is TRUE, the number of columns will equal
%                 length(nScans), whereas if allSessions is FALSE, the
%                 number of columns will equal length(nScans)-1.
%
% Created by: Joshua D. Koen
% Created on: 10/13/15
% Modifications:
%   9/21/16 - Changed sessID to start with vertical catenation to reduce
%   error when nScans is not uniform across session. Also fixed a tiny bug
%   where the if ~allSessions end statement does not have an else statement. 

function sessRegs = create_session_regs(nScans,allSessions)

%% Error check input
% nScans
if ~isvector(nScans) || numel(nScans) < 2
    error('nScans must be a vector with at least 2 elements.')
end

% allSessions
if ~islogical(allSessions)
    error('allSessions must be a logical input.')
end

%% Create sessRegs
% Create sessID vector
sessID = [];
for i = 1:length(nScans)
    sessID = vertcat(sessID,repmat(i,[nScans(i) 1]));
end

% Create regressors
sessRegs = zeros(sum(nScans),length(nScans));
sessions = 1:length(nScans);
for i = sessions    
    sessRegs(:,i) = sessID == i;    
end

% If allSessions is FALSE, remove first column
if ~allSessions    
    sessRegs(:,1) = [];    
end
    
end
    



