% Intitiate Workspace
clear
clc
clf        % Deleted from any current figure all graphics objects not hidden
%
% ----- START OF PROGRAM -----
% Define Base Funtions, Domain, and Range
x = (0: pi/180: 2*pi);
y = 0*x;           % This is our first function to be plotted: a horizontal
                   % line at y = 0. It is plotted below (with the same
                   % command used to create the plot handle
                   % "Handle_Parabola")
%
% Define Plot Handle (by which to refer and manage plot properties later)
Handle_FourPlots = plot(x,y,'o');        % Create plot and assign handle
grid on
hold on
%
% Set Up Animation...
%
% ...Define the axes...
     axis([0,2*pi ,-1.25,1.25]);        % Define axes
%
% ...Use WHILE loop to create second and third functions for plotting
     k = 0;
     count1 = 0;
%
% ...Create iterative loop for successive parabola definitions
     while k<2*pi                               % Initiate loop counter k
        k = k+pi/180;                       % Incrementation loop counter k
        count1 = count1+1;
%    ...Creating second function for plot operation
%       (Each new value for y per each x will replace the value for y
%       created from the previous function for that same x, so long as
%       k < 320)
        y(count1) = sin(x(count1));                         % Function #2: Define parabolic
                                               % function coordinated with
                                               % each new loop counter k
                                               % value
        set(Handle_FourPlots, 'XData', x, 'YData', y)    % Re-assign x and y
                                                        % values of the
                                                        % "Handle_Parabola"
                                                        % plot
%   ...Creating third function for plot operation
%      (Again, each new value for y per each x will replace the value for 
%      y created from the previous function for that same x starting at
%      k = 101)
        drawnow                   % Re-draw of graph with the appropriate y
                                  % value (depending on what k was used).
                                  % The drawnow command plots each new
                                  % (x,y) coordinate as it is created
        y(count1) = cos(x(count1));        % Function #2: Define parabolic
                                               % function coordinated with
                                               % each new loop counter k
                                               % value
        set(Handle_FourPlots, 'XData', x, 'YData', y)    % Re-assign x and y
                                                        % values of the
                                                        % "Handle_Parabola"
                                                        % plot
%   ...Creating third function for plot operation
%      (Again, each new value for y per each x will replace the value for 
%      y created from the previous function for that same x starting at
%      k = 101)
        drawnow                   % Re-draw of graph with the appropriate y
                                  % value (depending on what k was used).
                                  % The drawnow command plots each new
                                  % (x,y) coordinate as it is created
        if k>3
            y(count1) = (1/4)*sqrt((k-6)^2 + k);        % Function #2: Define parabolic
                                               % function coordinated with
                                               % each new loop counter k
                                               % value
            set(Handle_FourPlots, 'XData', x, 'YData', y)    % Re-assign x and y
                                                        % values of the
                                                        % "Handle_Parabola"
                                                        % plot
%   ...Creating third function for plot operation
%      (Again, each new value for y per each x will replace the value for 
%      y created from the previous function for that same x starting at
%      k = 101)
            drawnow                   % Re-draw of graph with the appropriate y
                                  % value (depending on what k was used).
                                  % The drawnow command plots each new
                                  % (x,y) coordinate as it is created
        end
        plot(x(count1), sin(k), 'ob', x(count1), cos(k), 'ob')

     end            % End of WHILE loop