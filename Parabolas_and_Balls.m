% Intitiate Workspace
clear
clc
clf        % Deleted from any current figure all graphics objects not hidden
%
% ----- START OF PROGRAM -----
% Define Base Funtions, Domain, and Range
x = [-16:0.1:16];
y = 0*x;           % This is our first function to be plotted: a horizontal
                   % line at y = 0. It is plotted below (with the same
                   % command used to create the plot handle
                   % "Handle_Parabola")
%
% Define Plot Handle (by which to refer and manage plot properties later)
Handle_Parabola = plot(x,y,'o');        % Create plot and assign handle
grid on
%
% Set Up Animation...
%
% ...Define the axes...
     axis([-16,16,0,30]);        % Define axes
%
% ...Use WHILE loop to create second and third functions for plotting
     k = 0;
%
% ...Create iterative loop for successive parabola definitions
     while k<320                               % Initiate loop counter k
        k = k+1;                               % Incrementation loop counter k
%    ...Creating second function for plot operation
%       (Each new value for y per each x will replace the value for y
%       created from the previous function for that same x, so long as
%       k < 320)
        y(k) = (-25/256)*x(k)^2 + 25;          % Function #2: Define parabolic
                                               % function coordinated with
                                               % each new loop counter k
                                               % value
        set(Handle_Parabola, 'XData', x, 'YData', y)    % Re-assign x and y
                                                        % values of the
                                                        % "Handle_Parabola"
                                                        % plot
%   ...Creating third function for plot operation
%      (Again, each new value for y per each x will replace the value for 
%      y created from the previous function for that same x starting at
%      k = 101)
        if k>100
            y(k-1) = -2*x(k-1)^2 + 25;
            set(Handle_Parabola, 'XData', x, 'YData', y) % Re-assign x and y
                                                         % values of the
                                                         % "Handle_Parabola"
                                                         % plot
        end                       % End of IF statement
        drawnow                   % Re-draw of graph with the appropriate y
                                  % value (depending on what k was used).
                                  % The drawnow command plots each new
                                  % (x,y) coordinate as it is created

     end            % End of WHILE loop