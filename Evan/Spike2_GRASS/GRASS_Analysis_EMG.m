% Created on 02/09/2022 By Jessica Gilliam
% Using Matlab Function for Filtering EMG Data


% Import Raw Code
clear;clc;
cd 'C:\Users\jg300416\Documents\MATLAB\DoD\Evan\Spike2_GRASS'
data = load('NIH_TSS_Sample_Data_02_08.mat');

TA_val = data.FWR_windup_JC_lft_LE_020822_TA.values;
TA_time = data.FWR_windup_JC_lft_LE_020822_TA.times;

%%

% Lowpass filter 500Hz
Freq = 2000;
NyqFreq = Freq/2;
Lowpass = 500;
Wn = Lowpass/NyqFreq;
[B,A] = butter (4,Wn,'low');
% run filter
TA_low_filtered = filtfilt(B,A,TA_val);

% Highpass filter 10Hz
Highpass = 6;
Wo = Highpass/NyqFreq;
[D,C] = butter (4,Wo,'high');
% run filter
high_pass_TA = filtfilt(D,C,TA_low_filtered);

% Full wave rectification of EMG
TA_filter = abs(high_pass_TA);

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


% Cursors will be dropped between trials - So this can change from Start to
% cursor location and equivalent time point 



% First Take the Derivative of Imported waveform
TA_Deriv = gradient(TA_filter(:)) ./ gradient(TA_time(:));
waveform = abs(TA_Deriv);
start = find(TA_time ==.005);

b_matrix = waveform(start:10000);
baseline = mean(b_matrix);

Val = baseline*4;

% Onset artifact 1 
for i = start:(length(waveform)-5)
    if waveform(i) > Val && waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       > Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_art1_index = i;
     TA_onset_art1_time = TA_time(i);
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
    TA_offset_art1_time = TA_time(TA_offset_art1_index);
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
    TA_offset_art2_time = TA_time(TA_offset_art2_index);
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
    TA_offset_art3_time = TA_time(TA_offset_art3_index);
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
    TA_offset_art4_time = TA_time(TA_offset_art4_index);
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
    TA_offset_art5_time = TA_time(TA_offset_art5_index);
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

%% Determining Location of Onset & Offset of EMG Response

% For example from artefact offset.... need a threshold value here (2.5??)
% data point

Val = 25000;
Val2 = 6000;
% Onset EMG 1 
for i = TA_offset_art1_index:TA_onset_art2_index
    if waveform(i) > Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_EMG1_index = i;
     TA_onset_EMG1_time = TA_time(i);
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
        if waveform(i) < Val2 && waveform(i+1) < Val2 && waveform(i+2) < Val2 && waveform(i+3)...
                < Val2 && waveform(i+4) < Val2 && waveform(i+5) < Val2 && waveform(i+6) < Val2
            TA_offset_EMG1_index = i;
            TA_offset_EMG1_time = TA_time(i);
        break
        else
            TA_offset_EMG1_index = NaN;
            TA_offset_EMG1_time = NaN; 
        end
    end
end

%Onset EMG 2
for i = TA_offset_art2_index:TA_onset_art3_index
    if waveform(i) > Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_EMG2_index = i;
     TA_onset_EMG2_time = TA_time(i);
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
        if waveform(i) < Val2 && waveform(i+1) < Val2 && waveform(i+2) < Val2 && waveform(i+3)...
                < Val2 && waveform(i+4) < Val2 && waveform(i+5) < Val2 && waveform(i+6) < Val2
            TA_offset_EMG2_index = i;
            TA_offset_EMG2_time = TA_time(i);
        break
        else
            TA_offset_EMG2_index = NaN;
            TA_offset_EMG2_time = NaN; 
        end
    end
end

% Onset EMG 3
for i = TA_offset_art3_index:TA_onset_art4_index
    if waveform(i) > Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_EMG3_index = i;
     TA_onset_EMG3_time = TA_time(i);
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
        if waveform(i) < Val2 && waveform(i+1) < Val2 && waveform(i+2) < Val2 && waveform(i+3)...
                < Val2 && waveform(i+4) < Val2 && waveform(i+5) < Val2 && waveform(i+6) < Val2
            TA_offset_EMG3_index = i;
            TA_offset_EMG3_time = TA_time(i);
        break
        else
            TA_offset_EMG3_index = NaN;
            TA_offset_EMG3_time = NaN; 
        end
    end
end

% Onset EMG 4
for i = TA_offset_art4_index:TA_onset_art5_index
    if waveform(i) > Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_EMG4_index = i;
     TA_onset_EMG4_time = TA_time(i);
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
        if waveform(i) < Val2 && waveform(i+1) < Val2 && waveform(i+2) < Val2 && waveform(i+3)...
                < Val2 && waveform(i+4) < Val2 && waveform(i+5) < Val2 && waveform(i+6) < Val2
            TA_offset_EMG4_index = i;
            TA_offset_EMG4_time = TA_time(i);
        break
        else
            TA_offset_EMG4_index = NaN;
            TA_offset_EMG4_time = NaN; 
        end
    end
end

% Onset EMG 5
for i = TA_offset_art5_index:(length(waveform)-5)
    if waveform(i) > Val %&& waveform(i+1) > Val && waveform(i+2) > Val && waveform(i+3)...
       %> Val && waveform(i+4) > Val && waveform(i+5) > Val && waveform(i+6) > Val
     TA_onset_EMG5_index = i;
     TA_onset_EMG5_time = TA_time(i);
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
    for i = TA_onset_EMG5_index:(length(waveform)-5) 
        if waveform(i) < Val2 && waveform(i+1) < Val2 && waveform(i+2) < Val2 && waveform(i+3)...
                < Val2 && waveform(i+4) < Val2 && waveform(i+5) < Val2 && waveform(i+6) < Val2
            TA_offset_EMG5_index = i;
            TA_offset_EMG5_time = TA_time(i);
        break
        else
            TA_offset_EMG5_index = NaN;
            TA_offset_EMG5_time = NaN; 
        end
    end
end
%% Area Under the Curve

try AUC1 = trapz(TA_filter(TA_onset_EMG1_index:TA_offset_EMG1_index));
catch AUC1 = NaN;
end

try AUC2 = trapz(TA_filter(TA_onset_EMG2_index:TA_offset_EMG2_index));
catch AUC2 = NaN;
end

try AUC3 = trapz(TA_filter(TA_onset_EMG3_index:TA_offset_EMG3_index));
catch AUC3 = NaN;
end

try AUC4 = trapz(TA_filter(TA_onset_EMG4_index:TA_offset_EMG4_index));
catch AUC4 = NaN;
end

try AUC5 = trapz(TA_filter(TA_onset_EMG5_index:TA_offset_EMG5_index));
catch AUC5 = NaN;
end
%% Summation of Area Under the Curve for 5 consecutive responses for Pulse Train

try AUC_SUM = AUC1 + AUC2 + AUC3 + AUC4 + AUC5;
catch AUC_SUM = NaN;
end



