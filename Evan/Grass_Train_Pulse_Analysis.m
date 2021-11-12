% Created by: Jessica Gilliam
% Created on: 11/10/2021

% Code Description: For Dod_Evan

% Study Methodology Notes: 
    % 4 EMG Channels TA (ch.?), SOL, HAM, QUAD
    % Additional Waveform channel input channel 4
    % Channel 31 & 32 keyboard and Digital markers
    % Drop cursors based on the first waveform, secondary cursor does not
    % matter as much as long as it captures the full EMG waveform
   
    % Outcomes:
    % [1]  Time to Onset (Onset = above 50 uV)
    % [2]  Duration of EMG (Onset to Offset)   (Offset = below 50 uV) 
    % [3]  Peak to Peak
    % [4]  RMS

    % 46 Participants
    % 3 Days each 
    % 4 files per day - for single and multi (Pre/Post)
        % Each file has 3 "sweeps/trials" to evaluate
        
    % Potential Naming convention
    % P1_D1_pre (Participant# Day # Pre/Post
    %  P1 (1:46) D1 (1:3)
    

%% Import data from singular pulse

%   

set = []; %participant number set


%% Import data from 5 Pulse Train

for y = 1:length(set)
    
end