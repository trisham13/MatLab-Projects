function GUI_Throw()
% The purpose of this primary-function-with-subfunction is to create a
% Graphical User Interface (GUI) that allows user to input parameters
% controlling the velocity and angle of an object traveling within a
% two-dimensional space.
%
format compact     % Supress blank lines between commands, output
clear, clc         % Clear command, workspace windows for program execution
%
% Define Global Variables...
global g velocityBox angleBox   % Three global variables defined
g = 9.81;                       % Assign value to gravitational constant
%                                 variable g (in meters/sec^2)
%
% Create: GUI Figure Window, Plot Plane, Axes, Labels, Title,...
%         (AI location and dimensionvparameters are in pixels)
figure('Position', [450 250 600 500])                    % Window loc, dim
    axes('Units', 'pixels', 'Position', [50 80 350 350]) % xy-plane loc, dim
    axis([0 300 0 100])                                  % xy-axes scales
    xlabel('Distance(m)'), ylabel('Height(m)')           % xy-axes labels
    title('Trajectory of a Ball')                        % xy plot title
hold on                         % Within the same plot window we want to
                                % include all other plot components listed
                                % below (i.e., the UI controls and the
                                % animated commet plot itself)
%
% Create User Interface Controls...
uicontrol('Style', 'text', 'String', 'Initial Velocity (m/s)',...
    'Position', [430 300 150 20]);
velocityBox = uicontrol('Style', 'edit', 'String', '5',...
    'Position', [463, 280 80 20]);
uicontrol('Style', 'text', 'String', 'Elevation Angle (deg)',...
    'Position', [430 240 150 20]);
angleBox = uicontrol('Style', 'edit', 'String', '45',...
    'Position', [463 220 80 20]);
uicontrol('Style', 'pushbutton', 'String', 'Throw',...
    'Position', [463 150 80 30], 'Callback', @pushbuttonCallback)
% ----- END OF PRIMARY FUNCTION -----
%
% ----- START OF SUBFUNCTION -----
function pushbuttonCallback(pushbutton, ~)
% The purpose of this subfunction is to calculate and plot the movement of
% an object within two-dimensional space given the velocity and angle of
% departure provided by the GUI of the primary function.
%
% Define Variables...
global g velocityBox angleBox               % Three global variables  defined
v0 = str2double(velocityBox.String);        % Input from UIC velocityBox
theta = str2double(angleBox.String)*pi/180; % Input from UIC angleBox
t1 = 2*v0*sin(theta)/g;                     % Calculating maximum air
                                            %  time, obtained by solving
                                            %  for t...
                                            %  v0*sin(theta)*t - g*t.^2/2 = 
                                            %  ==> t=0; t=2*v0*sin(theta)/g
t = 0:0.01:t1;                              % Time Array
%
% Distance Calculations...
x = v0*cos(theta)*t;                        % Horizontal distance
y = v0*sin(theta)*t - g*t.^2/2;             % Vertical distance
%
% Plot Animation...
%  axis([0 300 0 100])
comet(x,y);
%   xlabel('Distance(m)'), ylabel('Height(m)')
%   title('Trajectory of a Ball')
end
% ----- END OF SUBFUNCTION -----
end