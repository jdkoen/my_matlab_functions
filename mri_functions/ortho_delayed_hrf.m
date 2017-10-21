function [SPM,SPM_backup,f] = ortho_delayed_hrf(SPM,earlyCols,lateCols)


% Error check inputs
if all(size(earlyCols) ~= size(lateCols))
    error('Early and Late columns must be the same size.')
elseif ~isvector(earlyCols) || ~isvector(lateCols)
    error('Early/late columns must be a numeric vector input.')
end

% Save backup
SPM_backup = SPM;

% Get design matrix
X = SPM.xX.X;

% N-Late Cols
nLateCols = length(lateCols);
for i = 1:nLateCols
    
    % Get late and early col IDs
    lateID = lateCols(i);
    earlyID = earlyCols(i);
    
    % Get Late and Early regressors
    lateX = X(:,lateID);
    earlyX = X(:,earlyID);
    
    % Orthogonalize
    lateOrtho = lateX - (earlyX * pinv(earlyX) * lateX);
    
    % Store lateOrtho in X
    X(:,lateID) = lateOrtho;
    
end

% Update X to SPM
SPM.xX.X = X;

% Plot a figure of element 1 of earlyCols and lateCols
% Initialize figure
f = figure('Position',[200 100 1600 800],'PaperOrientation','landscape', ...
    'PaperUnits','normalized','PaperPosition',[0 0 1 1],'Color',[1 1 1], ...
    'PaperType','uslegal');

% Determine subplots (2 columns
nRows = ceil(nLateCols/2);
for i = 1:nLateCols
    
    % Create subplot axis
    subplot(nRows,2,i);
    
    % Plot the figure (no scaling)
    plot(X(:,earlyCols(i)),'r');
    hold on;
    plot(X(:,lateCols(i)),'b');
    
    % Make a legend
    legend({'early' 'late'},'box','off');
    title(SPM.xX.name{earlyCols(i)});
    xlabel('TR');
    
end

end


