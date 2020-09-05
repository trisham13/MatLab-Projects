%% Section 4.1, Problem 1: Manipulating MATLAB Matrices
%
%
%---Program Objective ---
%
%The purpose of this program is to develop a table showing the observable
%distance from a the mountain top to the horizon, on the earth and on the
%moon, with varying heights of the mountains.
%
%
%% ***** START OF PROGRAM *****
clear
clc
format compact
%
%% First, request user input for different parameters...
Re = input('What is the radius of the earth, in km? ');%Re is defined in km
Rm = input('What is the radius of the moon, in km? '); %Rm is defiend in km
mne = input('What is the minimum elevation, in m? ');  %mne is defined in m
mxe = input('What is the maximum elevation, in m? ');  %mxe is defined in m
iec = input('What increments should be used, in m? '); %iec is defined in m
%
%% Next, perform calculations using the inputted values...
Elev_km = (mne/1000:iec/1000:mxe/1000); %Creates an array using the given
                                        %min, max, and increment value
Hor_Eart_km = %78
%
%% c) Combine the above data collected into a new 4-column matrix...

% ***** END OF PROGRAM *****