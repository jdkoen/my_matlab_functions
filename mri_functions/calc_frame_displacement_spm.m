% USAGE:
%   [rpDisp, mmDisp, fwDisp] = calc_frame_displacement_spm(rpMat,headRadius)
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
%                 rotation parameters to mm displacement. 
%
% OUTPUTS:
%   rpDisp      - M x N matrix of the same size as rpMat with scan-to-scan
%                 change in motion of the six parameters. Translaation
%                 parameters are in mm and rotation parameters are in
%                 radians. 
%   mmDisp      - Same as fwMat_deg, but both translation and rotation
%                 parameters are in mm. 
%   fwDisp      - M x 1 column vector with framewise displacement measure.
%                 This value is simply the across column sum of the
%                 absolute values of each row in fwMat. 
%
% Created by: Joshua D. Koen
% Created on: 10/13/15

function [rpDisp, mmDisp, fwDisp] = calc_frame_displacement_spm(rpMat,headRadius)

%% Check inputs
% Size of rpMat
if size(rpMat,2) ~= 6
    error('rpMat does not have six columns.')
elseif ~isscalar(headRadius)
    error('headRadius input must be scalar')
end

%% Calculate displacement mat
rpDisp = vertcat( ...
    rpMat(1,:), ...
    rpMat(2:end,:) - rpMat(1:end-1,:));

%% Calculate mmDisp
mmDisp = rpDisp;
mmDisp(:,4:end) = mmDisp(:,4:end) * headRadius;

%% Calculate fwDisp
fwDisp = sum(abs(mmDisp),2);

end

