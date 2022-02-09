%Created on 02/09/2022 by Jessica Gilliam
% Trial Start Analysis

clear;close;clc

% Import Raw Code

cd 'C:\Users\jg300416\Documents\MATLAB\DoD\Evan\Spike2_GRASS'
data = load('NIH_TSS_Sample_Data_02_08.mat');

TA_val = data.FWR_windup_JC_lft_LE_020822_TA.values;
TA_time = data.FWR_windup_JC_lft_LE_020822_TA.times;

