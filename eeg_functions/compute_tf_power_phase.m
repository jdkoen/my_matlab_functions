function [power,phase] = compute_tf_power_phase(tfData) 
% Input data (tfData) can be vectorized or in matrix form. If a matrix
% form, the data is internally vectorized and returned to the same
% dimensions for both power and phase;
%
% phase is returned in degrees (not radians)

% Check if complex 
if isreal(tfData)
    error('tfData must be a series of complex numbers');
end

%% Do computations on vectorized data
% Get real and imaginary portions of data in x and y, respectively
x = real(tfData);
y = imag(tfData);

% Compute power
power = x.^2 + y.^2;

% Compute phase
phase = atan(y./x) * 180/pi;

end

