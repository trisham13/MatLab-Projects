function [resulte, resultm] = Distance(t)
% This function calculates distance in terms of time that an object falls
% on both earth and mars.
%
global eg
global mg
resulte = 0.5*eg*(t^2);
resultm = 0.5*mg*(t^2);
end