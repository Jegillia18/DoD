% Created by: Jessica Gilliam
% Created on: 11/10/2021

% Code Description: For Dod_Evan

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

%% Onset

for Wv = 1:length(TA_val)
    % TA
    if TA_val(Wv) >= Threshold
        TA_onset = TA_val(Wv);
        TA_onset_index = Wv;
        TA_onset_time = TA_time(Wv);
        ParticipantData.(['Participant_',num2str(p),]).('TA_Onset')(t,1) = TA_onset;
        ParticipantData.(['Participant_',num2str(p),]).('TA_Onset_time')(t,1) = TA_onset_time;
        break
    else
        ParticipantData.(['Participant_',num2str(p),]).('TA_Onset')(t,1) = NaN;
        ParticipantData.(['Participant_',num2str(p),]).('TA_Onset_time')(t,1) = NaN;
    end
end
for Wv = 1:length(Sol_val)
    %Sol
    if Sol_val(Wv) >= Threshold
        Sol_onset = Sol_val(Wv);
        Sol_onset_index = Wv;
        Sol_onset_time = Sol_time(Wv);
        ParticipantData.(['Participant_',num2str(p),]).('Sol_Onset')(t,1) = Sol_onset;
        ParticipantData.(['Participant_',num2str(p),]).('Sol_Onset_time')(t,1) = Sol_onset_time;
        break
    else
        ParticipantData.(['Participant_',num2str(p),]).('Sol_Onset')(t,1) = NaN;
        ParticipantData.(['Participant_',num2str(p),]).('Sol_Onset_time')(t,1) = NaN;
    end
end
for Wv = 1:length(Ham_val)
    %Ham
    if Ham_val(Wv) >= Threshold
        Ham_onset = Ham_val(Wv);
        Ham_onset_index = Wv;
        Ham_onset_time = Ham_time(Wv);
        ParticipantData.(['Participant_',num2str(p),]).('Ham_Onset')(t,1) = Ham_onset;
        ParticipantData.(['Participant_',num2str(p),]).('Ham_Onset_time')(t,1) = Ham_onset_time;
        break
    else
        ParticipantData.(['Participant_',num2str(p),]).('Ham_Onset')(t,1) = NaN;
        ParticipantData.(['Participant_',num2str(p),]).('Ham_Onset_time')(t,1) = NaN;
    end
end
for Wv = 1:length(Quad_val)
    %Quad
    if Quad_val(Wv) >= Threshold
        Quad_onset = Quad_val(Wv);
        Quad_onset_index = Wv;
        Quad_onset_time = Quad_time(Wv);
        ParticipantData.(['Participant_',num2str(p),]).('Quad_Onset')(t,1) = Quad_onset;
        ParticipantData.(['Participant_',num2str(p),]).('Quad_Onset_time')(t,1) = Quad_onset_time;
        break
    else
        ParticipantData.(['Participant_',num2str(p),]).('Quad_Onset')(t,1) = NaN;
        ParticipantData.(['Participant_',num2str(p),]).('Quad_Onset_time')(t,1) = NaN;
    end
end


%% Offset

for Wv = TA_onset_index:length(TA_val)
    % TA
    if TA_val(Wv) <= Threshold
        TA_onset = TA_val(Wv);
        TA_onset_time = TA_time(Wv);
        ParticipantData.(['Participant_',num2str(p),]).('TA_Offset')(t,1) = TA_onset;
        ParticipantData.(['Participant_',num2str(p),]).('TA_Offset_time')(t,1) = TA_onset_time;
        break
    else
        ParticipantData.(['Participant_',num2str(p),]).('TA_Offset')(t,1) = NaN;
        ParticipantData.(['Participant_',num2str(p),]).('TA_Offset_time')(t,1) = NaN;
    end
end
for Wv = Sol_onset_index:length(Sol_val)
    %Sol
    if Sol_val(Wv) <= Threshold
        Sol_onset = Sol_val(Wv);
        Sol_onset_time = Sol_time(Wv);
        ParticipantData.(['Participant_',num2str(p),]).('Sol_Offset')(t,1) = Sol_onset;
        ParticipantData.(['Participant_',num2str(p),]).('Sol_Offset_time')(t,1) = Sol_onset_time;
        break
    else
        ParticipantData.(['Participant_',num2str(p),]).('Sol_Offset')(t,1) = NaN;
        ParticipantData.(['Participant_',num2str(p),]).('Sol_Offset_time')(t,1) = NaN;
    end
end
for Wv = Ham_onset_index:length(Ham_val)
    %Ham
    if Ham_val(Wv) <= Threshold
        Ham_onset = Ham_val(Wv);
        Ham_onset_time = Ham_time(Wv);
        ParticipantData.(['Participant_',num2str(p),]).('Ham_Offset')(t,1) = Ham_onset;
        ParticipantData.(['Participant_',num2str(p),]).('Ham_Offset_time')(t,1) = Ham_onset_time;
        break
    else
        ParticipantData.(['Participant_',num2str(p),]).('Ham_Offset')(t,1) = NaN;
        ParticipantData.(['Participant_',num2str(p),]).('Ham_Offset_time')(t,1) = NaN;
    end
end
for Wv = Quad_onset_index:length(Quad_val)
    %Quad
    if Quad_val(Wv) <= Threshold
        Quad_onset = Quad_val(Wv);
        Quad_onset_time = Quad_time(Wv);
        ParticipantData.(['Participant_',num2str(p),]).('Quad_Offset')(t,1) = Quad_onset;
        ParticipantData.(['Participant_',num2str(p),]).('Quad_Offset_time')(t,1) = Quad_onset_time;
        break
    else
        ParticipantData.(['Participant_',num2str(p),]).('Quad_Offset')(t,1) = NaN;
        ParticipantData.(['Participant_',num2str(p),]).('Quad_Offset_time')(t,1) = NaN;
    end
end

%% Duration

% Onset Val - Offset Val

plot(TA_time,TA_val);
plot(Sol_time,Sol_val);
plot(Ham_time,Ham_val);
plot(Quad_time,Quad_val);










