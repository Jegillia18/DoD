%% DOD TMS Analysis
% Cazmon Suri
% Script for importing data from the following spreadsheet:
clear
clc

Analysis = 0;

p = input('What Participant is being analyzed, p = '); 

while Analysis == 0



Session = input('Input the session being analzyed (PRE=1,POST=2,FOLLOW-UP=3), Session = '); 
RorA = input('Is this resting or active (Resting=1,Active=2), RorA = '); 


%% Import the data

filelocation = sprintf('691_P%d_TMS_data_reduction_50ms_matlab.xlsx',p);

if Session == 1
    sheet = sprintf('peak-to-peak_pre');
elseif Session == 2
    sheet = sprintf('peak-to-peak_post');
elseif Session == 3
    sheet = sprintf('peak-to-peak_followup');
end

[~, ~, TMS_Table] = xlsread(filelocation,sheet);

% Reads the DOD excel file. The first part specifies the location and
% file name to be read. The second part specifies the sheet.
% It is then saved in a matrix called tms table.


TMS_Table(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),TMS_Table)) = {''};                       % Searches the table for unreadable cells and makes them empty.

idx = cellfun(@ischar, TMS_Table);                                                                       % Searches for all cells that have characters in them and saves the index location
TMS_Table(idx) = cellfun(@(x) string(x), TMS_Table(idx), 'UniformOutput', false);                        % Replaces empty cells with ""

%% Clear temporary variables
clearvars idx;                                                             %Clears the saved indexed locations

%% Analysis

MSO = TMS_Table(:,3);                                                      % Saves % MSO column as a cell array (iso cell)
MSO = MSO(3:end);                                                          % Saves the %MSO from the 3rd row (where the values start)to the end
MSO = cell2mat(MSO);                                                       % Converts the cell array into a regular matrix

frames = TMS_Table(:,1);                                                   % Saves the frames column as a cell array (iso cell)
frames = frames(3:end);                                                    % Saves the frames from the 3rd row (where the values start)to the end
frames = cell2mat(frames);                                                 % Converts the cell array into a regular matrix



%%
frame_start = input('Input the starting frame number for this analysis, frame_start = ');                % Sets the starting frame number for the range you want to analyze
frame_end = input('Input the ending frame number for for this analysis, frame_end = ');                  % Sets the end frame number for the range you want to analyze
                                                  

for i=1:length(frames)                                                     % Matches the the start frame you want to analzye with their indexed location number and changes start frame accordingly
if frames(i) == frame_start                                                % Checks to see if the value of frame_start equals frames current i. If so saves frame_start as i.
    frame_start = i;
end
end
for i=1:length(frames)                                                     % Matches the the end frame you want to analzye with their indexed location number and changes end frame accordingly
if frames(i) == frame_end                                                  % Checks to see if the value of frame_end equals frames current i. If so saves frame_end as i.
    frame_end = i;
end
end 

%NOTE: If the frame_start and/or frame_end is the same as your initial
%input then it is most likely that the frame was deleted from the excel file
%and not to be analzyed. 


% Creates groups based on the MSO groups in the range you selected
[G,msogrps] = findgroups(MSO(frame_start:frame_end)); 
frames = splitapply(@(x1){round(x1,6)},frames(frame_start:frame_end),G);

run('MEP')                                                                 % Runs the MEP code to analzye data for set time frames
run('POST_SUB')                                                            % Runs the POST_SUB code to analzye data for set time frames
run('PRE_SUB')
run('MT') 
run('COMBINE')
                                         % Runs the MT code to analzye data for set time frames


%% Excel Write


run('Excel')
%% %% Clearing variables 


Analysis = input('Are you finished (No=0, Yes=1), Analysis = '); 
run('Variable_Clear')

end