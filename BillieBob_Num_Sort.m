%% Math 111-01: MATLAB (Summer 2019)
% Trisha Menon (trisha0menon@gmail.com)
%
%
% Lecture: Chapter 6.5 - Subfunctions and Nested Function
%          Example #2: BillieBob_Num_Sort Program
% 
% 
% The purpose of this program is to perform the following steps:
%   1) Receive an arbitrary number of numeric input values from the Command
%      Window;
%   2) Sort the numeric data in ascending order using a separate sorting
%      function; and
%   3) Return the sorted numeric data to the Command Window.
%   
% The inputs to this program will be the numeric values keyed in via the
% Command Window by the user. The outputs from this program will be the
% sorted data values returned via the Command Window to the user.
% 
% The program is divided into 3 major steps:
%   1) Read the input data into an array.
%   2) Sort the data in ascending order.
%   3) Write the sorted data.
%   
% Variables Definitions:
%   user_array    - Input numeric data array (from end user via Command
%                   Window)
%   ii            - Index variable during sort iteration
%   nvals         - Number of input values from user numeric array
%   sorted_array  - Sorted numeric data array
%% --- START OF MATH PROGRAM ---
% 
clear, clc
format compact
format bank
%
% Prompt User for Size of Numeric Array to be Sorted, and Allocate...
nvals = input('Enter the total number of values to be sorted: ');
user_array = zeros(1,nvals);    %Pre-allocate the numeric array
%
% Prompt User for Numeric Values to be Sorted, and Assign to Array...
for ii = 1:nvals
    promptstring = ['Enter value No. ', int2str(ii), ': '];
    user_array(ii) = input(promptstring);
end
%
% *** Function Call to Sort Numeric Data ***
%
sorted_array = BB_Sorter(user_array);
%
% *** Return to Main Program ***
%
% Display the Sorted Results
fprintf('\nThe Sorted Results...\n');    % Leader output announcing results
%
for ii = 1:nvals
    fprintf('  %8.4f\n', sorted_array(ii));         % Display each numeric
end
% --- END OF PROGRAM ---