%% Math 111: Introduction to MATLAB%% Lecture: Chapter 6 Supplemental: Animation Using drawnow Function
%          Example #2: Parabolic Flying Wing
%
%
% Program Objective
%
% This program is an example of creating an animation by means of redrawing
% and erasing . In this method, an initial plot is created, and then
% properties of the graph are iteratively adjusted by means of a loop.
%
% In this example, we use a basic parabolic function of the form...
%      y = kx^2 - 2
%
% ...wherein each value of k determines a distinct parabola.  After
% defining the function, the program creates a loop in which successive
% variations (multiples) of the domain array are used as input into the
% function, the results of which lead to variations of the plotted
% parabola.
%
%
% ----- START OF PROGRAM -----
%
% Initiate Workspace
clear, clc, clf      % Clears all current figure and graphics objects not hidden
%
% ----- START OF PROGRAM -----
% Define Base Function, Domain, and Range
x = (-10:0.01:10);     % Define initial independent variable values
k = -1;                % Define initial value for parameter k  
y = k*x.^2 - 2;        % Determine initial set of function output values
count = (1:11);
%
% Define Plot Handle (by which to refer and manage plot properties)
Handle_Parabola = plot(x,y);     % Create plot and assign handle  grid on
%
% Set Up Animation
%
% ...Define Axes...
axis([-10,10,-100,100]); 
%
% ...Set Up Animation Duration of 10 Flaps of the Wings...
for flaps = 1:2
    %    ...Now Perform and Draw a Series of "Up-Flap" Iterations...
    while k<1                     % Initiate loop counter k              
        k = k+0.01;             % Incrementation of counter k
        y = k*x.^2 - 2;         % Re-define the parabolic function
                                % with new k              
        set(Handle_Parabola, 'XData',x, 'YData',y)  % Re-assign x and
        WingFrames(count) = getframe;               % y values of the
                                                    % "Handle_Parabola"
                                                    % plot  
                                                 
        drawnow                 % Re-draw graph with the appropriate
                                % y value (depending on what k was
                                % used). The drawnow command plots
                                % each new (x,y) coordinate as it is
                                % created)
        count = count + 1;
    end                         % End of WHILE loop
    %
    % ...And Perform and Draw a Series of "Down-Flap" Iterations...
    while k>-1                    % Initiate loop counter k
        k = k-0.01;             % Incrementation of counter k              
        y = k*x.^2 - 2;         % Re-define the parabolic function
                                % with new k              
        set(Handle_Parabola, 'XData',x, 'YData',y)  % Re-assign x and
        WingFrames(count) = getframe;               % y values of the
                                                    % "Handle_Parabola"
                                                    % plot
                                     
        drawnow                 % Re-draw graph with the appropriate
                                % y value (depending on what k was
                                % used). The drawnow command plots
                                % each new (x,y) coordinate as it is
                                % created)
        count = count + 1;
    end                         % End of WHILE loop%
end                             % End of FOR loop
movie(WingFrames, 2, 500)
% Create the Video Object (so we can save frames as a video file)  
videoWing = VideoWriter('Wings');
% ...Open a Video File...     
     open(videoWing);
% ...And Write the Frames to the File...    
     writeVideo(videoWing, WingFrames);
% ...And Then Close the File...    
     close(videoWing);
%
% ----- END OF PROGRAM -----
