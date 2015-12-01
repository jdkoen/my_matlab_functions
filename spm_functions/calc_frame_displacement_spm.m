function [fwMat_deg, fwMat_mm, fwDisp] = calc_frame_displacement_spm(rpMat,headRadius)
% USAGE:
%   [fwMat_deg, fwMat_mm, fwDisp] = calc_frame_displacement_spm(rpMat,headRadius)
%
% DESCRIPTION:
%   This function calculates the framewise displacement as described by
%   Power et al. (2012) on motion parameters estiamted from SPM software. 
%
% INPUTS:
%   rpMat       - M x N matrix of motion parameters. The rows represent time,
%                 and the columns represent the motion parameters in the
%                 following order: X, Y, Z, Pitch, Roll, Yaw. 
%   headRadius  - Scalar value indicating the radius (in mm) to convert the
%                 roration parameters to mm displacement. 
%
% OUTPUTS:
%   fwMat_deg   - M x N matrix of the same size as rpMat with scan-to-scan
%                 change in motion of the six parameters. Translaation
%                 parameters are in mm and rotation parameters are in
%                 degrees. 
%   fwMat_mm    - Same as fwMat_deg, but both translation and rotation
%                 parameters are in mm. 
%   fwDisp      - M x 1 column vector with framewise displacement measure.
%                 This value is simply the across column sum of the
%                 absolute values of each row in fwMat. 
%
% Created by: Joshua D. Koen
% Created on: 10/13/15

%% Check inputs
% Size of rpMat
if size(rpMat,2) ~= 6
    error('rpMat does not have six columns.')
elseif ~isscalar(headRadius)
    error('headRadius input must be scalar')
end

%% Convert rotation parameters to degrees
rpMat_deg = rpMat;
rpMat_deg(:,4:end) = rad2deg(rpMat(:,4:end));

%% Calculate fwMat_deg (frame displacement: translation in mm, rotation in deg)
fwMat_deg = vertcat( ...
    zeros(1,6), ...
    rpMat_deg(2:end,:) - rpMat_deg(1:end-1,:));

%% Convert rotation parameters to mm given headRadius
rpMat_mm = rpMat_deg;
rpMat_mm(:,4:end) = ((2*headRadius)*pi*rpMat_deg(:,4:end))/360;

%% Calculate fwMat_mm (frame displacement all in mm units)
fwMat_mm = vertcat( ...
    zeros(1,6), ...
    rpMat_mm(2:end,:) - rpMat_mm(1:end-1,:));

%% Calculate fwDisp
fwDisp = sum(abs(fwMat_mm),2);

end

