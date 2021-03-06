% Created by: Jessica Gilliam
% Created on: 11/10/2021

% Code Description: For Evan NIH TSS Study

% Study Methodology Notes: 
    % 4 EMG Channels TA (ch.?), SOL, HAM, QUAD
    % Additional Waveform channel CED (Port 3, Sequencer channel set up
    % Channel 16)
    % Channel 15 is the goniometer for the knee flexion
    % Channel 31 & 32 keyboard and Digital markers
    % Drop cursors based on the first waveform, secondary cursor does not
    % matter as much as long as it captures the full EMG waveform
   
    % Outcomes:
    % [1]  Time to Onset (Onset = above 50 mV)
    % [2]  Duration of EMG (Onset to Offset)   (Offset = below 50 mV) 
    % [3]  Peak to Peak - (Lowest point to highest??)
    % [4]  RMS - Just one value??

    % 46 Participants
    % 3 Days each 
    % 4 files per day - for single and multi (Pre/Post)
        % Each file has 3 "sweeps/trials" to evaluate
        
    % Potential Naming convention
    % P1_D1_T1_pre (Participant# Day # Trial # Pre/Post
    %  P1 (1:46) D1 (1:3) T (1:3)
    
    % The different trials are the areas between the cursors, should only
    % have one event marker for each trial exported
    

%% Import data from singular pulse
clear; clc;
%   
cd 'C:\Users\jg300416\Documents\MATLAB\DoD\Evan\Spike2_GRASS'
set = []; %participant number set


%% Import data from Spike2

for y = 1:length(set)
    p = set(y);
    ParticipantData.(['Participant_',num2str(p),]) = table();
    for d = 1:3
        for t = 1:3
            
            
            %data = load(sprintf('691_P%d_pre_corticalexcitability-MCD data_thenar.xlsx',p));
            
        end
    end
    
end

load('Trial_11_17_21_Burst_1_2.mat');
TA_val = Trial_11_17_21_all_burst_TA.values;
TA_time = Trial_11_17_21_all_burst_TA.times;
Sol_val = Trial_11_17_21_all_burst_Sol.values;
Sol_time = Trial_11_17_21_all_burst_Sol.times;
Quad_val = Trial_11_17_21_all_burst_Quad.values;
Quad_time = Trial_11_17_21_all_burst_Quad.times;
Ham_val = Trial_11_17_21_all_burst_Ham.values;
Ham_time = Trial_11_17_21_all_burst_Ham.times;


Threshold = .30; % microVolts
p = 1; t = 1;

% The following will be made into a table once the import is corrected,
% because right now t = 1 causing it to import into seperate matrices 

