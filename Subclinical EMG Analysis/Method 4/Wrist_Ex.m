%% 
%%%%%%%%%%%%%%%%%%%%%need to conert everything to muscle ind. prob easier
%%%%%%%%%%%%%%%%%%%%%to make functions
[~, WristEx3_Marker_ind] =  min(abs(WristEx3_x - Marker_start_time));  % finding the nearest corresponding time from WristEx time domain to Elbow time domain

[~, WristEx3_Marker_end] =  min(abs(WristEx3_x - Marker_end_time)); 

[~, WristEx3_Pre] =  min(abs(WristEx3_x - TFx_pre)); 
%WristEx_trial = WristEx_x(WristEx_Marker_ind);
[~, WristEx3_post] =  min(abs(WristEx3_x - TFx_post));


WristEx3_STD = std(WristEx3_y(WristEx3_Pre-1:WristEx3_Marker_ind-1));
WristEx3_baseline_avg = mean(WristEx3_y(WristEx3_Pre-1:WristEx3_Marker_ind-1));
WristEx3_SD = WristEx3_baseline_avg + (WristEx3_STD*3);


for i = WristEx3_Marker_ind:WristEx3_Marker_end
if WristEx3_y(i) > WristEx3_SD && WristEx3_y(i+1) > WristEx3_SD && WristEx3_y(i+2) > WristEx3_SD && WristEx3_y(i+3) > WristEx3_SD && WristEx3_y(i+4) > WristEx3_SD && WristEx3_y(i+5) > WristEx3_SD && WristEx3_y(i+6) > WristEx3_SD...
        && WristEx3_y(i+7) > WristEx3_SD && WristEx3_y(i+8) > WristEx3_SD && WristEx3_y(i+9) > WristEx3_SD && WristEx3_y(i+10) > WristEx3_SD...
        && WristEx3_y(i+11) > WristEx3_SD && WristEx3_y(i+12) > WristEx3_SD && WristEx3_y(i+13) > WristEx3_SD && WristEx3_y(i+14) > WristEx3_SD...
        && WristEx3_y(i+15) > WristEx3_SD && WristEx3_y(i+16) > WristEx3_SD && WristEx3_y(i+17) > WristEx3_SD && WristEx3_y(i+18) > WristEx3_SD...
        && WristEx3_y(i+19) > WristEx3_SD && WristEx3_y(i+20) > WristEx3_SD...
        && WristEx3_y(i+21) > WristEx3_SD && WristEx3_y(i+22) > WristEx3_SD && WristEx3_y(i+23) > WristEx3_SD && WristEx3_y(i+24) > WristEx3_SD...
        && WristEx3_y(i+25) > WristEx3_SD && WristEx3_y(i+26) > WristEx3_SD && WristEx3_y(i+27) > WristEx3_SD && WristEx3_y(i+28) > WristEx3_SD...
        && WristEx3_y(i+29) > WristEx3_SD && WristEx3_y(i+30) > WristEx3_SD && WristEx3_y(i+31) > WristEx3_SD && WristEx3_y(i+32) > WristEx3_SD...
        && WristEx3_y(i+33) > WristEx3_SD && WristEx3_y(i+34) > WristEx3_SD && WristEx3_y(i+35) > WristEx3_SD && WristEx3_y(i+36) > WristEx3_SD...
        && WristEx3_y(i+37) > WristEx3_SD && WristEx3_y(i+38) > WristEx3_SD && WristEx3_y(i+39) > WristEx3_SD && WristEx3_y(i+40) > WristEx3_SD...
        && WristEx3_y(i+41) > WristEx3_SD && WristEx3_y(i+42) > WristEx3_SD && WristEx3_y(i+43) > WristEx3_SD && WristEx3_y(i+44) > WristEx3_SD...
        && WristEx3_y(i+45) > WristEx3_SD && WristEx3_y(i+46) > WristEx3_SD && WristEx3_y(i+47) > WristEx3_SD && WristEx3_y(i+48) > WristEx3_SD...
        && WristEx3_y(i+49) > WristEx3_SD
   
   
    WristEx3_Onset_Index = i;
    break
else 
    WristEx3_Onset_Index = NaN;
end
end

if ~isnan(WristEx3_Onset_Index)
WristEx3_onset_time = WristEx3_x(WristEx3_Onset_Index);   %putting it in WristEx time domain
else
    WristEx3_onset_time = NaN;
%[~, WristEx_trial] =  min(abs(Elbow - WristEx_trial));  % finding the nearest corresponding time from WristEx time domain to Elbow time domain
end
% if length(WristEx_trial) ~= 1
%   WristEx_trial(2) = [];
% end
% WristEx_Onset = [WristEx_onset_time; WristEx2_onset_time; WristEx3_onset_time];
WristEx_Onset = WristEx3_onset_time;

%% Offset
 if isnan(WristEx3_Onset_Index) 
    WristEx3_Offset_Index = Inf;
    WristEx3_Offset_time = Inf;
%     break
 else
for i = WristEx3_Onset_Index:WristEx3_Marker_end

if WristEx3_y(i) < WristEx3_SD && WristEx3_y(i+1) < WristEx3_SD && WristEx3_y(i+2) < WristEx3_SD && WristEx3_y(i+3) < WristEx3_SD && WristEx3_y(i+4) < WristEx3_SD && WristEx3_y(i+5) < WristEx3_SD && WristEx3_y(i+6) < WristEx3_SD...
        && WristEx3_y(i+7) < WristEx3_SD && WristEx3_y(i+8) < WristEx3_SD && WristEx3_y(i+9) < WristEx3_SD && WristEx3_y(i+10) < WristEx3_SD...
        && WristEx3_y(i+11) < WristEx3_SD && WristEx3_y(i+12) < WristEx3_SD && WristEx3_y(i+13) < WristEx3_SD && WristEx3_y(i+14) < WristEx3_SD...
        && WristEx3_y(i+15) < WristEx3_SD && WristEx3_y(i+16) < WristEx3_SD && WristEx3_y(i+17) < WristEx3_SD && WristEx3_y(i+18) < WristEx3_SD...
        && WristEx3_y(i+19) < WristEx3_SD && WristEx3_y(i+20) < WristEx3_SD...
        && WristEx3_y(i+21) < WristEx3_SD && WristEx3_y(i+22) < WristEx3_SD && WristEx3_y(i+23) < WristEx3_SD && WristEx3_y(i+24) < WristEx3_SD...
        && WristEx3_y(i+25) < WristEx3_SD && WristEx3_y(i+26) < WristEx3_SD && WristEx3_y(i+27) < WristEx3_SD && WristEx3_y(i+28) < WristEx3_SD...
        && WristEx3_y(i+29) < WristEx3_SD && WristEx3_y(i+30) < WristEx3_SD && WristEx3_y(i+31) < WristEx3_SD && WristEx3_y(i+32) < WristEx3_SD...
        && WristEx3_y(i+33) < WristEx3_SD && WristEx3_y(i+34) < WristEx3_SD && WristEx3_y(i+35) < WristEx3_SD && WristEx3_y(i+36) < WristEx3_SD...
        && WristEx3_y(i+37) < WristEx3_SD && WristEx3_y(i+38) < WristEx3_SD && WristEx3_y(i+39) < WristEx3_SD && WristEx3_y(i+40) < WristEx3_SD...
        && WristEx3_y(i+41) < WristEx3_SD && WristEx3_y(i+42) < WristEx3_SD && WristEx3_y(i+43) < WristEx3_SD && WristEx3_y(i+44) < WristEx3_SD...
        && WristEx3_y(i+45) < WristEx3_SD && WristEx3_y(i+46) < WristEx3_SD && WristEx3_y(i+47) < WristEx3_SD && WristEx3_y(i+48) < WristEx3_SD...
        && WristEx3_y(i+49) < WristEx3_SD 
    
    
    
    WristEx3_Offset_Index = i;
    break
else 
    WristEx3_Offset_Index = NaN;
end
 end
 
 if ~isnan(WristEx3_Offset_Index)
WristEx3_Offset_time = WristEx3_x(WristEx3_Offset_Index);   %putting it in WristEx time domain
else
    WristEx3_Offset_time = NaN;
%[~, WristEx_trial] =  min(abs(Elbow - WristEx_trial));  % finding the nearest corresponding time from WristEx time domain to Elbow time domain
 end
end

% WristEx_Offset = [WristEx_Offset_time; WristEx2_Offset_time; WristEx3_Offset_time];
WristEx_Offset = WristEx3_Offset_time;
%% Offset from Marker
if isnan(WristEx3_Onset_Index) 
    WristEx3_FMO_Index = Inf;
    WristEx3_FMO_time = Inf;
%     break
 else
try
for i = WristEx3_Marker_end:(length(WristEx3_y)-20)


if WristEx3_y(i) < WristEx3_SD && WristEx3_y(i+1) < WristEx3_SD && WristEx3_y(i+2) < WristEx3_SD && WristEx3_y(i+3) < WristEx3_SD && WristEx3_y(i+4) < WristEx3_SD && WristEx3_y(i+5) < WristEx3_SD && WristEx3_y(i+6) < WristEx3_SD...
        && WristEx3_y(i+7) < WristEx3_SD && WristEx3_y(i+8) < WristEx3_SD && WristEx3_y(i+9) < WristEx3_SD && WristEx3_y(i+10) < WristEx3_SD...
        && WristEx3_y(i+11) < WristEx3_SD && WristEx3_y(i+12) < WristEx3_SD && WristEx3_y(i+13) < WristEx3_SD && WristEx3_y(i+14) < WristEx3_SD...
        && WristEx3_y(i+15) < WristEx3_SD && WristEx3_y(i+16) < WristEx3_SD && WristEx3_y(i+17) < WristEx3_SD && WristEx3_y(i+18) < WristEx3_SD...
        && WristEx3_y(i+19) < WristEx3_SD && WristEx3_y(i+20) < WristEx3_SD...
        && WristEx3_y(i+21) < WristEx3_SD && WristEx3_y(i+22) < WristEx3_SD && WristEx3_y(i+23) < WristEx3_SD && WristEx3_y(i+24) < WristEx3_SD...
        && WristEx3_y(i+25) < WristEx3_SD && WristEx3_y(i+26) < WristEx3_SD && WristEx3_y(i+27) < WristEx3_SD && WristEx3_y(i+28) < WristEx3_SD...
        && WristEx3_y(i+29) < WristEx3_SD && WristEx3_y(i+30) < WristEx3_SD && WristEx3_y(i+31) < WristEx3_SD && WristEx3_y(i+32) < WristEx3_SD...
        && WristEx3_y(i+33) < WristEx3_SD && WristEx3_y(i+34) < WristEx3_SD && WristEx3_y(i+35) < WristEx3_SD && WristEx3_y(i+36) < WristEx3_SD...
        && WristEx3_y(i+37) < WristEx3_SD && WristEx3_y(i+38) < WristEx3_SD && WristEx3_y(i+39) < WristEx3_SD && WristEx3_y(i+40) < WristEx3_SD...
        && WristEx3_y(i+41) < WristEx3_SD && WristEx3_y(i+42) < WristEx3_SD && WristEx3_y(i+43) < WristEx3_SD && WristEx3_y(i+44) < WristEx3_SD...
        && WristEx3_y(i+45) < WristEx3_SD && WristEx3_y(i+46) < WristEx3_SD && WristEx3_y(i+47) < WristEx3_SD && WristEx3_y(i+48) < WristEx3_SD...
        && WristEx3_y(i+49) < WristEx3_SD 
    
    
    WristEx3_FMO_Index = i;
    break
else 
    WristEx3_FMO_Index = NaN;
end
 end
 catch
  WristEx3_FMO_Index = NaN;
end
 if ~isnan(WristEx3_FMO_Index)
WristEx3_FMO_time = WristEx3_x(WristEx3_FMO_Index);   %putting it in WristEx time domain
else
    WristEx3_FMO_time = NaN;
%[~, WristEx_trial] =  min(abs(Elbow - WristEx_trial));  % finding the nearest corresponding time from WristEx time domain to Elbow time domain
 end
end


% WristEx_FMO = [WristEx_FMO_time; WristEx2_FMO_time; WristEx3_FMO_time];
WristEx_FMO = WristEx3_FMO_time;


%% WristEx From Marker Times Code
% [~, WristEx3_Marker_ind] =  min(abs(WristEx3_x - Marker_start_time));  % finding the nearest corresponding time from WristEx time domain to Elbow time domain
% 
% [~, WristEx3_Marker_end] =  min(abs(WristEx3_x - Marker_end_time)); 
% 
% [~, WristEx3_pre] =  min(abs(WristEx3_x - TFx_pre));
% 
% [~, WristEx3_post] =  min(abs(WristEx3_x - TFx_post));

WristEx_trial_mean = mean(WristEx3_y(WristEx3_Marker_ind:WristEx3_Marker_end-1));

WristEx_pretrial_mean = mean(WristEx3_y(WristEx3_Marker_ind-dur:WristEx3_Marker_ind-1));

%WristEx_pretrial_mean = mean(WristEx3_y(1:WristEx3_Marker_ind-1)); %to use when not 5 sec pre

WristEx_posttrial_mean = mean(WristEx3_y(WristEx3_Marker_end:WristEx3_Marker_end+dur-1));

%WristEx_posttrial_mean = mean(WristEx3_y(WristEx3_Marker_end:end)); %to use when not 5 sec post

[WristEx_peak, WristEx_peak_ind] = max(WristEx3_y(WristEx3_Marker_ind:WristEx3_Marker_end-1));




 WristEx_trial_time = (WristEx3_x(WristEx3_Marker_end) - WristEx3_x(WristEx3_Marker_ind));
% 
% %WristEx_times = [(WristEx3_x(WristEx3_Marker_ind) - WristEx3_x(1)),WristEx_trial_time, (WristEx3_x(WristEx3_Marker_end+dur-1)- WristEx3_x(WristEx3_Marker_end))]; %pre < 5 
% 
% WristEx_times = [(WristEx3_x(WristEx3_Marker_ind-1)- WristEx3_x(WristEx3_Marker_ind-dur)),WristEx_trial_time, WristEx3_x(end) - WristEx3_x(WristEx3_Marker_end)]; %post < 5 

% WristEx_Contribution = (WristEx_trial_mean/Total_EMG_Mean)*100;
% 
% WristEx_Outcomes = [WristEx_pretrial_mean, WristEx_trial_mean, WristEx_posttrial_mean, WristEx_peak, WristEx_Contribution];
% 


