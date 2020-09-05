%% Math 111-01: MATLAB (Spring 2019)
% Trisha Menon
% trisha0menon@gmail.com
% 
% Exam #1: Chapters 1-4
%
%---Program Objective ---
% 
% The objective of this program is to create a table that displays a number
% of possible volumes resulting from specific heights and radii given
% hard-coded, as well as by user input.
%
% The volume of a cylinder is given by the equation:
%                   Volume = pi*(radius^2)*(height)
%
%% ***** START OF PROGRAM *****
clear
clc
format compact
%
%% First, a little text for user interface...
disp('This program produces a table of cylinder fuel tank volumes');
disp('based upon tank height and radius measurements.');
disp(' - The minimum tank height is 5 ft and the maximum is 11 ft;');
disp(' - Tank height increases in increments of 1 foot;');
disp(' - The minimum tank radius is 1 ft and the maximum is 4 ft;');
disp(' - Tank radius increases in increments to be determined by the user.');
fprintf('\n\n\n')
disp('=====================');
%% Now, define the variables...
height = (5:11);        % height is defined in feet, and is hard-coded
incr = input('Please input the radius incremental increase parameter (in feet): ');
radius = (1:incr:4);    % radius is defined in feet, and is given by the user
                        %from the input statement seen above
%
%% Calculate the volume using the formula and measurements...
[H,R] = meshgrid(height,radius); % because the number of increments is unknown
                                 % we must use meshgrid for calculations
volume = pi.*(R.^2).*H;          % and dot operations because they are arrays
%
%% Display the calculations in tabular form and format...
disp(' ');
disp('===========================');
disp('Table of Volumes using...');
disp(' - Heights from 5 ft to 11 ft in increments of 1 ft;');
                %^^formatting to let the user known of measurements used
fprintf(' - Radii from 1 ft to 4 ft in increments of %0.4f ft...\n\n\n', incr);
                %^^use fprintf to incorporate the unknown value given by
                %the user
label = ('Height');         % I created single element character arrays
div = ('------');           % so I could use fprintf in place of disp for dividers and column labels
fprintf('Radius    ---------------------------------- %s ----------------------------------\n', label);
fprintf(' (ft)     %0.4fft   %0.4fft   %0.4fft   %0.4fft   %0.4fft   %0.4fft   %0.4fft\n', height);
fprintf('%s    --------   --------   --------   --------   --------   ---------   ---------\n', div);
results = [R(:,1), volume];
fprintf('%0.4fft  %#0.7g   %#0.7g   %#0.7g   %#0.7g   %#0.7g    %#0.7g    %#0.7g\n', results');
% ***** END OF PROGRAM *****
