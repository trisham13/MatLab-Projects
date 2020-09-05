%% Math 111-01: MATLAB (Spring 2019)
% Trisha Menon
% trisha0menon@gmail.com
% 
% Homework Assignment #2: Chapter 5
%
%
%% Section 5.3: Other Types of Two-Dimensional Plots
%
%
%---Program Objective ---
% 
% The objective of this program is to calculate the optimal angle from
% which a projectile must be launched in order to maximize the range of
% the projectile at 3 different initial velocities.
%
% The horizontal range of an object shot at an angle is given by the
% following equation (neglecting air resistance):
%               R(theta) = (V^2/g)*sin(2*theta)
%
%% ***** START OF PROGRAM *****
clear
clc
format compact
%
%% First, define the variables...
v0 = [50; 100; 200];    % v0 represents the 3 initial velocities in m/s
g = 9.9;                % g represents the gravitational constants in m/s^2
t = (0:pi/100:pi/2);    % t represents the angle theta in radians
%
%% Calculate the ranges for each initial velocity
r = (((v0.^2)/g)*sin(2.*t))'; % r represents the range of a projectile in meters
optT = asin(max(sin(2*t)))/2; % optT is the angle at which the range is the greatest
[OptT,V0] = meshgrid(optT, v0);    % meshgrid is used to create an array with the
degrees = t.*180./pi;              % optimal degrees that has the same dimensions at the velocity array
Deg = optT*180/pi;    % lines 35-37 all convert the single optimal angle, array of optimal angles,
deg = OptT.*180./pi;  % and the array of all angles from radians to degrees
%
%% Display the calculations in tabular form...
disp('Math 111:      MATLAB for Engineers');        % user output formatting
disp('Your Name:     Trisha Menon');
disp('Email Address: trisha0menon@gmail.com');
disp('Assignment #2: Animated Two-Dimensional Plots');
disp('               and Identifying Extremes');
fprintf('\n\n')
disp('The following table displays the optimum firing angles and');
disp('associated maximum ranges for reach given initial velocity...');
fprintf('\nVelocity     -- Optimal Angles --     Optimal\n');
disp(' (m/s)       Radians     Degrees      Range(m)');
disp('--------     --------    --------     --------');
results = [v0'; OptT'; deg'; max(r)];  % array with the 4 columns
fprintf('    %3d       %0.5f    %2.5f      %4.2f\n', results);
%
%% Display our findings in the form of animated and labeled plots...
comet(degrees, r(:,3));
axis([0,90,0,4500]); % Create own scales to give enough room for the top point label
hold on                 % In order to prevent overwriting, the comet commands had
comet(degrees, r(:,2)); % to be used separately for each column of the velocity
hold on                 % array so all 3 lines would appear on the same plot window.
comet(degrees, r(:,1));
hold on
% The following plot command plots the 3 maxima on each corresponding line
plot(Deg, max(r(:,3)), 'ko', Deg, max(r(:,2)), 'ko', Deg, max(r(:,1)), 'ko');
% Each of the text commands prints the label on the point just above each
% of the maxima points, hence the '+100' to the y-coordinates
text(Deg, (max(r(:,3)))+100, 'Velocity = 200m/s', 'HorizontalAlignment', 'center',...
    'VerticalAlignment', 'bottom', 'FontSize', 12);
text(Deg, (max(r(:,2)))+100, 'Velocity = 100m/s', 'HorizontalAlignment', 'center',...
    'VerticalAlignment', 'bottom', 'FontSize', 12);
text(Deg, (max(r(:,1)))+100, 'Velocity = 50m/s', 'HorizontalAlignment', 'center',...
    'VerticalAlignment', 'bottom', 'FontSize', 12);
% More user output to label the graph and axes
title('Range of Projectile, Given Angle of Departure', 'FontSize', 14,...
    'FontWeight', 'bold');
xlabel('Angle of Departure (Degrees)', 'FontSize', 14);
ylabel('Range of Projectile (Meters)', 'FontSize', 14);
hold off
%
% ***** END OF PROGRAM *****
