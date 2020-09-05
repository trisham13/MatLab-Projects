function [d,v,a] = motion(x)
% This function calculates the 3 values for distance, velocity, and
% acceleration from the inputted value, x, using the algorithms shown
% below.
%
format compact
d = (x.^2)/12;
v = (x.^2)/4;
a = 0.5.*x;
end