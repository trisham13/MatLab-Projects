%% Math 111-01: MATLAB (Spring 2019)
% Trisha Menon
% trisha0menon@gmail.com
% 
% Quiz #2
%
%---Program Objective ---
% 
% The objective of this program is to calculate and analyze 3 different
% investment options to determine which of the 3 will maximize your return.
%
% The 3 options are as follows:
%       Option 1: Offers 12% annual interest, complounded yearly
%       Option 2: Offers 0.95% monthly interest, compounded monthly
%       Option 3: Offers 0.0312% daily interest, compounded daily
%
%% ***** START OF PROGRAM *****
clear
clc
format compact
%
%% First, a little text for the heading...
disp('Math 111:      MATLAB for Engineers')
disp('Your Name:     Trisha Menon');
disp('Email Address: trisha0menon@gmail.com')
disp('Quiz #2:       Compound Interest Investment Comparison');
fprintf('\n\n')
%
%% Now, define the variables...
AnnI = 1000;  %This represents the initial investment value in $ for the annual rate
MonI = 1000;  %This represents the initial investment value in $ for the monthly rate
DayI = 1000;  %This represents the initial investment value in $ for the daily rate
%
%% Calculate the returns based on the rates given...
for index1 = 1:1         % index1 only goes up once because this for loop
    AnnI = AnnI*1.12;    % is for the annual compound rate, which
end                      % only happens once in a year

for index2 = 1:12        % index2 goes up 12 times for the loop because
    MonI = MonI*1.0095;  % it is for the monthly compound rate, which
end                      % happens 12 times in a year

for index3 = 1:365         % index3 goes up 365 times for the loop because
    DayI = DayI*1.000312;  % it is for the daily compound rate, which
end                        % happens 365 times in a year
%
%% Display the calculations and format...
format bank
fprintf('\nThe amount earned from Investment Option #1: $%0.2f', AnnI);
fprintf('\nThe amount earned from Investment Option #2: $%0.2f', MonI);
fprintf('\nThe amount earned from Investment Option #3: $%0.2f\n', DayI);
% ***** END OF PROGRAM *****
