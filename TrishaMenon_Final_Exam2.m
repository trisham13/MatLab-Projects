%% Math 111 EXAM #2: Chapters 1-4
%                    McFly's Fly-Bye
%
%
% Your Name:  Trisha Menon
% Your Email: trisha0menon@gmail.com
%
%
% --- Program Description ---
%
% The objective of this program is to create a program that tracks the
% flight path of a projectile missile from one enemy country to another.
% Once achieved, the program must calculate the flight path for an
% interceptor missile to disrupt Country B's missile's path to Country A,
% with both time and distance from Country A taken into consideration.
%
%
% --- START OF PROGRAM ---
%
clear, clc % Prepare display for output
format compact
format bank
% Define Time Interval Array Parameters via User Input...
% ...starting time array element value (in hours)...
start_hour = input('Enter minimum number of McFly travel hours or "quit": ', 's');
quitInput = strcmp(start_hour, 'quit');
if quitInput == 1
    disp('Error')
end
% ...ending time array element value (in hours)...
end_hour = input('Enter maximum number of McFly travel hours: ', 's');
end_hour = eval(end_hour);
% ...number of "speed checkpoint hours" within array...
num_checks = input('Enter number of McFly travel checkpoints: ');
%
% Define Time Interval Arrays...
% ...array of time increments, in hours...
time_hours = linspace(eval(start_hour), end_hour, num_checks);
% ...convert hour array into seconds array...
time_sec = time_hours./60;
%
% Define Parameters Used for Calculations...
% ...array of mileage "checkpoints", based on fly's 25mph flying speed...
radii_miles = 25.*time_hours; % Calculates the distance traveled at
                             % each checkpoint based on the constant
                             % speed of 25 mph
% ...scalar of rotational speed of Cosmic Turntable, in RPMs...
rev_min = 45;                % The disc rotates at a constant rate in RPM
% ...convert rotational speed to Revolutions per Second...
rev_sec = rev_min*60;        % The disc rotates at a constant rate in RPS
% ...convert rotational speed (revs/sec to angular speed (radians/sec)...
rad_sec = rev_sec*(2*pi);    % The disc rotates at a constant rate in rad/s
% ...define speed of light in miles per second...
light_speed = 186282;        % According to Google in m/s
%
% Initialize All Variables Required for Iterative Calculations...
col=1;                 % keeps track of element row location
fly_speed(1) = 0;      % builds 1xn fly-speed array (to plot fly speed)
calc_speed = 0;        % initial while-loop counter (for below)
plot_hour(1) = 0;      % builds 1xn hour array (to plot x-axis)
plot_light(1) = 0;     % builds 1xn lightspeed array (to plot SoL)
%
% Launch While-Loop to Calculate Fly Speed at Checkpoint Intervals
% (Note: The loop ends when fly speed exceeds speed of light)
%
% I have decided that I will figure out when McFly will attain or exceed
% lightspeed using a WHILE loop. Problem is, I have not quite figured out
% how such a loop works, so I will save the work for later....
while calc_speed < light_speed % Start building plot info
	plot_hour = plot_hour + ((end_hour - start_hour)/num_checks);
    plot_light = 186282;         % - Speed of Light graph, remains constant
    fly_speed(col) = fly_speed(col-1) + rad_sec*3600*radii_miles;
                                 % ^^ McFly linear speed graph
    calc_speed = fly_speed(col); % Reset Loop Parameter
    col = col+1; % Track element col#
end
%
% Define Output Array Strings...
% ...Hours of Flight Time Required for Success...
Result1 = ['Whoa! McFly just went bye after flying: ',...
    num2str(time_hours(col+1)), ' hours'];
% ...Radius of ICD at Time of Success...
Result2 = ['...when McFly''s distance from the center of the ICD was: ',...
    num2str(radii_miles(col)), ' miles'];
% ...Linear Velocity at Time of Success...
Result3 = ['...and McFly''s linear velocity was: ',...
    num2str(fly_speed(col-1)), ' miles/sec'];
% ...Graphical Point of Intersection (for gtext command)...
Result4 = ['(', num2str(time_hours(col)), ', ',...
    num2str(fly_speed(col)),')'];
%
% Display Results...
%
fprintf('\n \n')
disp(Result1), %s) % Display hour of success
disp(Result2), %s) % Display ICD radius at time of success
disp(Result3), %s) % Display linear speed at time of success
% fprintf('%s \n', Result1)
%
clc
% Plot Results...
hold on
plot(plot_hour,fly_speed, plot_hour,plot_light)
plot(time_hours(col-1), fly_speed(col-1))
xaxis[0 time_hours(col-1)+0.1*time_hours(col-1]
yaxis[0 220000]
title('McFly''s Fly-Bye')
xlabel('Time(hrs)')
ylabel('Velocity(mi/sec)')
legend('Fly Speed', 'Speed of Light', 'location','southeast')
grid
textg(Result1)
% --- END OF PROGRAM ---