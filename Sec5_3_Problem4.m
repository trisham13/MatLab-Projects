%% Section 5.3, Problem 4: Rates of Diffusion
%
%
%---Program Objective ---
%
% The purpose of this program is to plot 4 different graphs on a shared
% window that show the relationship between diffusivity of metals and the
% inverse temperature.
%
% Diffusivity is measured by how fast diffusion occurs, and is calculated
% as follows:
%                              D = D0*e^(-Q/RT)
%
%% ***** START OF PROGRAM *****
clear
clc
format compact
%
%% First, define the variables...
D0B = 0.0062;                   %D0 is the diffusivity constant in cm^2/s
QB = 80000;                     %Q is the activation energy in J/mol K
D0F = 0.23;                     %D0 is the diffusivity constant in cm^2/s
QF = 148000;                    %Q is the activation energy in J/mol K
R = 8.314;                      %R is the ideal gas constant in J/mol K
iT = 1./((298:1473));           %iT is the inverse of temp in K
%
%% Next, use the given values in the function to obtain data pointd...
DB = D0B * exp((-QB/R).*iT);
DF = D0F * exp((-QF/R).*iT);
%
%% Now, plot both values on each of the 4 graphs, with different scales...
subplot(2,2,1);
plot(iT,DB,'r', iT,DF,'g');                % First subplot with both
title('Rectangular Graph of Diffusivity'); % linear scales
xlabel('Linear inverse of Temperature');
ylabel('Linear Diffusivity');

subplot(2,2,2);
semilogx(iT,DB,'r', iT,DF,'g');               % Second subplot with linear
title('Semi-Log Graph of Diffusivity');       % y-axis and logarithmic
xlabel('Logarithmic inverse of Temperature'); % x-axis
ylabel('Linear Diffusivity');

subplot(2,2,3);
semilogy(iT,DB,'r', iT,DF,'g');             % Third subplot with linear 
title('Semi-Log Graph of Diffusivity');     % x-axis and logarithmic
xlabel('Linear inverse of Temperature');    % y-axis
ylabel('Logarithmic Diffusivity');

subplot(2,2,4);
loglog(iT,DB,'r', iT,DF,'g');               % Fourth subplot with both
title('Logarithmic Graph of Diffusivity');  % logarithmic scales
xlabel('Logarithmic inverse of Temperature');
ylabel('Logarithmic Diffusivity');
% ***** END OF PROGRAM *****