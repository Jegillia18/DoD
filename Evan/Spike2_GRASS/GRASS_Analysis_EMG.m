% Created on 02/09/2022 By Jessica Gilliam
% This code is for the 5 pulse train analysis 
%% [WINDUP]

% Import Raw Code
% clear;clc;
% cd 'C:\Users\jg300416\Documents\MATLAB\DoD\Evan\Spike2_GRASS'
% data = load('NIH_TSS_Sample_Data_02_08.mat');
% 
% TA_val = data.FWR_windup_JC_lft_LE_020822_TA.values;
% TA_time = data.FWR_windup_JC_lft_LE_020822_TA.times;

%% Import data from Spike2
%cd 'C:\Users\jg300416\Documents\MATLAB\DoD\Evan\Spike2_GRASS\Data_02_15'
set = 1 ;%[]; %participant number set (46 total)
for y = 1:length(set)
    p = set(y);
        
    for s = 1:3 %session number (1, 2, 3)
        
        ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).('Sol') = table();
        ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).('TA') = table();
        ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).('Ham') = table();
        ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).('Quad') = table();    
        
        
        for t = 1:6 % t = 1,2,3 (Pre)  if t = 4,5,6 (Post)
                        
            data = load(sprintf('P%d_S%d_T%d_WindUp',p,s,t));
            
        
%% Variable Set - Up

% NEED TO CHANGE BELOW - Don't export with full name
Ham_val = data.FWR_windup_ES_lft_LE_021522_Ham.values;
Quad_val = data.FWR_windup_ES_lft_LE_021522_Quad.values;
TA_val = data.FWR_windup_ES_lft_LE_021522_TA.values;
Sol_val = data.FWR_windup_ES_lft_LE_021522_Sol.values;

%time channel????
time = data.FWR_windup_ES_lft_LE_021522_TA.times; % potentially correct

% Lowpass filter 500Hz
Freq = 2000;
NyqFreq = Freq/2;
Lowpass = 500;
Wn = Lowpass/NyqFreq;
[B,A] = butter (4,Wn,'low');
% run filter
TA_low_filtered = filtfilt(B,A,TA_val);
Sol_low_filtered = filtfilt(B,A,Sol_val);
Quad_low_filtered = filtfilt(B,A,Quad_val);
Ham_low_filtered = filtfilt(B,A,Ham_val);

% Highpass filter 10Hz
Highpass = 6;
Wo = Highpass/NyqFreq;
[D,C] = butter (4,Wo,'high');
% run filter
high_pass_TA = filtfilt(D,C,TA_low_filtered);
high_pass_Sol = filtfilt(D,C,Sol_low_filtered);
high_pass_Quad = filtfilt(D,C,Quad_low_filtered);
high_pass_Ham = filtfilt(D,C,Ham_low_filtered);

% Full wave rectification of EMG
TA_filter = abs(high_pass_TA);
Sol_filter = abs(high_pass_Sol);
Quad_filter = abs(high_pass_Sol);
Ham_filter = abs(high_pass_Ham);

% % Lowpass filter 500Hz
% Freq = 2000;
% NyqFreq = Freq/2;
% Lowpass = 215;
% Wn = Lowpass/NyqFreq;
% [B,A] = butter (4,Wn,'low');
% % run filter
% TA_low_filtered = filtfilt(B,A,TA_val);
% 
% % Highpass filter 10Hz
% Highpass = 66;
% Wo = Highpass/NyqFreq;
% [D,C] = butter (4,Wo,'high');
% % run filter
% high_pass_TA = filtfilt(D,C,TA_low_filtered);
% 
% % Full wave rectification of EMG
% filtered_TA_215_66 = abs(high_pass_TA);

%% Determining Onset & Offset for EMG Artifacts

% First Take the Derivative of Imported waveform
TA_Deriv = gradient(TA_filter(:)) ./ gradient(time(:));
Sol_Deriv = gradient(Sol_filter(:)) ./ gradient(time(:));
Ham_Deriv = gradient(Ham_filter(:)) ./ gradient(time(:));
Quad_Deriv = gradient(Quad_filter(:)) ./ gradient(time(:));

TA_waveform = abs(TA_Deriv);
Sol_waveform = abs(Sol_Deriv);
Ham_waveform = abs(Ham_Deriv);
Quad_waveform = abs(Quad_Deriv);

start = find(time ==.005); % Cursors will be dropped between trials - So this can change from Start to
% cursor location and equivalent time point 

ART_Val = baseline*4;
EMG_Val = 25000;
EMG_Val2 = 6000;

%%  %%%% [ TA ] %%%%


%%
% Onset artifact 1 
for i = start:(length(TA_waveform)-5)
    if TA_waveform(i) > ART_Val && TA_waveform(i+1) > ART_Val && TA_waveform(i+2) > ART_Val && TA_waveform(i+3)...
       > ART_Val && TA_waveform(i+4) > ART_Val && TA_waveform(i+5) > ART_Val && TA_waveform(i+6) > ART_Val
     TA_onset_art1_index = i;
     TA_onset_art1_time = time(i);
     break
     else
        TA_onset_art1_index = NaN;
        TA_onset_art1_time = NaN;
    end
end

% Offset artifact 1 
if isnan(TA_onset_art1_index)
     TA_offset_art1_index = NaN;
     TA_offset_art1_time = NaN;
else
    TA_offset_art1_index = TA_onset_art1_index + 50;
    TA_offset_art1_time = time(TA_offset_art1_index);
%     for i = TA_onset_art1_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             TA_offset_art1_index = i;
%             TA_offset_art1_time = TA_time(i);
%         break
%         else
%             TA_offset_art1_index = NaN;
%             TA_offset_art1_time = NaN; 
%         end
%     end
end

% Onset artifact 2
TA_onset_art2_time = TA_onset_art1_time + 0.50;
TA_onset_art2_index = TA_onset_art1_index + 1000;

% Offset artifact 2
if isnan(TA_onset_art2_index)
     TA_offset_art2_index = NaN;
     TA_offset_art2_time = NaN;
else
    TA_offset_art2_index = TA_onset_art2_index + 50;
    TA_offset_art2_time = time(TA_offset_art2_index);
%     for i = TA_onset_art2_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             TA_offset_art2_index = i;
%             TA_offset_art2_time = TA_time(i);
%         break
%         else
%             TA_offset_art2_index = NaN;
%             TA_offset_art2_time = NaN; 
%         end
%     end
end


% Onset artifact 3
TA_onset_art3_time = TA_onset_art2_time + 0.50;
TA_onset_art3_index = TA_onset_art2_index + 1000;

% Offset artifact 3
if isnan(TA_onset_art3_index)
     TA_offset_art3_index = NaN;
     TA_offset_art3_time = NaN;
else
    TA_offset_art3_index = TA_onset_art3_index + 50;
    TA_offset_art3_time = time(TA_offset_art3_index);
%     for i = TA_onset_art3_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             TA_offset_art3_index = i;
%             TA_offset_art3_time = TA_time(i);
%         break
%         else
%             TA_offset_art3_index = NaN;
%             TA_offset_art3_time = NaN; 
%         end
%     end
end

% Onset artifact 4
TA_onset_art4_time = TA_onset_art3_time + 0.50;
TA_onset_art4_index = TA_onset_art3_index + 1000;

if isnan(TA_onset_art4_index)
     TA_offset_art4_index = NaN;
     TA_offset_art4_time = NaN;
else
    TA_offset_art4_index = TA_onset_art4_index + 50;
    TA_offset_art4_time = time(TA_offset_art4_index);
%     for i = TA_onset_art4_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             TA_offset_art4_index = i;
%             TA_offset_art4_time = TA_time(i);
%         break
%         else
%             TA_offset_art4_index = NaN;
%             TA_offset_art4_time = NaN; 
%         end
%     end
end

% Onset artifact 5
TA_onset_art5_time = TA_onset_art4_time + 0.50;
TA_onset_art5_index = TA_onset_art4_index + 1000;

% Offset artifact 5
if isnan(TA_onset_art5_index)
     TA_offset_art5_index = NaN;
     TA_offset_art5_time = NaN;
else
    TA_offset_art5_index = TA_onset_art5_index + 50;
    TA_offset_art5_time = time(TA_offset_art5_index);
%     for i = TA_onset_art5_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             TA_offset_art5_index = i;
%             TA_offset_art5_time = TA_time(i);
%         break
%         else
%             TA_offset_art5_index = NaN;
%             TA_offset_art5_time = NaN; 
%         end
%     end
end

% Determining Location of Onset & Offset of EMG Response

% Onset EMG 1 
for i = TA_offset_art1_index:TA_onset_art2_index
    if TA_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_EMG1_index = i;
     TA_onset_EMG1_time = time(i);
     break
     else
        TA_onset_EMG1_index = NaN;
        TA_onset_EMG1_time = NaN;
    end
end

% Offset EMG 1
if isnan(TA_onset_EMG1_index)
     TA_offset_EMG1_index = NaN;
     TA_offset_EMG1_time = NaN;
else
    for i = TA_onset_EMG1_index:TA_onset_art2_index 
        if TA_waveform(i) < EMG_Val2 && TA_waveform(i+1) < EMG_Val2 && TA_waveform(i+2) < EMG_Val2 && TA_waveform(i+3)...
                < EMG_Val2 && TA_waveform(i+4) < EMG_Val2 && TA_waveform(i+5) < EMG_Val2 && TA_waveform(i+6) < EMG_Val2
            TA_offset_EMG1_index = i;
            TA_offset_EMG1_time = time(i);
        break
        else
            TA_offset_EMG1_index = NaN;
            TA_offset_EMG1_time = NaN; 
        end
    end
end

%Onset EMG 2
for i = TA_offset_art2_index:TA_onset_art3_index
    if TA_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_EMG2_index = i;
     TA_onset_EMG2_time = time(i);
     break
     else
        TA_onset_EMG2_index = NaN;
        TA_onset_EMG2_time = NaN;
    end
end

% Offset EMG 2
if isnan(TA_onset_EMG2_index)
     TA_offset_EMG2_index = NaN;
     TA_offset_EMG2_time = NaN;
else
    for i = TA_onset_EMG2_index:TA_onset_art3_index 
        if TA_waveform(i) < EMG_Val2 && TA_waveform(i+1) < EMG_Val2 && TA_waveform(i+2) < EMG_Val2 && TA_waveform(i+3)...
                < EMG_Val2 && TA_waveform(i+4) < EMG_Val2 && TA_waveform(i+5) < EMG_Val2 && TA_waveform(i+6) < EMG_Val2
            TA_offset_EMG2_index = i;
            TA_offset_EMG2_time = time(i);
        break
        else
            TA_offset_EMG2_index = NaN;
            TA_offset_EMG2_time = NaN; 
        end
    end
end

% Onset EMG 3
for i = TA_offset_art3_index:TA_onset_art4_index
    if TA_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_EMG3_index = i;
     TA_onset_EMG3_time = time(i);
     break
     else
        TA_onset_EMG3_index = NaN;
        TA_onset_EMG3_time = NaN;
    end
end

% Offset EMG 3
if isnan(TA_onset_EMG3_index)
     TA_offset_EMG3_index = NaN;
     TA_offset_EMG3_time = NaN;
else
    for i = TA_onset_EMG3_index:TA_onset_art4_index 
        if TA_waveform(i) < EMG_Val2 && TA_waveform(i+1) < EMG_Val2 && TA_waveform(i+2) < EMG_Val2 && TA_waveform(i+3)...
                < EMG_Val2 && TA_waveform(i+4) < EMG_Val2 && TA_waveform(i+5) < EMG_Val2 && TA_waveform(i+6) < EMG_Val2
            TA_offset_EMG3_index = i;
            TA_offset_EMG3_time = time(i);
        break
        else
            TA_offset_EMG3_index = NaN;
            TA_offset_EMG3_time = NaN; 
        end
    end
end

% Onset EMG 4
for i = TA_offset_art4_index:TA_onset_art5_index
    if TA_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_EMG4_index = i;
     TA_onset_EMG4_time = time(i);
     break
     else
        TA_onset_EMG4_index = NaN;
        TA_onset_EMG4_time = NaN;
    end
end

% Offset EMG 4
if isnan(TA_onset_EMG4_index)
     TA_offset_EMG4_index = NaN;
     TA_offset_EMG4_time = NaN;
else
    for i = TA_onset_EMG4_index:TA_onset_art5_index 
        if TA_waveform(i) < EMG_Val2 && TA_waveform(i+1) < EMG_Val2 && TA_waveform(i+2) < EMG_Val2 && TA_waveform(i+3)...
                < EMG_Val2 && TA_waveform(i+4) < EMG_Val2 && TA_waveform(i+5) < EMG_Val2 && TA_waveform(i+6) < EMG_Val2
            TA_offset_EMG4_index = i;
            TA_offset_EMG4_time = time(i);
        break
        else
            TA_offset_EMG4_index = NaN;
            TA_offset_EMG4_time = NaN; 
        end
    end
end

% Onset EMG 5
for i = TA_offset_art5_index:(length(TA_waveform)-5)
    if TA_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_EMG5_index = i;
     TA_onset_EMG5_time = time(i);
     break
     else
        TA_onset_EMG5_index = NaN;
        TA_onset_EMG5_time = NaN;
    end
end

% Offset EMG 5
if isnan(TA_onset_EMG5_index)
     TA_offset_EMG5_index = NaN;
     TA_offset_EMG5_time = NaN;
else
    for i = TA_onset_EMG5_index:(length(TA_waveform)-5) 
        if TA_waveform(i) < EMG_Val2 && TA_waveform(i+1) < EMG_Val2 && TA_waveform(i+2) < EMG_Val2 && TA_waveform(i+3)...
                < EMG_Val2 && TA_waveform(i+4) < EMG_Val2 && TA_waveform(i+5) < EMG_Val2 && TA_waveform(i+6) < EMG_Val2
            TA_offset_EMG5_index = i;
            TA_offset_EMG5_time = time(i);
        break
        else
            TA_offset_EMG5_index = NaN;
            TA_offset_EMG5_time = NaN; 
        end
    end
end
% Area Under the Curve

try TA_AUC1 = trapz(TA_filter(TA_onset_EMG1_index:TA_offset_EMG1_index));
catch TA_AUC1 = NaN;
end

try TA_AUC2 = trapz(TA_filter(TA_onset_EMG2_index:TA_offset_EMG2_index));
catch TA_AUC2 = NaN;
end

try TA_AUC3 = trapz(TA_filter(TA_onset_EMG3_index:TA_offset_EMG3_index));
catch TA_AUC3 = NaN;
end

try TA_AUC4 = trapz(TA_filter(TA_onset_EMG4_index:TA_offset_EMG4_index));
catch TA_AUC4 = NaN;
end

try TA_AUC5 = trapz(TA_filter(TA_onset_EMG5_index:TA_offset_EMG5_index));
catch TA_AUC5 = NaN;
end

% Summation of Area Under the Curve for 5 consecutive responses for Pulse Train

try TA_AUC_SUM = TA_AUC1 + TA_AUC2 + TA_AUC3 + TA_AUC4 + TA_AUC5;
catch TA_AUC_SUM = NaN;
end

%%  %%%% [ SOL ] %%%%


%%
% Onset artifact 1 
for i = start:(length(Sol_waveform)-5)
    if Sol_waveform(i) > ART_Val && Sol_waveform(i+1) > ART_Val && Sol_waveform(i+2) > ART_Val && Sol_waveform(i+3)...
       > ART_Val && Sol_waveform(i+4) > ART_Val && Sol_waveform(i+5) > ART_Val && Sol_waveform(i+6) > ART_Val
     Sol_onset_art1_index = i;
     Sol_onset_art1_time = time(i);
     break
     else
        Sol_onset_art1_index = NaN;
        Sol_onset_art1_time = NaN;
    end
end

% Offset artifact 1 
if isnan(Sol_onset_art1_index)
     Sol_offset_art1_index = NaN;
     Sol_offset_art1_time = NaN;
else
    Sol_offset_art1_index = Sol_onset_art1_index + 50;
    Sol_offset_art1_time = time(Sol_offset_art1_index);
%     for i = Sol_onset_art1_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Sol_offset_art1_index = i;
%             Sol_offset_art1_time = Sol_time(i);
%         break
%         else
%             Sol_offset_art1_index = NaN;
%             Sol_offset_art1_time = NaN; 
%         end
%     end
end

% Onset artifact 2
Sol_onset_art2_time = Sol_onset_art1_time + 0.50;
Sol_onset_art2_index = Sol_onset_art1_index + 1000;

% Offset artifact 2
if isnan(Sol_onset_art2_index)
     Sol_offset_art2_index = NaN;
     Sol_offset_art2_time = NaN;
else
    Sol_offset_art2_index = Sol_onset_art2_index + 50;
    Sol_offset_art2_time = time(Sol_offset_art2_index);
%     for i = Sol_onset_art2_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Sol_offset_art2_index = i;
%             Sol_offset_art2_time = Sol_time(i);
%         break
%         else
%             Sol_offset_art2_index = NaN;
%             Sol_offset_art2_time = NaN; 
%         end
%     end
end


% Onset artifact 3
Sol_onset_art3_time = Sol_onset_art2_time + 0.50;
Sol_onset_art3_index = Sol_onset_art2_index + 1000;

% Offset artifact 3
if isnan(Sol_onset_art3_index)
     Sol_offset_art3_index = NaN;
     Sol_offset_art3_time = NaN;
else
    Sol_offset_art3_index = Sol_onset_art3_index + 50;
    Sol_offset_art3_time = time(Sol_offset_art3_index);
%     for i = Sol_onset_art3_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Sol_offset_art3_index = i;
%             Sol_offset_art3_time = Sol_time(i);
%         break
%         else
%             Sol_offset_art3_index = NaN;
%             Sol_offset_art3_time = NaN; 
%         end
%     end
end

% Onset artifact 4
Sol_onset_art4_time = Sol_onset_art3_time + 0.50;
Sol_onset_art4_index = Sol_onset_art3_index + 1000;

if isnan(Sol_onset_art4_index)
     Sol_offset_art4_index = NaN;
     Sol_offset_art4_time = NaN;
else
    Sol_offset_art4_index = Sol_onset_art4_index + 50;
    Sol_offset_art4_time = time(Sol_offset_art4_index);
%     for i = Sol_onset_art4_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Sol_offset_art4_index = i;
%             Sol_offset_art4_time = Sol_time(i);
%         break
%         else
%             Sol_offset_art4_index = NaN;
%             Sol_offset_art4_time = NaN; 
%         end
%     end
end

% Onset artifact 5
Sol_onset_art5_time = Sol_onset_art4_time + 0.50;
Sol_onset_art5_index = Sol_onset_art4_index + 1000;

% Offset artifact 5
if isnan(Sol_onset_art5_index)
     Sol_offset_art5_index = NaN;
     Sol_offset_art5_time = NaN;
else
    Sol_offset_art5_index = Sol_onset_art5_index + 50;
    Sol_offset_art5_time = time(Sol_offset_art5_index);
%     for i = Sol_onset_art5_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Sol_offset_art5_index = i;
%             Sol_offset_art5_time = Sol_time(i);
%         break
%         else
%             Sol_offset_art5_index = NaN;
%             Sol_offset_art5_time = NaN; 
%         end
%     end
end

% Determining Location of Onset & Offset of EMG Response

% Onset EMG 1 
for i = Sol_offset_art1_index:Sol_onset_art2_index
    if Sol_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Sol_onset_EMG1_index = i;
     Sol_onset_EMG1_time = time(i);
     break
     else
        Sol_onset_EMG1_index = NaN;
        Sol_onset_EMG1_time = NaN;
    end
end

% Offset EMG 1
if isnan(Sol_onset_EMG1_index)
     Sol_offset_EMG1_index = NaN;
     Sol_offset_EMG1_time = NaN;
else
    for i = Sol_onset_EMG1_index:Sol_onset_art2_index 
        if Sol_waveform(i) < EMG_Val2 && Sol_waveform(i+1) < EMG_Val2 && Sol_waveform(i+2) < EMG_Val2 && Sol_waveform(i+3)...
                < EMG_Val2 && Sol_waveform(i+4) < EMG_Val2 && Sol_waveform(i+5) < EMG_Val2 && Sol_waveform(i+6) < EMG_Val2
            Sol_offset_EMG1_index = i;
            Sol_offset_EMG1_time = time(i);
        break
        else
            Sol_offset_EMG1_index = NaN;
            Sol_offset_EMG1_time = NaN; 
        end
    end
end

%Onset EMG 2
for i = Sol_offset_art2_index:Sol_onset_art3_index
    if Sol_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Sol_onset_EMG2_index = i;
     Sol_onset_EMG2_time = time(i);
     break
     else
        Sol_onset_EMG2_index = NaN;
        Sol_onset_EMG2_time = NaN;
    end
end

% Offset EMG 2
if isnan(Sol_onset_EMG2_index)
     Sol_offset_EMG2_index = NaN;
     Sol_offset_EMG2_time = NaN;
else
    for i = Sol_onset_EMG2_index:Sol_onset_art3_index 
        if Sol_waveform(i) < EMG_Val2 && Sol_waveform(i+1) < EMG_Val2 && Sol_waveform(i+2) < EMG_Val2 && Sol_waveform(i+3)...
                < EMG_Val2 && Sol_waveform(i+4) < EMG_Val2 && Sol_waveform(i+5) < EMG_Val2 && Sol_waveform(i+6) < EMG_Val2
            Sol_offset_EMG2_index = i;
            Sol_offset_EMG2_time = time(i);
        break
        else
            Sol_offset_EMG2_index = NaN;
            Sol_offset_EMG2_time = NaN; 
        end
    end
end

% Onset EMG 3
for i = Sol_offset_art3_index:Sol_onset_art4_index
    if Sol_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Sol_onset_EMG3_index = i;
     Sol_onset_EMG3_time = time(i);
     break
     else
        Sol_onset_EMG3_index = NaN;
        Sol_onset_EMG3_time = NaN;
    end
end

% Offset EMG 3
if isnan(Sol_onset_EMG3_index)
     Sol_offset_EMG3_index = NaN;
     Sol_offset_EMG3_time = NaN;
else
    for i = Sol_onset_EMG3_index:Sol_onset_art4_index 
        if Sol_waveform(i) < EMG_Val2 && Sol_waveform(i+1) < EMG_Val2 && Sol_waveform(i+2) < EMG_Val2 && Sol_waveform(i+3)...
                < EMG_Val2 && Sol_waveform(i+4) < EMG_Val2 && Sol_waveform(i+5) < EMG_Val2 && Sol_waveform(i+6) < EMG_Val2
            Sol_offset_EMG3_index = i;
            Sol_offset_EMG3_time = time(i);
        break
        else
            Sol_offset_EMG3_index = NaN;
            Sol_offset_EMG3_time = NaN; 
        end
    end
end

% Onset EMG 4
for i = Sol_offset_art4_index:Sol_onset_art5_index
    if Sol_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Sol_onset_EMG4_index = i;
     Sol_onset_EMG4_time = time(i);
     break
     else
        Sol_onset_EMG4_index = NaN;
        Sol_onset_EMG4_time = NaN;
    end
end

% Offset EMG 4
if isnan(Sol_onset_EMG4_index)
     Sol_offset_EMG4_index = NaN;
     Sol_offset_EMG4_time = NaN;
else
    for i = Sol_onset_EMG4_index:Sol_onset_art5_index 
        if Sol_waveform(i) < EMG_Val2 && Sol_waveform(i+1) < EMG_Val2 && Sol_waveform(i+2) < EMG_Val2 && Sol_waveform(i+3)...
                < EMG_Val2 && Sol_waveform(i+4) < EMG_Val2 && Sol_waveform(i+5) < EMG_Val2 && Sol_waveform(i+6) < EMG_Val2
            Sol_offset_EMG4_index = i;
            Sol_offset_EMG4_time = time(i);
        break
        else
            Sol_offset_EMG4_index = NaN;
            Sol_offset_EMG4_time = NaN; 
        end
    end
end

% Onset EMG 5
for i = Sol_offset_art5_index:(length(Sol_waveform)-5)
    if Sol_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Sol_onset_EMG5_index = i;
     Sol_onset_EMG5_time = time(i);
     break
     else
        Sol_onset_EMG5_index = NaN;
        Sol_onset_EMG5_time = NaN;
    end
end

% Offset EMG 5
if isnan(Sol_onset_EMG5_index)
     Sol_offset_EMG5_index = NaN;
     Sol_offset_EMG5_time = NaN;
else
    for i = Sol_onset_EMG5_index:(length(Sol_waveform)-5) 
        if Sol_waveform(i) < EMG_Val2 && Sol_waveform(i+1) < EMG_Val2 && Sol_waveform(i+2) < EMG_Val2 && Sol_waveform(i+3)...
                < EMG_Val2 && Sol_waveform(i+4) < EMG_Val2 && Sol_waveform(i+5) < EMG_Val2 && Sol_waveform(i+6) < EMG_Val2
            Sol_offset_EMG5_index = i;
            Sol_offset_EMG5_time = time(i);
        break
        else
            Sol_offset_EMG5_index = NaN;
            Sol_offset_EMG5_time = NaN; 
        end
    end
end
% Area Under the Curve

try Sol_AUC1 = trapz(Sol_filter(Sol_onset_EMG1_index:Sol_offset_EMG1_index));
catch Sol_AUC1 = NaN;
end

try Sol_AUC2 = trapz(Sol_filter(Sol_onset_EMG2_index:Sol_offset_EMG2_index));
catch Sol_AUC2 = NaN;
end

try Sol_AUC3 = trapz(Sol_filter(Sol_onset_EMG3_index:Sol_offset_EMG3_index));
catch Sol_AUC3 = NaN;
end

try Sol_AUC4 = trapz(Sol_filter(Sol_onset_EMG4_index:Sol_offset_EMG4_index));
catch Sol_AUC4 = NaN;
end

try Sol_AUC5 = trapz(Sol_filter(Sol_onset_EMG5_index:Sol_offset_EMG5_index));
catch Sol_AUC5 = NaN;
end

% Summation of Area Under the Curve for 5 consecutive responses for Pulse Train

try Sol_AUC_SUM = Sol_AUC1 + Sol_AUC2 + Sol_AUC3 + Sol_AUC4 + Sol_AUC5;
catch Sol_AUC_SUM = NaN;
end

%% %%%% [ Quad ] %%%%


%%
% Onset artifact 1 
for i = start:(length(Quad_waveform)-5)
    if Quad_waveform(i) > ART_Val && Quad_waveform(i+1) > ART_Val && Quad_waveform(i+2) > ART_Val && Quad_waveform(i+3)...
       > ART_Val && Quad_waveform(i+4) > ART_Val && Quad_waveform(i+5) > ART_Val && Quad_waveform(i+6) > ART_Val
     Quad_onset_art1_index = i;
     Quad_onset_art1_time = time(i);
     break
     else
        Quad_onset_art1_index = NaN;
        Quad_onset_art1_time = NaN;
    end
end

% Offset artifact 1 
if isnan(Quad_onset_art1_index)
     Quad_offset_art1_index = NaN;
     Quad_offset_art1_time = NaN;
else
    Quad_offset_art1_index = Quad_onset_art1_index + 50;
    Quad_offset_art1_time = time(Quad_offset_art1_index);
%     for i = Quad_onset_art1_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Quad_offset_art1_index = i;
%             Quad_offset_art1_time = Quad_time(i);
%         break
%         else
%             Quad_offset_art1_index = NaN;
%             Quad_offset_art1_time = NaN; 
%         end
%     end
end

% Onset artifact 2
Quad_onset_art2_time = Quad_onset_art1_time + 0.50;
Quad_onset_art2_index = Quad_onset_art1_index + 1000;

% Offset artifact 2
if isnan(Quad_onset_art2_index)
     Quad_offset_art2_index = NaN;
     Quad_offset_art2_time = NaN;
else
    Quad_offset_art2_index = Quad_onset_art2_index + 50;
    Quad_offset_art2_time = time(Quad_offset_art2_index);
%     for i = Quad_onset_art2_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Quad_offset_art2_index = i;
%             Quad_offset_art2_time = Quad_time(i);
%         break
%         else
%             Quad_offset_art2_index = NaN;
%             Quad_offset_art2_time = NaN; 
%         end
%     end
end


% Onset artifact 3
Quad_onset_art3_time = Quad_onset_art2_time + 0.50;
Quad_onset_art3_index = Quad_onset_art2_index + 1000;

% Offset artifact 3
if isnan(Quad_onset_art3_index)
     Quad_offset_art3_index = NaN;
     Quad_offset_art3_time = NaN;
else
    Quad_offset_art3_index = Quad_onset_art3_index + 50;
    Quad_offset_art3_time = time(Quad_offset_art3_index);
%     for i = Quad_onset_art3_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Quad_offset_art3_index = i;
%             Quad_offset_art3_time = Quad_time(i);
%         break
%         else
%             Quad_offset_art3_index = NaN;
%             Quad_offset_art3_time = NaN; 
%         end
%     end
end

% Onset artifact 4
Quad_onset_art4_time = Quad_onset_art3_time + 0.50;
Quad_onset_art4_index = Quad_onset_art3_index + 1000;

if isnan(Quad_onset_art4_index)
     Quad_offset_art4_index = NaN;
     Quad_offset_art4_time = NaN;
else
    Quad_offset_art4_index = Quad_onset_art4_index + 50;
    Quad_offset_art4_time = time(Quad_offset_art4_index);
%     for i = Quad_onset_art4_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Quad_offset_art4_index = i;
%             Quad_offset_art4_time = Quad_time(i);
%         break
%         else
%             Quad_offset_art4_index = NaN;
%             Quad_offset_art4_time = NaN; 
%         end
%     end
end

% Onset artifact 5
Quad_onset_art5_time = Quad_onset_art4_time + 0.50;
Quad_onset_art5_index = Quad_onset_art4_index + 1000;

% Offset artifact 5
if isnan(Quad_onset_art5_index)
     Quad_offset_art5_index = NaN;
     Quad_offset_art5_time = NaN;
else
    Quad_offset_art5_index = Quad_onset_art5_index + 50;
    Quad_offset_art5_time = time(Quad_offset_art5_index);
%     for i = Quad_onset_art5_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Quad_offset_art5_index = i;
%             Quad_offset_art5_time = Quad_time(i);
%         break
%         else
%             Quad_offset_art5_index = NaN;
%             Quad_offset_art5_time = NaN; 
%         end
%     end
end

% Determining Location of Onset & Offset of EMG Response

% Onset EMG 1 
for i = Quad_offset_art1_index:Quad_onset_art2_index
    if Quad_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Quad_onset_EMG1_index = i;
     Quad_onset_EMG1_time = time(i);
     break
     else
        Quad_onset_EMG1_index = NaN;
        Quad_onset_EMG1_time = NaN;
    end
end

% Offset EMG 1
if isnan(Quad_onset_EMG1_index)
     Quad_offset_EMG1_index = NaN;
     Quad_offset_EMG1_time = NaN;
else
    for i = Quad_onset_EMG1_index:Quad_onset_art2_index 
        if Quad_waveform(i) < EMG_Val2 && Quad_waveform(i+1) < EMG_Val2 && Quad_waveform(i+2) < EMG_Val2 && Quad_waveform(i+3)...
                < EMG_Val2 && Quad_waveform(i+4) < EMG_Val2 && Quad_waveform(i+5) < EMG_Val2 && Quad_waveform(i+6) < EMG_Val2
            Quad_offset_EMG1_index = i;
            Quad_offset_EMG1_time = time(i);
        break
        else
            Quad_offset_EMG1_index = NaN;
            Quad_offset_EMG1_time = NaN; 
        end
    end
end

%Onset EMG 2
for i = Quad_offset_art2_index:Quad_onset_art3_index
    if Quad_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Quad_onset_EMG2_index = i;
     Quad_onset_EMG2_time = time(i);
     break
     else
        Quad_onset_EMG2_index = NaN;
        Quad_onset_EMG2_time = NaN;
    end
end

% Offset EMG 2
if isnan(Quad_onset_EMG2_index)
     Quad_offset_EMG2_index = NaN;
     Quad_offset_EMG2_time = NaN;
else
    for i = Quad_onset_EMG2_index:Quad_onset_art3_index 
        if Quad_waveform(i) < EMG_Val2 && Quad_waveform(i+1) < EMG_Val2 && Quad_waveform(i+2) < EMG_Val2 && Quad_waveform(i+3)...
                < EMG_Val2 && Quad_waveform(i+4) < EMG_Val2 && Quad_waveform(i+5) < EMG_Val2 && Quad_waveform(i+6) < EMG_Val2
            Quad_offset_EMG2_index = i;
            Quad_offset_EMG2_time = time(i);
        break
        else
            Quad_offset_EMG2_index = NaN;
            Quad_offset_EMG2_time = NaN; 
        end
    end
end

% Onset EMG 3
for i = Quad_offset_art3_index:Quad_onset_art4_index
    if Quad_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Quad_onset_EMG3_index = i;
     Quad_onset_EMG3_time = time(i);
     break
     else
        Quad_onset_EMG3_index = NaN;
        Quad_onset_EMG3_time = NaN;
    end
end

% Offset EMG 3
if isnan(Quad_onset_EMG3_index)
     Quad_offset_EMG3_index = NaN;
     Quad_offset_EMG3_time = NaN;
else
    for i = Quad_onset_EMG3_index:Quad_onset_art4_index 
        if Quad_waveform(i) < EMG_Val2 && Quad_waveform(i+1) < EMG_Val2 && Quad_waveform(i+2) < EMG_Val2 && Quad_waveform(i+3)...
                < EMG_Val2 && Quad_waveform(i+4) < EMG_Val2 && Quad_waveform(i+5) < EMG_Val2 && Quad_waveform(i+6) < EMG_Val2
            Quad_offset_EMG3_index = i;
            Quad_offset_EMG3_time = time(i);
        break
        else
            Quad_offset_EMG3_index = NaN;
            Quad_offset_EMG3_time = NaN; 
        end
    end
end

% Onset EMG 4
for i = Quad_offset_art4_index:Quad_onset_art5_index
    if Quad_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Quad_onset_EMG4_index = i;
     Quad_onset_EMG4_time = time(i);
     break
     else
        Quad_onset_EMG4_index = NaN;
        Quad_onset_EMG4_time = NaN;
    end
end

% Offset EMG 4
if isnan(Quad_onset_EMG4_index)
     Quad_offset_EMG4_index = NaN;
     Quad_offset_EMG4_time = NaN;
else
    for i = Quad_onset_EMG4_index:Quad_onset_art5_index 
        if Quad_waveform(i) < EMG_Val2 && Quad_waveform(i+1) < EMG_Val2 && Quad_waveform(i+2) < EMG_Val2 && Quad_waveform(i+3)...
                < EMG_Val2 && Quad_waveform(i+4) < EMG_Val2 && Quad_waveform(i+5) < EMG_Val2 && Quad_waveform(i+6) < EMG_Val2
            Quad_offset_EMG4_index = i;
            Quad_offset_EMG4_time = time(i);
        break
        else
            Quad_offset_EMG4_index = NaN;
            Quad_offset_EMG4_time = NaN; 
        end
    end
end

% Onset EMG 5
for i = Quad_offset_art5_index:(length(Quad_waveform)-5)
    if Quad_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Quad_onset_EMG5_index = i;
     Quad_onset_EMG5_time = time(i);
     break
     else
        Quad_onset_EMG5_index = NaN;
        Quad_onset_EMG5_time = NaN;
    end
end

% Offset EMG 5
if isnan(Quad_onset_EMG5_index)
     Quad_offset_EMG5_index = NaN;
     Quad_offset_EMG5_time = NaN;
else
    for i = Quad_onset_EMG5_index:(length(Quad_waveform)-5) 
        if Quad_waveform(i) < EMG_Val2 && Quad_waveform(i+1) < EMG_Val2 && Quad_waveform(i+2) < EMG_Val2 && Quad_waveform(i+3)...
                < EMG_Val2 && Quad_waveform(i+4) < EMG_Val2 && Quad_waveform(i+5) < EMG_Val2 && Quad_waveform(i+6) < EMG_Val2
            Quad_offset_EMG5_index = i;
            Quad_offset_EMG5_time = time(i);
        break
        else
            Quad_offset_EMG5_index = NaN;
            Quad_offset_EMG5_time = NaN; 
        end
    end
end
% Area Under the Curve

try Quad_AUC1 = trapz(Quad_filter(Quad_onset_EMG1_index:Quad_offset_EMG1_index));
catch Quad_AUC1 = NaN;
end

try Quad_AUC2 = trapz(Quad_filter(Quad_onset_EMG2_index:Quad_offset_EMG2_index));
catch Quad_AUC2 = NaN;
end

try Quad_AUC3 = trapz(Quad_filter(Quad_onset_EMG3_index:Quad_offset_EMG3_index));
catch Quad_AUC3 = NaN;
end

try Quad_AUC4 = trapz(Quad_filter(Quad_onset_EMG4_index:Quad_offset_EMG4_index));
catch Quad_AUC4 = NaN;
end

try Quad_AUC5 = trapz(Quad_filter(Quad_onset_EMG5_index:Quad_offset_EMG5_index));
catch Quad_AUC5 = NaN;
end

% Summation of Area Under the Curve for 5 consecutive responses for Pulse Train

try Quad_AUC_SUM = Quad_AUC1 + Quad_AUC2 + Quad_AUC3 + Quad_AUC4 + Quad_AUC5;
catch Quad_AUC_SUM = NaN;
end

%% %%%% [ HAM ] %%%%

%%
% Onset artifact 1 
for i = start:(length(Ham_waveform)-5)
    if Ham_waveform(i) > ART_Val && Ham_waveform(i+1) > ART_Val && Ham_waveform(i+2) > ART_Val && Ham_waveform(i+3)...
       > ART_Val && Ham_waveform(i+4) > ART_Val && Ham_waveform(i+5) > ART_Val && Ham_waveform(i+6) > ART_Val
     Ham_onset_art1_index = i;
     Ham_onset_art1_time = time(i);
     break
     else
        Ham_onset_art1_index = NaN;
        Ham_onset_art1_time = NaN;
    end
end

% Offset artifact 1 
if isnan(Ham_onset_art1_index)
     Ham_offset_art1_index = NaN;
     Ham_offset_art1_time = NaN;
else
    Ham_offset_art1_index = Ham_onset_art1_index + 50;
    Ham_offset_art1_time = time(Ham_offset_art1_index);
%     for i = Ham_onset_art1_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Ham_offset_art1_index = i;
%             Ham_offset_art1_time = Ham_time(i);
%         break
%         else
%             Ham_offset_art1_index = NaN;
%             Ham_offset_art1_time = NaN; 
%         end
%     end
end

% Onset artifact 2
Ham_onset_art2_time = Ham_onset_art1_time + 0.50;
Ham_onset_art2_index = Ham_onset_art1_index + 1000;

% Offset artifact 2
if isnan(Ham_onset_art2_index)
     Ham_offset_art2_index = NaN;
     Ham_offset_art2_time = NaN;
else
    Ham_offset_art2_index = Ham_onset_art2_index + 50;
    Ham_offset_art2_time = time(Ham_offset_art2_index);
%     for i = Ham_onset_art2_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Ham_offset_art2_index = i;
%             Ham_offset_art2_time = Ham_time(i);
%         break
%         else
%             Ham_offset_art2_index = NaN;
%             Ham_offset_art2_time = NaN; 
%         end
%     end
end


% Onset artifact 3
Ham_onset_art3_time = Ham_onset_art2_time + 0.50;
Ham_onset_art3_index = Ham_onset_art2_index + 1000;

% Offset artifact 3
if isnan(Ham_onset_art3_index)
     Ham_offset_art3_index = NaN;
     Ham_offset_art3_time = NaN;
else
    Ham_offset_art3_index = Ham_onset_art3_index + 50;
    Ham_offset_art3_time = time(Ham_offset_art3_index);
%     for i = Ham_onset_art3_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Ham_offset_art3_index = i;
%             Ham_offset_art3_time = Ham_time(i);
%         break
%         else
%             Ham_offset_art3_index = NaN;
%             Ham_offset_art3_time = NaN; 
%         end
%     end
end

% Onset artifact 4
Ham_onset_art4_time = Ham_onset_art3_time + 0.50;
Ham_onset_art4_index = Ham_onset_art3_index + 1000;

if isnan(Ham_onset_art4_index)
     Ham_offset_art4_index = NaN;
     Ham_offset_art4_time = NaN;
else
    Ham_offset_art4_index = Ham_onset_art4_index + 50;
    Ham_offset_art4_time = time(Ham_offset_art4_index);
%     for i = Ham_onset_art4_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Ham_offset_art4_index = i;
%             Ham_offset_art4_time = Ham_time(i);
%         break
%         else
%             Ham_offset_art4_index = NaN;
%             Ham_offset_art4_time = NaN; 
%         end
%     end
end

% Onset artifact 5
Ham_onset_art5_time = Ham_onset_art4_time + 0.50;
Ham_onset_art5_index = Ham_onset_art4_index + 1000;

% Offset artifact 5
if isnan(Ham_onset_art5_index)
     Ham_offset_art5_index = NaN;
     Ham_offset_art5_time = NaN;
else
    Ham_offset_art5_index = Ham_onset_art5_index + 50;
    Ham_offset_art5_time = time(Ham_offset_art5_index);
%     for i = Ham_onset_art5_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Ham_offset_art5_index = i;
%             Ham_offset_art5_time = Ham_time(i);
%         break
%         else
%             Ham_offset_art5_index = NaN;
%             Ham_offset_art5_time = NaN; 
%         end
%     end
end

% Determining Location of Onset & Offset of EMG Response

% Onset EMG 1 
for i = Ham_offset_art1_index:Ham_onset_art2_index
    if Ham_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Ham_onset_EMG1_index = i;
     Ham_onset_EMG1_time = time(i);
     break
     else
        Ham_onset_EMG1_index = NaN;
        Ham_onset_EMG1_time = NaN;
    end
end

% Offset EMG 1
if isnan(Ham_onset_EMG1_index)
     Ham_offset_EMG1_index = NaN;
     Ham_offset_EMG1_time = NaN;
else
    for i = Ham_onset_EMG1_index:Ham_onset_art2_index 
        if Ham_waveform(i) < EMG_Val2 && Ham_waveform(i+1) < EMG_Val2 && Ham_waveform(i+2) < EMG_Val2 && Ham_waveform(i+3)...
                < EMG_Val2 && Ham_waveform(i+4) < EMG_Val2 && Ham_waveform(i+5) < EMG_Val2 && Ham_waveform(i+6) < EMG_Val2
            Ham_offset_EMG1_index = i;
            Ham_offset_EMG1_time = time(i);
        break
        else
            Ham_offset_EMG1_index = NaN;
            Ham_offset_EMG1_time = NaN; 
        end
    end
end

%Onset EMG 2
for i = Ham_offset_art2_index:Ham_onset_art3_index
    if Ham_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Ham_onset_EMG2_index = i;
     Ham_onset_EMG2_time = time(i);
     break
     else
        Ham_onset_EMG2_index = NaN;
        Ham_onset_EMG2_time = NaN;
    end
end

% Offset EMG 2
if isnan(Ham_onset_EMG2_index)
     Ham_offset_EMG2_index = NaN;
     Ham_offset_EMG2_time = NaN;
else
    for i = Ham_onset_EMG2_index:Ham_onset_art3_index 
        if Ham_waveform(i) < EMG_Val2 && Ham_waveform(i+1) < EMG_Val2 && Ham_waveform(i+2) < EMG_Val2 && Ham_waveform(i+3)...
                < EMG_Val2 && Ham_waveform(i+4) < EMG_Val2 && Ham_waveform(i+5) < EMG_Val2 && Ham_waveform(i+6) < EMG_Val2
            Ham_offset_EMG2_index = i;
            Ham_offset_EMG2_time = time(i);
        break
        else
            Ham_offset_EMG2_index = NaN;
            Ham_offset_EMG2_time = NaN; 
        end
    end
end

% Onset EMG 3
for i = Ham_offset_art3_index:Ham_onset_art4_index
    if Ham_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Ham_onset_EMG3_index = i;
     Ham_onset_EMG3_time = time(i);
     break
     else
        Ham_onset_EMG3_index = NaN;
        Ham_onset_EMG3_time = NaN;
    end
end

% Offset EMG 3
if isnan(Ham_onset_EMG3_index)
     Ham_offset_EMG3_index = NaN;
     Ham_offset_EMG3_time = NaN;
else
    for i = Ham_onset_EMG3_index:Ham_onset_art4_index 
        if Ham_waveform(i) < EMG_Val2 && Ham_waveform(i+1) < EMG_Val2 && Ham_waveform(i+2) < EMG_Val2 && Ham_waveform(i+3)...
                < EMG_Val2 && Ham_waveform(i+4) < EMG_Val2 && Ham_waveform(i+5) < EMG_Val2 && Ham_waveform(i+6) < EMG_Val2
            Ham_offset_EMG3_index = i;
            Ham_offset_EMG3_time = time(i);
        break
        else
            Ham_offset_EMG3_index = NaN;
            Ham_offset_EMG3_time = NaN; 
        end
    end
end

% Onset EMG 4
for i = Ham_offset_art4_index:Ham_onset_art5_index
    if Ham_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Ham_onset_EMG4_index = i;
     Ham_onset_EMG4_time = time(i);
     break
     else
        Ham_onset_EMG4_index = NaN;
        Ham_onset_EMG4_time = NaN;
    end
end

% Offset EMG 4
if isnan(Ham_onset_EMG4_index)
     Ham_offset_EMG4_index = NaN;
     Ham_offset_EMG4_time = NaN;
else
    for i = Ham_onset_EMG4_index:Ham_onset_art5_index 
        if Ham_waveform(i) < EMG_Val2 && Ham_waveform(i+1) < EMG_Val2 && Ham_waveform(i+2) < EMG_Val2 && Ham_waveform(i+3)...
                < EMG_Val2 && Ham_waveform(i+4) < EMG_Val2 && Ham_waveform(i+5) < EMG_Val2 && Ham_waveform(i+6) < EMG_Val2
            Ham_offset_EMG4_index = i;
            Ham_offset_EMG4_time = time(i);
        break
        else
            Ham_offset_EMG4_index = NaN;
            Ham_offset_EMG4_time = NaN; 
        end
    end
end

% Onset EMG 5
for i = Ham_offset_art5_index:(length(Ham_waveform)-5)
    if Ham_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Ham_onset_EMG5_index = i;
     Ham_onset_EMG5_time = time(i);
     break
     else
        Ham_onset_EMG5_index = NaN;
        Ham_onset_EMG5_time = NaN;
    end
end

% Offset EMG 5
if isnan(Ham_onset_EMG5_index)
     Ham_offset_EMG5_index = NaN;
     Ham_offset_EMG5_time = NaN;
else
    for i = Ham_onset_EMG5_index:(length(Ham_waveform)-5) 
        if Ham_waveform(i) < EMG_Val2 && Ham_waveform(i+1) < EMG_Val2 && Ham_waveform(i+2) < EMG_Val2 && Ham_waveform(i+3)...
                < EMG_Val2 && Ham_waveform(i+4) < EMG_Val2 && Ham_waveform(i+5) < EMG_Val2 && Ham_waveform(i+6) < EMG_Val2
            Ham_offset_EMG5_index = i;
            Ham_offset_EMG5_time = time(i);
        break
        else
            Ham_offset_EMG5_index = NaN;
            Ham_offset_EMG5_time = NaN; 
        end
    end
end
% Area Under the Curve

try Ham_AUC1 = trapz(Ham_filter(Ham_onset_EMG1_index:Ham_offset_EMG1_index));
catch Ham_AUC1 = NaN;
end

try Ham_AUC2 = trapz(Ham_filter(Ham_onset_EMG2_index:Ham_offset_EMG2_index));
catch Ham_AUC2 = NaN;
end

try Ham_AUC3 = trapz(Ham_filter(Ham_onset_EMG3_index:Ham_offset_EMG3_index));
catch Ham_AUC3 = NaN;
end

try Ham_AUC4 = trapz(Ham_filter(Ham_onset_EMG4_index:Ham_offset_EMG4_index));
catch Ham_AUC4 = NaN;
end

try Ham_AUC5 = trapz(Ham_filter(Ham_onset_EMG5_index:Ham_offset_EMG5_index));
catch Ham_AUC5 = NaN;
end

% Summation of Area Under the Curve for 5 consecutive responses for Pulse Train

try Ham_AUC_SUM = Ham_AUC1 + Ham_AUC2 + Ham_AUC3 + Ham_AUC4 + Ham_AUC5;
catch Ham_AUC_SUM = NaN;
end

%% Data Management 

% Onset EMG 1
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Onset 1')(s,1) = TA_onset_EMG1_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Onset 1')(s,1) = Sol_onset_EMG1_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Onset 1')(s,1) = Ham_onset_EMG1_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Onset 1')(s,1) = Quad_onset_EMG1_time;

% Offset EMG 1
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Offset 1')(s,1) = TA_offset_EMG1_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Offset 1')(s,1) = Sol_offset_EMG1_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Offset 1')(s,1) = Ham_offset_EMG1_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Offset 1')(s,1) = Quad_offset_EMG1_time;

%Onset EMG 2
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Onset 2')(s,1) = TA_onset_EMG2_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Onset 2')(s,1) = Sol_onset_EMG2_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Onset 2')(s,1) = Ham_onset_EMG2_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Onset 2')(s,1) = Quad_onset_EMG2_time;

% Offset EMG 2
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Offset 2')(s,1) = TA_offset_EMG2_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Offset 2')(s,1) = Sol_offset_EMG2_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Offset 2')(s,1) = Ham_offset_EMG2_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Offset 2')(s,1) = Quad_offset_EMG2_time;

%Onset EMG 3
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Onset 3')(s,1) = TA_onset_EMG3_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Onset 3')(s,1) = Sol_onset_EMG3_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Onset 3')(s,1) = Ham_onset_EMG3_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Onset 3')(s,1) = Quad_onset_EMG3_time;

% Offset EMG 3
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Offset 3')(s,1) = TA_offset_EMG3_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Offset 3')(s,1) = Sol_offset_EMG3_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Offset 3')(s,1) = Ham_offset_EMG3_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Offset 3')(s,1) = Quad_offset_EMG3_time;

%Onset EMG 4
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Onset 4')(s,1) = TA_onset_EMG4_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Onset 4')(s,1) = Sol_onset_EMG4_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Onset 4')(s,1) = Ham_onset_EMG4_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Onset 4')(s,1) = Quad_onset_EMG4_time;

% Offset EMG 4
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Offset 4')(s,1) = TA_offset_EMG4_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Offset 4')(s,1) = Sol_offset_EMG4_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Offset 4')(s,1) = Ham_offset_EMG4_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Offset 4')(s,1) = Quad_offset_EMG4_time;

%Onset EMG 5
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Onset 5')(s,1) = TA_onset_EMG5_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Onset 5')(s,1) = Sol_onset_EMG5_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Onset 5')(s,1) = Ham_onset_EMG5_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Onset 5')(s,1) = Quad_onset_EMG5_time;

% Offset EMG 5
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Offset 5')(s,1) = TA_offset_EMG5_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Offset 5')(s,1) = Sol_offset_EMG5_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Offset 5')(s,1) = Ham_offset_EMG5_time;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Offset 5')(s,1) = Quad_offset_EMG5_time;

% AUC EMG 1
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('AUC 1')(s,1) = TA_AUC1;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('AUC 1')(s,1) = Sol_AUC1;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('AUC 1')(s,1) = Ham_AUC1;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('AUC 1')(s,1) = Quad_AUC1;

% AUC EMG 2
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('AUC 2')(s,1) = TA_AUC2;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('AUC 2')(s,1) = Sol_AUC2;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('AUC 2')(s,1) = Ham_AUC2;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('AUC 2')(s,1) = Quad_AUC2;

%AUC EMG 3
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('AUC 3')(s,1) = TA_AUC3;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('AUC 3')(s,1) = Sol_AUC3;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('AUC 3')(s,1) = Ham_AUC3;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('AUC 3')(s,1) = Quad_AUC3;

%AUC EMG 4
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('AUC 4')(s,1) = TA_AUC4;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('AUC 4')(s,1) = Sol_AUC4;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('AUC 4')(s,1) = Ham_AUC4;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('AUC 4')(s,1) = Quad_AUC4;

%AUC EMG 5
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('AUC 5')(s,1) = TA_AUC5;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('AUC 5')(s,1) = Sol_AUC5;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('AUC 5')(s,1) = Ham_AUC5;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('AUC 5')(s,1) = Quad_AUC5;

%AUC SUM
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('AUC SUM')(s,1) = TA_AUC_SUM;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('AUC SUM')(s,1) = Sol_AUC_SUM;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('AUC SUM')(s,1) = Ham_AUC_SUM;
ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('AUC SUM')(s,1) = Quad_AUC_SUM;
        end
    end
end

clearvars -except ParticipantData

%% [NOXAMP]
% This code is for the single pulse analysis 
% 


%% Import data from Spike2
cd 'C:\Users\jg300416\Documents\MATLAB\DoD\Evan\Spike2_GRASS\Data_02_15'
set = 1 ;%[]; %participant number set (46 total)
for y = 1:length(set)
    p = set(y);
        
    for s = 1:3 %session number (1, 2, 3)
        
        ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).('Sol') = table();
        ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).('TA') = table();
        ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).('Ham') = table();
        ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).('Quad') = table();    
        
        
        for t = 1:6 % t = 1,2,3 (Pre)  if t = 4,5,6 (Post)
                        
            data = load(sprintf('P%d_S%d_T%d_NoxAmp',p,s,t));
            
           %%%% Creation of similar methods - only needs to be for 1 occurance of onset and offset, should be mapped between cursors 

           %% Variable Set - Up

% NEED TO CHANGE BELOW - Don't export with full name
Ham_val = data.FWR_windup_ES_lft_LE_021522_Ham.values;
Quad_val = data.FWR_windup_ES_lft_LE_021522_Quad.values;
TA_val = data.FWR_windup_ES_lft_LE_021522_TA.values;
Sol_val = data.FWR_windup_ES_lft_LE_021522_Sol.values;

%time channel???? - this was not found on first export 


% Lowpass filter 500Hz
Freq = 2000;
NyqFreq = Freq/2;
Lowpass = 500;
Wn = Lowpass/NyqFreq;
[B,A] = butter (4,Wn,'low');
% run filter
TA_low_filtered = filtfilt(B,A,TA_val);
Sol_low_filtered = filtfilt(B,A,Sol_val);
Quad_low_filtered = filtfilt(B,A,Quad_val);
Ham_low_filtered = filtfilt(B,A,Ham_val);

% Highpass filter 10Hz
Highpass = 6;
Wo = Highpass/NyqFreq;
[D,C] = butter (4,Wo,'high');
% run filter
high_pass_TA = filtfilt(D,C,TA_low_filtered);
high_pass_Sol = filtfilt(D,C,Sol_low_filtered);
high_pass_Quad = filtfilt(D,C,Quad_low_filtered);
high_pass_Ham = filtfilt(D,C,Ham_low_filtered);

% Full wave rectification of EMG
TA_filter = abs(high_pass_TA);
Sol_filter = abs(high_pass_Sol);
Quad_filter = abs(high_pass_Sol);
Ham_filter = abs(high_pass_Ham);

% % Lowpass filter 500Hz
% Freq = 2000;
% NyqFreq = Freq/2;
% Lowpass = 215;
% Wn = Lowpass/NyqFreq;
% [B,A] = butter (4,Wn,'low');
% % run filter
% TA_low_filtered = filtfilt(B,A,TA_val);
% 
% % Highpass filter 10Hz
% Highpass = 66;
% Wo = Highpass/NyqFreq;
% [D,C] = butter (4,Wo,'high');
% % run filter
% high_pass_TA = filtfilt(D,C,TA_low_filtered);
% 
% % Full wave rectification of EMG
% filtered_TA_215_66 = abs(high_pass_TA);

%% Determining Onset & Offset for EMG Artifacts

% First Take the Derivative of Imported waveform
TA_Deriv = gradient(TA_filter(:)) ./ gradient(time(:));
Sol_Deriv = gradient(Sol_filter(:)) ./ gradient(time(:));
Ham_Deriv = gradient(Ham_filter(:)) ./ gradient(time(:));
Quad_Deriv = gradient(Quad_filter(:)) ./ gradient(time(:));

TA_waveform = abs(TA_Deriv);
Sol_waveform = abs(Sol_Deriv);
Ham_waveform = abs(Ham_Deriv);
Quad_waveform = abs(Quad_Deriv);

start = find(time ==.005); % Cursors will be dropped between trials - So this can change from Start to
% cursor location and equivalent time point 

ART_Val = baseline*4;
EMG_Val = 25000;
EMG_Val2 = 6000;

%%  %%%% [ TA ] %%%%


%%
% Onset artifact 1 
for i = start:(length(TA_waveform)-5)
    if TA_waveform(i) > ART_Val && TA_waveform(i+1) > ART_Val && TA_waveform(i+2) > ART_Val && TA_waveform(i+3)...
       > ART_Val && TA_waveform(i+4) > ART_Val && TA_waveform(i+5) > ART_Val && TA_waveform(i+6) > ART_Val
     TA_onset_art1_index = i;
     TA_onset_art1_time = time(i);
     break
     else
        TA_onset_art1_index = NaN;
        TA_onset_art1_time = NaN;
    end
end

% Offset artifact 1 
if isnan(TA_onset_art1_index)
     TA_offset_art1_index = NaN;
     TA_offset_art1_time = NaN;
else
    TA_offset_art1_index = TA_onset_art1_index + 50;
    TA_offset_art1_time = time(TA_offset_art1_index);
%     for i = TA_onset_art1_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             TA_offset_art1_index = i;
%             TA_offset_art1_time = TA_time(i);
%         break
%         else
%             TA_offset_art1_index = NaN;
%             TA_offset_art1_time = NaN; 
%         end
%     end
end

% Determining Location of Onset & Offset of EMG Response

% Onset EMG 1 
for i = TA_offset_art1_index:TA_onset_art2_index
    if TA_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_EMG1_index = i;
     TA_onset_EMG1_time = time(i);
     break
     else
        TA_onset_EMG1_index = NaN;
        TA_onset_EMG1_time = NaN;
    end
end

% Offset EMG 1
if isnan(TA_onset_EMG1_index)
     TA_offset_EMG1_index = NaN;
     TA_offset_EMG1_time = NaN;
else
    for i = TA_onset_EMG1_index:TA_onset_art2_index 
        if TA_waveform(i) < EMG_Val2 && TA_waveform(i+1) < EMG_Val2 && TA_waveform(i+2) < EMG_Val2 && TA_waveform(i+3)...
                < EMG_Val2 && TA_waveform(i+4) < EMG_Val2 && TA_waveform(i+5) < EMG_Val2 && TA_waveform(i+6) < EMG_Val2
            TA_offset_EMG1_index = i;
            TA_offset_EMG1_time = time(i);
        break
        else
            TA_offset_EMG1_index = NaN;
            TA_offset_EMG1_time = NaN; 
        end
    end
end

% Area Under the Curve

try TA_AUC1 = trapz(TA_filter(TA_onset_EMG1_index:TA_offset_EMG1_index));
catch TA_AUC1 = NaN;
end

%%  %%%% [ SOL ] %%%%


%%
% Onset artifact 1 
for i = start:(length(Sol_waveform)-5)
    if Sol_waveform(i) > ART_Val && Sol_waveform(i+1) > ART_Val && Sol_waveform(i+2) > ART_Val && Sol_waveform(i+3)...
       > ART_Val && Sol_waveform(i+4) > ART_Val && Sol_waveform(i+5) > ART_Val && Sol_waveform(i+6) > ART_Val
     Sol_onset_art1_index = i;
     Sol_onset_art1_time = time(i);
     break
     else
        Sol_onset_art1_index = NaN;
        Sol_onset_art1_time = NaN;
    end
end

% Offset artifact 1 
if isnan(Sol_onset_art1_index)
     Sol_offset_art1_index = NaN;
     Sol_offset_art1_time = NaN;
else
    Sol_offset_art1_index = Sol_onset_art1_index + 50;
    Sol_offset_art1_time = time(Sol_offset_art1_index);
%     for i = Sol_onset_art1_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Sol_offset_art1_index = i;
%             Sol_offset_art1_time = Sol_time(i);
%         break
%         else
%             Sol_offset_art1_index = NaN;
%             Sol_offset_art1_time = NaN; 
%         end
%     end
end

% Determining Location of Onset & Offset of EMG Response

% Onset EMG 1 
for i = Sol_offset_art1_index:Sol_onset_art2_index
    if Sol_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Sol_onset_EMG1_index = i;
     Sol_onset_EMG1_time = time(i);
     break
     else
        Sol_onset_EMG1_index = NaN;
        Sol_onset_EMG1_time = NaN;
    end
end

% Offset EMG 1
if isnan(Sol_onset_EMG1_index)
     Sol_offset_EMG1_index = NaN;
     Sol_offset_EMG1_time = NaN;
else
    for i = Sol_onset_EMG1_index:Sol_onset_art2_index 
        if Sol_waveform(i) < EMG_Val2 && Sol_waveform(i+1) < EMG_Val2 && Sol_waveform(i+2) < EMG_Val2 && Sol_waveform(i+3)...
                < EMG_Val2 && Sol_waveform(i+4) < EMG_Val2 && Sol_waveform(i+5) < EMG_Val2 && Sol_waveform(i+6) < EMG_Val2
            Sol_offset_EMG1_index = i;
            Sol_offset_EMG1_time = time(i);
        break
        else
            Sol_offset_EMG1_index = NaN;
            Sol_offset_EMG1_time = NaN; 
        end
    end
end

% Area Under the Curve

try Sol_AUC1 = trapz(Sol_filter(Sol_onset_EMG1_index:Sol_offset_EMG1_index));
catch Sol_AUC1 = NaN;
end

%% %%%% [ Quad ] %%%%


%%
% Onset artifact 1 
for i = start:(length(Quad_waveform)-5)
    if Quad_waveform(i) > ART_Val && Quad_waveform(i+1) > ART_Val && Quad_waveform(i+2) > ART_Val && Quad_waveform(i+3)...
       > ART_Val && Quad_waveform(i+4) > ART_Val && Quad_waveform(i+5) > ART_Val && Quad_waveform(i+6) > ART_Val
     Quad_onset_art1_index = i;
     Quad_onset_art1_time = time(i);
     break
     else
        Quad_onset_art1_index = NaN;
        Quad_onset_art1_time = NaN;
    end
end

% Offset artifact 1 
if isnan(Quad_onset_art1_index)
     Quad_offset_art1_index = NaN;
     Quad_offset_art1_time = NaN;
else
    Quad_offset_art1_index = Quad_onset_art1_index + 50;
    Quad_offset_art1_time = time(Quad_offset_art1_index);
%     for i = Quad_onset_art1_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Quad_offset_art1_index = i;
%             Quad_offset_art1_time = Quad_time(i);
%         break
%         else
%             Quad_offset_art1_index = NaN;
%             Quad_offset_art1_time = NaN; 
%         end
%     end
end

% Determining Location of Onset & Offset of EMG Response

% Onset EMG 1 
for i = Quad_offset_art1_index:Quad_onset_art2_index
    if Quad_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Quad_onset_EMG1_index = i;
     Quad_onset_EMG1_time = time(i);
     break
     else
        Quad_onset_EMG1_index = NaN;
        Quad_onset_EMG1_time = NaN;
    end
end

% Offset EMG 1
if isnan(Quad_onset_EMG1_index)
     Quad_offset_EMG1_index = NaN;
     Quad_offset_EMG1_time = NaN;
else
    for i = Quad_onset_EMG1_index:Quad_onset_art2_index 
        if Quad_waveform(i) < EMG_Val2 && Quad_waveform(i+1) < EMG_Val2 && Quad_waveform(i+2) < EMG_Val2 && Quad_waveform(i+3)...
                < EMG_Val2 && Quad_waveform(i+4) < EMG_Val2 && Quad_waveform(i+5) < EMG_Val2 && Quad_waveform(i+6) < EMG_Val2
            Quad_offset_EMG1_index = i;
            Quad_offset_EMG1_time = time(i);
        break
        else
            Quad_offset_EMG1_index = NaN;
            Quad_offset_EMG1_time = NaN; 
        end
    end
end

% Area Under the Curve

try Quad_AUC1 = trapz(Quad_filter(Quad_onset_EMG1_index:Quad_offset_EMG1_index));
catch Quad_AUC1 = NaN;
end

%% %%%% [ HAM ] %%%%


%%
% Onset artifact 1 
for i = start:(length(Ham_waveform)-5)
    if Ham_waveform(i) > ART_Val && Ham_waveform(i+1) > ART_Val && Ham_waveform(i+2) > ART_Val && Ham_waveform(i+3)...
       > ART_Val && Ham_waveform(i+4) > ART_Val && Ham_waveform(i+5) > ART_Val && Ham_waveform(i+6) > ART_Val
     Ham_onset_art1_index = i;
     Ham_onset_art1_time = time(i);
     break
     else
        Ham_onset_art1_index = NaN;
        Ham_onset_art1_time = NaN;
    end
end

% Offset artifact 1 
if isnan(Ham_onset_art1_index)
     Ham_offset_art1_index = NaN;
     Ham_offset_art1_time = NaN;
else
    Ham_offset_art1_index = Ham_onset_art1_index + 50;
    Ham_offset_art1_time = time(Ham_offset_art1_index);
%     for i = Ham_onset_art1_index:(length(waveform)-5) 
%         if waveform(i) < Val && waveform(i+1) < Val && waveform(i+2) < Val && waveform(i+3)...
%                 < Val && waveform(i+4) < Val && waveform(i+5) < Val && waveform(i+6) < Val
%             Ham_offset_art1_index = i;
%             Ham_offset_art1_time = Ham_time(i);
%         break
%         else
%             Ham_offset_art1_index = NaN;
%             Ham_offset_art1_time = NaN; 
%         end
%     end
end

% Determining Location of Onset & Offset of EMG Response

% Onset EMG 1 
for i = Ham_offset_art1_index:Ham_onset_art2_index
    if Ham_waveform(i) > EMG_Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     Ham_onset_EMG1_index = i;
     Ham_onset_EMG1_time = time(i);
     break
     else
        Ham_onset_EMG1_index = NaN;
        Ham_onset_EMG1_time = NaN;
    end
end

% Offset EMG 1
if isnan(Ham_onset_EMG1_index)
     Ham_offset_EMG1_index = NaN;
     Ham_offset_EMG1_time = NaN;
else
    for i = Ham_onset_EMG1_index:Ham_onset_art2_index 
        if Ham_waveform(i) < EMG_Val2 && Ham_waveform(i+1) < EMG_Val2 && Ham_waveform(i+2) < EMG_Val2 && Ham_waveform(i+3)...
                < EMG_Val2 && Ham_waveform(i+4) < EMG_Val2 && Ham_waveform(i+5) < EMG_Val2 && Ham_waveform(i+6) < EMG_Val2
            Ham_offset_EMG1_index = i;
            Ham_offset_EMG1_time = time(i);
        break
        else
            Ham_offset_EMG1_index = NaN;
            Ham_offset_EMG1_time = NaN; 
        end
    end
end

% Area Under the Curve

try Ham_AUC1 = trapz(Ham_filter(Ham_onset_EMG1_index:Ham_offset_EMG1_index));
catch Ham_AUC1 = NaN;
end

% Onset EMG 1
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Onset 1')(s,1) = TA_onset_EMG1_time;
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Onset 1')(s,1) = Sol_onset_EMG1_time;
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Onset 1')(s,1) = Ham_onset_EMG1_time;
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Onset 1')(s,1) = Quad_onset_EMG1_time;

% Offset EMG 1
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('Offset 1')(s,1) = TA_offset_EMG1_time;
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('Offset 1')(s,1) = Sol_offset_EMG1_time;
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('Offset 1')(s,1) = Ham_offset_EMG1_time;
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('Offset 1')(s,1) = Quad_offset_EMG1_time;

% AUC EMG 1
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).TA.('AUC 1')(s,1) = TA_AUC1;
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Sol.('AUC 1')(s,1) = Sol_AUC1;
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Ham.('AUC 1')(s,1) = Ham_AUC1;
ParticipantData2.(['Participant_',num2str(p),]).(['Session_', num2str(s),]).Quad.('AUC 1')(s,1) = Quad_AUC1;


        end
    end
end

clearvars -except ParticipantData ParticipantData2


