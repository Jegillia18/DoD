%% 
%%%%%%%%%%%%%%%%%%%%%need to conert everything to muscle ind. prob easier
%%%%%%%%%%%%%%%%%%%%%to make functions
[~, WristFl3_Marker_ind] =  min(abs(WristFl3_x - Marker_start_time));  % finding the nearest corresponding time from WristFl time domain to Elbow time domain

[~, WristFl3_Marker_end] =  min(abs(WristFl3_x - Marker_end_time)); 

[~, WristFl3_Pre] =  min(abs(WristFl3_x - TFx_pre)); 
%WristFl_trial = WristFl_x(WristFl_Marker_ind);

[~, WristFl3_post] =  min(abs(WristFl3_x - TFx_post));

WristFl3_STD = std(WristFl3_y(WristFl3_Pre-1:WristFl3_Marker_ind-1));
WristFl3_baseline_avg = mean(WristFl3_y(WristFl3_Pre-1:WristFl3_Marker_ind-1));
WristFl3_SD = WristFl3_baseline_avg + (WristFl3_STD*3);


for i = WristFl3_Marker_ind:WristFl3_Marker_end
if WristFl3_y(i) > WristFl3_SD && WristFl3_y(i+1) > WristFl3_SD && WristFl3_y(i+2) > WristFl3_SD && WristFl3_y(i+3) > WristFl3_SD && WristFl3_y(i+4) > WristFl3_SD && WristFl3_y(i+5) > WristFl3_SD && WristFl3_y(i+6) > WristFl3_SD...
        && WristFl3_y(i+7) > WristFl3_SD && WristFl3_y(i+8) > WristFl3_SD && WristFl3_y(i+9) > WristFl3_SD && WristFl3_y(i+10) > WristFl3_SD...
        && WristFl3_y(i+11) > WristFl3_SD && WristFl3_y(i+12) > WristFl3_SD && WristFl3_y(i+13) > WristFl3_SD && WristFl3_y(i+14) > WristFl3_SD...
        && WristFl3_y(i+15) > WristFl3_SD && WristFl3_y(i+16) > WristFl3_SD && WristFl3_y(i+17) > WristFl3_SD && WristFl3_y(i+18) > WristFl3_SD...
        && WristFl3_y(i+19) > WristFl3_SD && WristFl3_y(i+20) > WristFl3_SD...
        && WristFl3_y(i+21) > WristFl3_SD && WristFl3_y(i+22) > WristFl3_SD && WristFl3_y(i+23) > WristFl3_SD && WristFl3_y(i+24) > WristFl3_SD...
        && WristFl3_y(i+25) > WristFl3_SD && WristFl3_y(i+26) > WristFl3_SD && WristFl3_y(i+27) > WristFl3_SD && WristFl3_y(i+28) > WristFl3_SD...
        && WristFl3_y(i+29) > WristFl3_SD && WristFl3_y(i+30) > WristFl3_SD && WristFl3_y(i+31) > WristFl3_SD && WristFl3_y(i+32) > WristFl3_SD...
        && WristFl3_y(i+33) > WristFl3_SD && WristFl3_y(i+34) > WristFl3_SD && WristFl3_y(i+35) > WristFl3_SD && WristFl3_y(i+36) > WristFl3_SD...
        && WristFl3_y(i+37) > WristFl3_SD && WristFl3_y(i+38) > WristFl3_SD && WristFl3_y(i+39) > WristFl3_SD && WristFl3_y(i+40) > WristFl3_SD...
        && WristFl3_y(i+41) > WristFl3_SD && WristFl3_y(i+42) > WristFl3_SD && WristFl3_y(i+43) > WristFl3_SD && WristFl3_y(i+44) > WristFl3_SD...
        && WristFl3_y(i+45) > WristFl3_SD && WristFl3_y(i+46) > WristFl3_SD && WristFl3_y(i+47) > WristFl3_SD && WristFl3_y(i+48) > WristFl3_SD...
        && WristFl3_y(i+49) > WristFl3_SD
   
   
    WristFl3_Onset_Index = i;
    break
else 
    WristFl3_Onset_Index = NaN;
end
end

if ~isnan(WristFl3_Onset_Index)
WristFl3_onset_time = WristFl3_x(WristFl3_Onset_Index);   %putting it in WristFl time domain
else
    WristFl3_onset_time = NaN;
%[~, WristFl_trial] =  min(abs(Elbow - WristFl_trial));  % finding the nearest corresponding time from WristFl time domain to Elbow time domain
end
% if length(WristFl_trial) ~= 1
%   WristFl_trial(2) = [];
% end
% WristFl_Onset = [WristFl_onset_time; WristFl2_onset_time; WristFl3_onset_time];
WristFl_Onset = WristFl3_onset_time;

%% Offset
if isnan(WristFl3_Onset_Index) 
    WristFl3_Offset_Index = Inf;
    WristFl3_Offset_time = Inf;
%     break
 else
for i = WristFl3_Onset_Index:WristFl3_Marker_end

if WristFl3_y(i) < WristFl3_SD && WristFl3_y(i+1) < WristFl3_SD && WristFl3_y(i+2) < WristFl3_SD && WristFl3_y(i+3) < WristFl3_SD && WristFl3_y(i+4) < WristFl3_SD && WristFl3_y(i+5) < WristFl3_SD && WristFl3_y(i+6) < WristFl3_SD...
        && WristFl3_y(i+7) < WristFl3_SD && WristFl3_y(i+8) < WristFl3_SD && WristFl3_y(i+9) < WristFl3_SD && WristFl3_y(i+10) < WristFl3_SD...
        && WristFl3_y(i+11) < WristFl3_SD && WristFl3_y(i+12) < WristFl3_SD && WristFl3_y(i+13) < WristFl3_SD && WristFl3_y(i+14) < WristFl3_SD...
        && WristFl3_y(i+15) < WristFl3_SD && WristFl3_y(i+16) < WristFl3_SD && WristFl3_y(i+17) < WristFl3_SD && WristFl3_y(i+18) < WristFl3_SD...
        && WristFl3_y(i+19) < WristFl3_SD && WristFl3_y(i+20) < WristFl3_SD...
        && WristFl3_y(i+21) < WristFl3_SD && WristFl3_y(i+22) < WristFl3_SD && WristFl3_y(i+23) < WristFl3_SD && WristFl3_y(i+24) < WristFl3_SD...
        && WristFl3_y(i+25) < WristFl3_SD && WristFl3_y(i+26) < WristFl3_SD && WristFl3_y(i+27) < WristFl3_SD && WristFl3_y(i+28) < WristFl3_SD...
        && WristFl3_y(i+29) < WristFl3_SD && WristFl3_y(i+30) < WristFl3_SD && WristFl3_y(i+31) < WristFl3_SD && WristFl3_y(i+32) < WristFl3_SD...
        && WristFl3_y(i+33) < WristFl3_SD && WristFl3_y(i+34) < WristFl3_SD && WristFl3_y(i+35) < WristFl3_SD && WristFl3_y(i+36) < WristFl3_SD...
        && WristFl3_y(i+37) < WristFl3_SD && WristFl3_y(i+38) < WristFl3_SD && WristFl3_y(i+39) < WristFl3_SD && WristFl3_y(i+40) < WristFl3_SD...
        && WristFl3_y(i+41) < WristFl3_SD && WristFl3_y(i+42) < WristFl3_SD && WristFl3_y(i+43) < WristFl3_SD && WristFl3_y(i+44) < WristFl3_SD...
        && WristFl3_y(i+45) < WristFl3_SD && WristFl3_y(i+46) < WristFl3_SD && WristFl3_y(i+47) < WristFl3_SD && WristFl3_y(i+48) < WristFl3_SD...
        && WristFl3_y(i+49) < WristFl3_SD 
    
    
    
    WristFl3_Offset_Index = i;
    break
else 
    WristFl3_Offset_Index = NaN;
end
 end
 
 if ~isnan(WristFl3_Offset_Index)
WristFl3_Offset_time = WristFl3_x(WristFl3_Offset_Index);   %putting it in WristFl time domain
else
    WristFl3_Offset_time = NaN;
%[~, WristFl_trial] =  min(abs(Elbow - WristFl_trial));  % finding the nearest corresponding time from WristFl time domain to Elbow time domain
 end
end

% WristFl_Offset = [WristFl_Offset_time; WristFl2_Offset_time; WristFl3_Offset_time];
WristFl_Offset = WristFl3_Offset_time;
%% Offset from Marker
if isnan(WristFl3_Onset_Index) 
    WristFl3_FMO_Index = Inf;
    WristFl3_FMO_time = Inf;
%     break
 else
try
for i = WristFl3_Marker_end:(length(WristFl3_y)-20)


if WristFl3_y(i) < WristFl3_SD && WristFl3_y(i+1) < WristFl3_SD && WristFl3_y(i+2) < WristFl3_SD && WristFl3_y(i+3) < WristFl3_SD && WristFl3_y(i+4) < WristFl3_SD && WristFl3_y(i+5) < WristFl3_SD && WristFl3_y(i+6) < WristFl3_SD...
        && WristFl3_y(i+7) < WristFl3_SD && WristFl3_y(i+8) < WristFl3_SD && WristFl3_y(i+9) < WristFl3_SD && WristFl3_y(i+10) < WristFl3_SD...
        && WristFl3_y(i+11) < WristFl3_SD && WristFl3_y(i+12) < WristFl3_SD && WristFl3_y(i+13) < WristFl3_SD && WristFl3_y(i+14) < WristFl3_SD...
        && WristFl3_y(i+15) < WristFl3_SD && WristFl3_y(i+16) < WristFl3_SD && WristFl3_y(i+17) < WristFl3_SD && WristFl3_y(i+18) < WristFl3_SD...
        && WristFl3_y(i+19) < WristFl3_SD && WristFl3_y(i+20) < WristFl3_SD...
        && WristFl3_y(i+21) < WristFl3_SD && WristFl3_y(i+22) < WristFl3_SD && WristFl3_y(i+23) < WristFl3_SD && WristFl3_y(i+24) < WristFl3_SD...
        && WristFl3_y(i+25) < WristFl3_SD && WristFl3_y(i+26) < WristFl3_SD && WristFl3_y(i+27) < WristFl3_SD && WristFl3_y(i+28) < WristFl3_SD...
        && WristFl3_y(i+29) < WristFl3_SD && WristFl3_y(i+30) < WristFl3_SD && WristFl3_y(i+31) < WristFl3_SD && WristFl3_y(i+32) < WristFl3_SD...
        && WristFl3_y(i+33) < WristFl3_SD && WristFl3_y(i+34) < WristFl3_SD && WristFl3_y(i+35) < WristFl3_SD && WristFl3_y(i+36) < WristFl3_SD...
        && WristFl3_y(i+37) < WristFl3_SD && WristFl3_y(i+38) < WristFl3_SD && WristFl3_y(i+39) < WristFl3_SD && WristFl3_y(i+40) < WristFl3_SD...
        && WristFl3_y(i+41) < WristFl3_SD && WristFl3_y(i+42) < WristFl3_SD && WristFl3_y(i+43) < WristFl3_SD && WristFl3_y(i+44) < WristFl3_SD...
        && WristFl3_y(i+45) < WristFl3_SD && WristFl3_y(i+46) < WristFl3_SD && WristFl3_y(i+47) < WristFl3_SD && WristFl3_y(i+48) < WristFl3_SD...
        && WristFl3_y(i+49) < WristFl3_SD 
    
    
    WristFl3_FMO_Index = i;
    break
else 
    WristFl3_FMO_Index = NaN;
end
 end
 catch
 WristFl3_FMO_Index = NaN;
end
 if ~isnan(WristFl3_FMO_Index)
WristFl3_FMO_time = WristFl3_x(WristFl3_FMO_Index);   %putting it in WristFl time domain
else
    WristFl3_FMO_time = NaN;
%[~, WristFl_trial] =  min(abs(Elbow - WristFl_trial));  % finding the nearest corresponding time from WristFl time domain to Elbow time domain
 end
end

% WristFl_FMO = [WristFl_FMO_time; WristFl2_FMO_time; WristFl3_FMO_time];
WristFl_FMO = WristFl3_FMO_time;


%%  WristFl From Marker Times Code
% [~, WristFl3_Marker_ind] =  min(abs(WristFl3_x - Marker_start_time));  % finding the nearest corresponding time from WristFl time domain to Elbow time domain
% 
% [~, WristFl3_Marker_end] =  min(abs(WristFl3_x - Marker_end_time));
% 
% [~, WristFl3_pre] =  min(abs(WristFl3_x - TFx_pre));
% 
% [~, WristFl3_post] =  min(abs(WristFl3_x - TFx_post));

WristFl_trial_mean = mean(WristFl3_y(WristFl3_Marker_ind:WristFl3_Marker_end-1));

WristFl_pretrial_mean = mean(WristFl3_y(WristFl3_Marker_ind-dur:WristFl3_Marker_ind-1));

%WristFl_pretrial_mean = mean(WristFl3_y(1:WristFl3_Marker_ind-1)); %to use when not 5 sec pre

WristFl_posttrial_mean = mean(WristFl3_y(WristFl3_Marker_end:WristFl3_Marker_end+dur-1));

%WristFl_posttrial_mean = mean(WristFl3_y(WristFl3_Marker_end:end)); %to use when not 5 sec post

[WristFl_peak, WristFl_peak_ind] = max(WristFl3_y(WristFl3_Marker_ind:WristFl3_Marker_end-1));
% 


% 
 WristFl_trial_time = (WristFl3_x(WristFl3_Marker_end) - WristFl3_x(WristFl3_Marker_ind));
% 
% %WristFl_times = [(WristFl3_x(WristFl3_Marker_ind) - WristFl3_x(1)),WristFl_trial_time, (WristFl3_x(WristFl3_Marker_end+dur-1)- WristFl3_x(WristFl3_Marker_end))]; %pre < 5 
% 
% WristFl_times = [(WristFl3_x(WristFl3_Marker_ind-1)- WristFl3_x(WristFl3_Marker_ind-dur)),WristFl_trial_time, WristFl3_x(end) - WristFl3_x(WristFl3_Marker_end)]; %post < 5 
% 
% WristFl_Contribution = (WristFl_trial_mean/Total_EMG_Mean)*100;
% 
% WristFl_Outcomes = [WristFl_pretrial_mean, WristFl_trial_mean, WristFl_posttrial_mean, WristFl_peak, WristFl_Contribution];




