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

% plot(TA_time, TA_val,'b')
% hold on
% plot(TA_time, TA_low_filtered,'r')
% L = legend('Raw Data','Low Pass');
% L.FontSize = 14;

% Highpass filter 10Hz
Highpass = 10;
Wo = Highpass/NyqFreq;
[D,C] = butter (4,Wo,'high');
% run filter
high_pass_TA = filtfilt(D,C,TA_low_filtered);

% plot(TA_time, TA_val,'b')
% hold on
% plot(TA_time, high_pass_TA,'r')
% L = legend('Raw Data','High Pass');
% L.FontSize = 14;

% Full wave rectification of EMG
filtered_TA_500_10 = abs(high_pass_TA);

% plot(TA_time, TA_val,'b')
% hold on
% plot(TA_time, filtered_TA_500_10,'r')
% L = legend('Raw Data','Rectified');
% L.FontSize = 14;

%%

% Lowpass filter 500Hz
Freq = 2000;
NyqFreq = Freq/2;
Lowpass = 215;
Wn = Lowpass/NyqFreq;
[B,A] = butter (4,Wn,'low');
% run filter
TA_low_filtered = filtfilt(B,A,TA_val);

% Highpass filter 10Hz
Highpass = 66;
Wo = Highpass/NyqFreq;
[D,C] = butter (4,Wo,'high');
% run filter
high_pass_TA = filtfilt(D,C,TA_low_filtered);

% Full wave rectification of EMG
filtered_TA_215_66 = abs(high_pass_TA);






plot(TA_time, filtered_TA_500_10,'r')
hold on
plot(TA_time,TA_val,'b')
hold on
plot(TA_time,filtered_TA_215_66,'g')
legend('Filtered TA 10/500','Raw Data','Filtered TA 66/215')


