%Created on 02/09/2022 by Jessica Gilliam
% RMS Analysis 

clear;close;clc

% Import Raw Code

cd 'C:\Users\jg300416\Documents\MATLAB\DoD\Evan\Spike2_GRASS'
data = load('NIH_TSS_Sample_Data_02_08.mat');

TA_val = data.FWR_windup_JC_lft_LE_020822_TA.values;
TA_time = data.FWR_windup_JC_lft_LE_020822_TA.times;

%RMS Moving Window (5)

movrms = sqrt(movmean(TA_val.^ 2, 5));

% 10 -500

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

plot(TA_time,TA_val,'b')
hold on
plot(TA_time,movrms,'r')
hold on
plot(TA_time,TA_filter)
legend('Raw Data','RMS','Filter 10-100')
