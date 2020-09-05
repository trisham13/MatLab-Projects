%% Math 111-01: MATLAB (Spring 2019)
% Trisha Menon
% trisha0menon@gmail.com
% 
% Homework Assignment #1: Chapter 2
%
%
%% Problem 2.11
%
%
%---Program Objective ---
% 
% The objective of this program is to calculate the amount of CO2 emitted
% during a year for an array of vehicles after a set amount of miles
% traveled.
%
% Burning one gallon of gasoline in your car produces 19.4 pounds of CO2
%
% ***** START OF PROGRAM *****
clear
clc
format compact
%
% First, define the variables...
mpg = [107; 35; 35; 46; 56; 32];
%
% Calculate the CO2 emission
gallons = 12000./mpg;     % How many total gallons used for the 12000 miles
emissions = gallons*19.4; % Emissions variable is defined in pounds CO2
%
% Display the calculations in tabular form...
autos = char('Smart Car FortwoEV', 'Honda Civic', 'Honda Fit', ...
  'Chevrolet Malibu (Hybrid)   ', 'Toyota Prius (Hybrid)', 'Toyota Yaris');
results = [autos, num2str(emissions)];
disp('CO2 Emissions for Each Vehicle');     % Display the results in 2
disp(' ');                                  %         columns
disp(results);
% ***** END OF PROGRAM *****
%% Problem 2.13
%
%
%---Program Objective ---
% 
% The objective of this program is to create tables for conversions using
% calculations and conversion factors.
%
% ***** START OF PROGRAM *****
clear
clc
format compact
%
% a) Create a table of conversions from feet to meters...
%
% First, define the variables...
feet = (0:1:10);                % The feet variable is defined in ft
%
% Next, convert units to meters
meters = feet .* 0.3048;        % The meters variable is defiend in meters
%
% Display the calculations in tabular form...
Foot = feet';                     % Use the variable names as the headings
Meter = meters';                  % of the columns so transpose before
results = table(Foot, Meter);     % using the table function 
disp('Program 2.13 a:');
disp(' ');
disp(results);
disp(' ');
%
% b) Create a table of conversions from radians to degrees...
%
% First, define the variables...
rad = (0:(pi/10):pi);           % The rad variable is defined in radians
%
% Next, convert units to degrees...
deg = rad .* (180/pi);        % The deg variable is defined in degrees
%
% Display the calculations in tabular form...
Radians = rad';                     % Use the variable names as the headings
Degrees = deg';                     % of the columns so transpose before
results = table(Radians, Degrees);  % using the table function
disp('Program 2.13 b:');
disp(' ');
disp(results);
disp(' ');
%
% c) Create a table of conversions from miles per hour to feet per second...
%
% First, define the variables...
mph = linspace(0,100,15);          % The mph variable is defined in mph
%
% Next, convert units to feet per second...
fps = mph .* 1.46667;        % The fps variable is defined in f/s
%
% Display the calculations in tabular form...
Miles_per_Hour = mph';              % Use the variable names as the headings
Feet_per_Second = fps';             % of the columns so transpose before
results = table(Miles_per_Hour, Feet_per_Second); % using the table function
disp('Program 2.13 c:');
disp(' ');
disp(results);
disp(' ');
%
% d) Create a table of conversions from concentration of hydronium ion to
%    pH...
%
% First, define the variables...
conc = logspace(-3,-1,10);% The conc variable is defined in molars or mol/L
%
% Next, convert units to pH...
ph = -log10(conc);        % The pH variable does not have defined units
%                         % because pH values are unitless and are simply
                          %             scales from 1-14
% Display the calculations in tabular form...
Hydronium_Concentration = conc';   % Use the variable names as the headings
pH = ph';                          % of the columns so transpose before
results = table(Hydronium_Concentration, pH);   % using the table function
disp('Program 2.13 d:');
disp(' ');
disp(results);
disp(' ');
%
% ***** END OF PROGRAM *****
%% Problem 2.17
%
%
%---Program Objective ---
% 
% The objective of this program is to use Newton's Law of Universal
% Gravitation to determine the force exerted by the earth upon the moon.
%
% Newton's Law of Universal Gravitation states...
%                   F = G*((m1*m2)/r^2)
%
% ***** START OF PROGRAM *****
clear
clc
format compact
%
% First, define the variables...
G = 6.673e-11;  % G is a universally defined constant in units of Nm^2/kg^2
mE = 6e24;      % mE is defined in kg and represents the mass of the Earth
mM = 7.4e22;    % mM is defined in kg and represents the mass of the Moon
r = 3.9e8;      % r is defined in meters and represents the distance 
                %           between the moon and earth
%
% Calculate the force using the given equation...
F = G*((mE*mM)/r^2);
%
% Display the calculations...
disp('Problem 2.17');
disp(' ');
disp(F);
disp('   Newtons');
% ***** END OF PROGRAM *****
%% Problem 2.19
%
%
%---Program Objective ---
% 
% The objective of this program is to determine the temperature for 20
% total values with differing values of pressure and volume by utilizing a
% modified eduation, Van der Waals modification of the Ideal Gas Law.
% 
% The Vam der Waals modification states...
%                (P + ((n^2)*a)/V^2)*(V - n*b) = n*R*T
%
% ***** START OF PROGRAM *****
clear
clc
format compact
%
% a) Determine the temperature for 10 different values for pressure
P = linspace(0,400,10);             % P is defined in atmospheres
n = 2;                              % n is defined in moles
V = 1;                              % L is defined in liters
a = 5.536;                          % a is defined in (L^2)*bar/mol^2
b = 0.03049;                        % b is defined in liters/mole
R = 0.08314472;                     % R is defined in L*bar/Kmol
%
% Calculate the temperature using the given equation...
T = (P + ((n^2)*a)/V^2)*((V - n*b)/(n*R));  % T is defined in Kelvin
%
% Display the calculations in tabular form...
Pressure = P';
Temperature = T';
results = table(Pressure, Temperature);
disp('Program 2.19 a:');
disp(' ');
disp(results);
disp(' ');
%
% b) Determine the temperature for 10 different values for volume
P = 220;                            % P is defined in bar
n = 2;                              % n is defined in moles
V = linspace(0.1,10,10);            % L is defined in liters
a = 5.536;                          % a is defined in (L^2)*bar/mol^2
b = 0.03049;                        % b is defined in liters/mole
R = 0.08314472;                     % R is defined in L*bar/Kmol
%
% Calculate the temperature using the given equation...
T = (P + ((n^2)*a)./V.^2).*((V - n*b)/(n*R));  % T is defined in Kelvin
%
% Display the calculations in tabular form...
Volume = V';
Temperature = T';
results = table(Volume, Temperature);
disp('Program 2.19 b:');
disp(' ');
disp(results);
disp(' ');
% ***** END OF PROGRAM *****