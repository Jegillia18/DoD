%% Code to load and analyze spacticity Data 
% Cazmon Suri
% Note: Code can be adjusted to include and exclude data

%pre [1:56,59:68,72,73,75:80]
%post[1:6,8,10:14,16:31,33,35:56,59:64,67,68,72,73,75:80]
%followup [1:3,8,10,11,16:19,22:24,28:30,35:37,42,45,48:52,54,55,59,60,62,64,73,76,77,80]
%% Main Script to run all functions for each joint
clear;                                                                     % clears all previous variables saved in workspace
clc;                                                                       % clears the command window
close all;                                                                 % closes all current figures
set = [62];
for i = 1:length(set)
for u = set(i)                                                                % "u' is the participant number. Change this for the participant or participant range you wish to analyze.
%% Elbow
close all;  


P_folder =sprintf('UE spasticity reduced individual trials');
   addpath(P_folder)
% flex_folder = sprintf('Flexors');
%    addpath(flex_folder)
   
   
Elbow_variables_all = Elbow_Function(u);                                   % Calls the function for elbow.

%% Wrist

Wrist_variables_all = Wrist_Function(u);                                   % Calls the function for elbow.

%% Finger

Finger_variables_all = Finger_Function(u);                                 % Calls the function for elbow.

%% Outcome Variables

Outcome_Variables = [Elbow_variables_all,Wrist_variables_all,Finger_variables_all]; % Stores all the outcome variables from each funcion in a new variable.
Outcome_Variables_all(i,:) = Outcome_Variables;                            % Stores the outcome variable for each particpant in a new matrix.
end
end 