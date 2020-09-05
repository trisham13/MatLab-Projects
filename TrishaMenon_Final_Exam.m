%% Math 111 Final Exam
%           Interceptor Project
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
clear, clc, clf
format compact
%
% Define the variables...
global t
t = (0:0.04:30);          % t is a the time vector in minutes with increments
                            % of 0.04 minutes from 0 to 30
d = (0:6000);             % d is a distance vector in miles between Countries
                            % A and B with default increments of 1 mile

a0 = 0.127696;            % Angles from Station 1 to each point of sighting
a3 = 0.250201;              % All angles are in radians
a4 = 0.299485;

b0 = 0.281232;            % Angles from Station 2 to each point of sighting
b3 = 0.729737;              % All angle are in radians
b4 = 0.972377;


global d1_2
d1_2 = 1500;              % Distance between stations 1 and 2
da_1 = 2500;              % Distance between Country A and station 1
da_2 = 4000;              % Distance between Country A and station 2
da_b = 6000;              % Distance between Countries A and B


d2_0 = TrishaMenon_d_from_sight(a0,b0);    % Using the d_from_sight function I created,
d2_3 = TrishaMenon_d_from_sight(a3,b3);      % these distances are calculated based on 
d2_4 = TrishaMenon_d_from_sight(a4,b4);      % the angles between the sighting and the 2 stations

ds_b = 2000 - d2_0;            % ds_b represents the distance between Country B
                                 % and the first sighting of the projectile
                                 % by Country A's Station 2 based on the
                                 % calculation done to find the distance
                                 % between Station 2 and the position of
                                 % the projectile at the first sighting

x0 = 0;                        % All the x and y values represent the
y0 = TrishaMenon_y_coor(b0, d2_0);           % coordinates of the projectile at each
x3 = 3;                          % sighting using the function y_coor which
y3 = TrishaMenon_y_coor(b3, d2_3);           % finds the y-coordinate based on the angle
x4 = 4;                          % from Station 2 and the distance between
y4 = TrishaMenon_y_coor(b4, d2_4);           % projectile at each sighting and the Station

Vx = d2_3/(x3 - x0);           % Vx represents the horizontal velocity of the 
                                 % projectile based on the formula given

TrishaMenon_get_time_func(0, y0, 3, y3, 4, y4); % The get_time_func produces the function
                                      % for the flight path of the
                                      % projectile based on time and the 3
                                      % coordinates for the sightings
height = (-288/5)*((t - 25/6).^2)+1000; % height is the given, hard-coded
                                          % function for the interceptor
                                          % flight path as function of time
d_from_s = Vx*t;    % d_from_s is the distance from the sighting(t=0) as
                      % function of time and the calculated velocity of the
                      % projectile

global a b c            % a,b,and c are the cooefficients for the time
                          % function of the projectile. They are set as
                          % global because their values are shared bewteen
                          % this main script and the get_time_func
                          % function.
% Next, start plotting our flight paths on the 3D plot windows...
plot3(d_from_s, t, a.*(t.^2) + b.*t + c)  % Begin by plotting the projectile
                                            % function in terms of time and
                                            % distance in terms of time as
                                            % well
axis([0 6000 0 30 0 1000]) % Axis to contain the distance between the 2 countries
xlabel('Distance from First Sighting(mile)')   % distance is the x-axis
ylabel('Time since First Sighting(min)')      % time is the y-axis
zlabel('Altitude(mile)')                       % height is the z-axis
grid on
hold on    % ensures that all the plots are to be displayed on the same plot
plot3(d_from_s, t, (-288/5)*((t - 61/6).^2)+1000) % Graph of the interceptor
                                                    % flight path in terms
                                                    % of time and adjusted
                                                    % to be in line with
                                                    % Station 2, where it
                                                    % is being launched
                                                    % from
legend('Projectile Flight Path', 'Interceptor Flight Path', 'AutoUpdate', 'off')
text(d2_0, d2_0/Vx, 0, 'x Station 2')
text((d2_0 + d1_2), (d2_0 + d1_2)/Vx, 0, 'x Station 1') % Labels for each location on the graph
text(da_b - ds_b, (da_b - ds_b)/Vx, 0, 'x Country A') 

y = t;        % time is the y-axis so it's values will be reassigned for the loop
bob = 0;      % trigger to break the while loop when the projectiles meet
count1 = 1;   % counter for the projectile's flight path
count2 = 1;   % counter for the interceptor's flight path
x = zeros(1, length(t));    % we will create an array for the distance 
                              % that is the same size as the time array
z1 = zeros(1, length(t));   % we will create another empty array of the 
z2 = zeros(1, length(t));     % same size for the heights for each projectile
Handle_Point1 = plot3(x,y,z1,'wo');  % plot a baseline from which the data
Handle_Point2 = plot3(x,y,z2,'wo');    % points will be set after being calculated
while count1 <= length(t)       % we will need to limit count1 because it 
                                  % cannot exceed the length of the time array
    if y(count1) > 7 && abs(z2(count2) - z1(count1)) <= 1 % When the projectiles
                                                            % come within a
                                                            % mile of each
                                                            % other...
        text(x(count1) + 100, y(count1), z1(count1), 'BOOM!')
        bob = 1;                                % the demarcation will be displayed
                                                  % and the trigger will be
                                                  % pulled to break the
                                                  % rest of the while loop
    else
        count1 = count1 + 1;            % if not, the counters will continue
        count2 = count2 + 1;              % and the plot will continue being produced
    end
    
    if bob == 1                         % here is where the trigger will be
        break                           % felt and it will continue to break the loop
    end
    
    x(count1) = Vx*y(count1);           % the relationship between the y and x-axes
                                          % is that the x-axis - distance -
                                          % is the time - y-axis - times
                                          % the horizontal velocity of the
                                          % projectile
    z1(count1) = a.*(y(count1).^2) + b.*y(count1) + c;  % the z-axis is simply
                                                          % the height
                                                          % function for the
                                                          % projectile in 
                                                          % terms of time
    set(Handle_Point1, 'xdata', x, 'ydata', y, 'zdata', z1);
    plot3(x(count1), y(count1), z1(count1), 'o')    % the new data will be 
    drawnow                                           % set and plotted
                                                      % simultaneously with
                                                      % the interceptor
                                                      % plot below

    x(count2) = Vx*y(count2); % these x and y-axes have the same ratio as above
    z2(count2) = (-288/5)*((y(count2) - 61/6).^2)+1000; % height function 
                                                          % for the interceptor
    set(Handle_Point2, 'xdata', x, 'ydata', y, 'zdata', z2);
    plot3(x(count2), y(count2), z2(count2), 'o')    % set the data for the
    drawnow                                           % second base plot
                                                      % and draw simultaneously
end
hold off
%
% Now for formatted output display for specifications and formulas to be
%  presented...
disp('Trisha Menon (trisha0menon@gmail.com)')
disp('Math 111-01: Interceptor Project')
fprintf('\n\n\n')
disp('THE INTERCEPTOR FLIGHT PATH FUNCTIONS...')
disp('   1) The Interceptor flight path function whereby height is a function')
disp('      of horizontal distance from the first sighting is... ')
disp('           I(x) = (-288/5)*(((300*t) - 25/6).^2)+1000')
disp('   2) The Interceptor flight path function whereby height is a function')
disp('      of time from the first sighting is... ')
disp('           I(x) = (-288/5)*((t - 25/6).^2)+1000')
disp(' ')
disp('THE PROJECTILE FLIGHT PATH FUNCTIONS...')
disp('   1) The Projectile flight path function whereby height is a function')
disp('      of horizontal distance from the first sighting is... ')
fprintf('           P(x) = %0.3fx^2 + %0.3fx + %0.3f\n', a/300, b/300, c/300)
disp('   2) The Projectile flight path function whereby height is a function')
disp('      of time from the first sighting is... ')
fprintf('           P(x) = %0.3fx^2 + %0.3fx + %0.3f\n', a, b, c)
disp(' ')
disp('THE ADJUSTED INTERCEPTOR FLIGHT PATH FUNCTIONS...')
disp('   1) The adjusted Interceptor flight path function whereby height is a function')
disp('      of distance is... ')
disp('           IAdj(x) = (-288/5)*(((300*t) - 61/6).^2)+1000')
disp('   2) The original time-based Interceptor flight path function remains')
disp('      valid as before...')
disp('           IAdj(x) = (-288/5)*((t - 25/6).^2)+1000')
disp(' ')
disp('FLIGHT TIME REQUIRED TO REACH POINT OF INTERCEPTION...')
disp('   1) The Projectile will reach the interception point when total')
fprintf('      flight time t = %0.3f minutes after Sighting #1.\n', y(count1))
disp('   2) The Interceptor will reach the interception point when it')
fprintf('      has achieved a flight time of: %0.3f minutes. \n\n', y(count2))
%
% --- END OF PROGRAM ---