%% 
%%%%%%%%%%%%%%%%%%%%%need to conert everything to muscle ind. prob easier
%%%%%%%%%%%%%%%%%%%%%to make functions
[~, Finger3_Marker_ind] =  min(abs(Finger3_x - Marker_start_time));  % finding the nearest corresponding time from Finger time domain to Elbow time domain

[~, Finger3_Marker_end] =  min(abs(Finger3_x - Marker_end_time)); 

[~, Finger3_Pre] =  min(abs(Finger3_x - TFx_pre)); 
%Finger_trial = Finger1_x(Finger_Marker_ind);
 [~, Finger3_post] =  min(abs(Finger3_x - TFx_post));

Finger3_STD = std(Finger3_y(Finger3_Pre-1:Finger3_Marker_ind-1));
Finger3_baseline_avg = mean(Finger3_y(Finger3_Pre-1:Finger3_Marker_ind-1));
Finger3_SD = Finger3_baseline_avg + (Finger3_STD*3);


for i = Finger3_Marker_ind:Finger3_Marker_end
if Finger3_y(i) > Finger3_SD && Finger3_y(i+1) > Finger3_SD && Finger3_y(i+2) > Finger3_SD && Finger3_y(i+3) > Finger3_SD && Finger3_y(i+4) > Finger3_SD && Finger3_y(i+5) > Finger3_SD && Finger3_y(i+6) > Finger3_SD...
        && Finger3_y(i+7) > Finger3_SD && Finger3_y(i+8) > Finger3_SD && Finger3_y(i+9) > Finger3_SD && Finger3_y(i+10) > Finger3_SD...
        && Finger3_y(i+11) > Finger3_SD && Finger3_y(i+12) > Finger3_SD && Finger3_y(i+13) > Finger3_SD && Finger3_y(i+14) > Finger3_SD...
        && Finger3_y(i+15) > Finger3_SD && Finger3_y(i+16) > Finger3_SD && Finger3_y(i+17) > Finger3_SD && Finger3_y(i+18) > Finger3_SD...
        && Finger3_y(i+19) > Finger3_SD && Finger3_y(i+20) > Finger3_SD...
        && Finger3_y(i+21) > Finger3_SD && Finger3_y(i+22) > Finger3_SD && Finger3_y(i+23) > Finger3_SD && Finger3_y(i+24) > Finger3_SD...
        && Finger3_y(i+25) > Finger3_SD && Finger3_y(i+26) > Finger3_SD && Finger3_y(i+27) > Finger3_SD && Finger3_y(i+28) > Finger3_SD...
        && Finger3_y(i+29) > Finger3_SD && Finger3_y(i+30) > Finger3_SD && Finger3_y(i+31) > Finger3_SD && Finger3_y(i+32) > Finger3_SD...
        && Finger3_y(i+33) > Finger3_SD && Finger3_y(i+34) > Finger3_SD && Finger3_y(i+35) > Finger3_SD && Finger3_y(i+36) > Finger3_SD...
        && Finger3_y(i+37) > Finger3_SD && Finger3_y(i+38) > Finger3_SD && Finger3_y(i+39) > Finger3_SD && Finger3_y(i+40) > Finger3_SD...
        && Finger3_y(i+41) > Finger3_SD && Finger3_y(i+42) > Finger3_SD && Finger3_y(i+43) > Finger3_SD && Finger3_y(i+44) > Finger3_SD...
        && Finger3_y(i+45) > Finger3_SD && Finger3_y(i+46) > Finger3_SD && Finger3_y(i+47) > Finger3_SD && Finger3_y(i+48) > Finger3_SD...
        && Finger3_y(i+49) > Finger3_SD
   
   
    Finger3_Onset_Index = i;
    break
else 
    Finger3_Onset_Index = NaN;
end
end

if ~isnan(Finger3_Onset_Index)
Finger3_onset_time = Finger3_x(Finger3_Onset_Index);   %putting it in Finger time domain
else
    Finger3_onset_time = NaN;
%[~, Finger_trial] =  min(abs(Elbow - Finger_trial));  % finding the nearest corresponding time from Finger time domain to Elbow time domain
end
% if length(Finger_trial) ~= 1
%   Finger_trial(2) = [];
% end
% Finger_Onset = [Finger1_onset_time; Finger2_onset_time; Finger3_onset_time];
Finger_Onset = Finger3_onset_time;
%% Offset
 if isnan(Finger3_Onset_Index) 
    Finger3_Offset_Index = Inf;
    Finger3_Offset_time = Inf;
%     break
 else
for i = Finger3_Onset_Index:Finger3_Marker_end

if Finger3_y(i) < Finger3_SD && Finger3_y(i+1) < Finger3_SD && Finger3_y(i+2) < Finger3_SD && Finger3_y(i+3) < Finger3_SD && Finger3_y(i+4) < Finger3_SD && Finger3_y(i+5) < Finger3_SD && Finger3_y(i+6) < Finger3_SD...
        && Finger3_y(i+7) < Finger3_SD && Finger3_y(i+8) < Finger3_SD && Finger3_y(i+9) < Finger3_SD && Finger3_y(i+10) < Finger3_SD...
        && Finger3_y(i+11) < Finger3_SD && Finger3_y(i+12) < Finger3_SD && Finger3_y(i+13) < Finger3_SD && Finger3_y(i+14) < Finger3_SD...
        && Finger3_y(i+15) < Finger3_SD && Finger3_y(i+16) < Finger3_SD && Finger3_y(i+17) < Finger3_SD && Finger3_y(i+18) < Finger3_SD...
        && Finger3_y(i+19) < Finger3_SD && Finger3_y(i+20) < Finger3_SD...
        && Finger3_y(i+21) < Finger3_SD && Finger3_y(i+22) < Finger3_SD && Finger3_y(i+23) < Finger3_SD && Finger3_y(i+24) < Finger3_SD...
        && Finger3_y(i+25) < Finger3_SD && Finger3_y(i+26) < Finger3_SD && Finger3_y(i+27) < Finger3_SD && Finger3_y(i+28) < Finger3_SD...
        && Finger3_y(i+29) < Finger3_SD && Finger3_y(i+30) < Finger3_SD && Finger3_y(i+31) < Finger3_SD && Finger3_y(i+32) < Finger3_SD...
        && Finger3_y(i+33) < Finger3_SD && Finger3_y(i+34) < Finger3_SD && Finger3_y(i+35) < Finger3_SD && Finger3_y(i+36) < Finger3_SD...
        && Finger3_y(i+37) < Finger3_SD && Finger3_y(i+38) < Finger3_SD && Finger3_y(i+39) < Finger3_SD && Finger3_y(i+40) < Finger3_SD...
        && Finger3_y(i+41) < Finger3_SD && Finger3_y(i+42) < Finger3_SD && Finger3_y(i+43) < Finger3_SD && Finger3_y(i+44) < Finger3_SD...
        && Finger3_y(i+45) < Finger3_SD && Finger3_y(i+46) < Finger3_SD && Finger3_y(i+47) < Finger3_SD && Finger3_y(i+48) < Finger3_SD...
        && Finger3_y(i+49) < Finger3_SD 
    
    
    
    Finger3_Offset_Index = i;
    break
else 
    Finger3_Offset_Index = NaN;
end
 end
 
 if ~isnan(Finger3_Offset_Index)
Finger3_Offset_time = Finger3_x(Finger3_Offset_Index);   %putting it in Finger time domain
else
    Finger3_Offset_time = NaN;
%[~, Finger_trial] =  min(abs(Elbow - Finger_trial));  % finding the nearest corresponding time from Finger time domain to Elbow time domain
 end
end

% Finger_Offset = [Finger1_Offset_time; Finger2_Offset_time; Finger3_Offset_time];
Finger_Offset = Finger3_Offset_time;
%% Offset from Marker

if isnan(Finger3_Onset_Index) 
    Finger3_FMO_Index = Inf;
    Finger3_FMO_time = Inf;
%     break
 else
try
for i = Finger3_Marker_end:(length(Finger3_y)-20)


if Finger3_y(i) < Finger3_SD && Finger3_y(i+1) < Finger3_SD && Finger3_y(i+2) < Finger3_SD && Finger3_y(i+3) < Finger3_SD && Finger3_y(i+4) < Finger3_SD && Finger3_y(i+5) < Finger3_SD && Finger3_y(i+6) < Finger3_SD...
        && Finger3_y(i+7) < Finger3_SD && Finger3_y(i+8) < Finger3_SD && Finger3_y(i+9) < Finger3_SD && Finger3_y(i+10) < Finger3_SD...
        && Finger3_y(i+11) < Finger3_SD && Finger3_y(i+12) < Finger3_SD && Finger3_y(i+13) < Finger3_SD && Finger3_y(i+14) < Finger3_SD...
        && Finger3_y(i+15) < Finger3_SD && Finger3_y(i+16) < Finger3_SD && Finger3_y(i+17) < Finger3_SD && Finger3_y(i+18) < Finger3_SD...
        && Finger3_y(i+19) < Finger3_SD && Finger3_y(i+20) < Finger3_SD...
        && Finger3_y(i+21) < Finger3_SD && Finger3_y(i+22) < Finger3_SD && Finger3_y(i+23) < Finger3_SD && Finger3_y(i+24) < Finger3_SD...
        && Finger3_y(i+25) < Finger3_SD && Finger3_y(i+26) < Finger3_SD && Finger3_y(i+27) < Finger3_SD && Finger3_y(i+28) < Finger3_SD...
        && Finger3_y(i+29) < Finger3_SD && Finger3_y(i+30) < Finger3_SD && Finger3_y(i+31) < Finger3_SD && Finger3_y(i+32) < Finger3_SD...
        && Finger3_y(i+33) < Finger3_SD && Finger3_y(i+34) < Finger3_SD && Finger3_y(i+35) < Finger3_SD && Finger3_y(i+36) < Finger3_SD...
        && Finger3_y(i+37) < Finger3_SD && Finger3_y(i+38) < Finger3_SD && Finger3_y(i+39) < Finger3_SD && Finger3_y(i+40) < Finger3_SD...
        && Finger3_y(i+41) < Finger3_SD && Finger3_y(i+42) < Finger3_SD && Finger3_y(i+43) < Finger3_SD && Finger3_y(i+44) < Finger3_SD...
        && Finger3_y(i+45) < Finger3_SD && Finger3_y(i+46) < Finger3_SD && Finger3_y(i+47) < Finger3_SD && Finger3_y(i+48) < Finger3_SD...
        && Finger3_y(i+49) < Finger3_SD 
    
    
    Finger3_FMO_Index = i;
    break
else 
    Finger3_FMO_Index = NaN;
end
 end
 catch
   Finger3_FMO_Index = NaN;
end
 if ~isnan(Finger3_FMO_Index)
Finger3_FMO_time = Finger3_x(Finger3_FMO_Index);   %putting it in Finger time domain
else
    Finger3_FMO_time = NaN;
%[~, Finger_trial] =  min(abs(Elbow - Finger_trial));  % finding the nearest corresponding time from Finger time domain to Elbow time domain
 end
end


% Finger_FMO = [Finger1_FMO_time; Finger2_FMO_time; Finger3_FMO_time];
Finger_FMO = Finger3_FMO_time;

%% Finger From Marker Times Code
% [~, Finger3_Marker_ind] =  min(abs(Finger3_x - Marker_start_time));  % finding the nearest corresponding time from Finger time domain to Elbow time domain
% 
% [~, Finger3_Marker_end] =  min(abs(Finger3_x - Marker_end_time)); 
% 
% [~, Finger3_pre] =  min(abs(Finger3_x - TFx_pre));
% 


Finger_trial_mean = mean(Finger3_y(Finger3_Marker_ind:Finger3_Marker_end-1));

Finger_pretrial_mean = mean(Finger3_y(Finger3_Marker_ind-dur:Finger3_Marker_ind-1));

%Finger_pretrial_mean = mean(Finger3_y(1:Finger3_Marker_ind-1)); %to use when not 5 sec pre

Finger_posttrial_mean = mean(Finger3_y(Finger3_Marker_end:Finger3_Marker_end+dur-1));

%Finger_posttrial_mean = mean(Finger3_y(Finger3_Marker_end:end)); %to use when not 5 sec post

[Finger_peak, Finger_peak_ind] = max(Finger3_y(Finger3_Marker_ind:Finger3_Marker_end-1));



 Finger_trial_time = (Finger3_x(Finger3_Marker_end) - Finger3_x(Finger3_Marker_ind));
% 
% %Finger_times = [(Finger3_x(Finger3_Marker_ind) - Finger3_x(1)),Finger_trial_time, (Finger3_x(Finger3_Marker_end+dur-1)- Finger3_x(Finger3_Marker_end))]; %pre < 5 
% 
% Finger_times = [(Finger3_x(Finger3_Marker_ind-1)- Finger3_x(Finger3_Marker_ind-dur)),Finger_trial_time, Finger3_x(end) - Finger3_x(Finger3_Marker_end)]; %post < 5 
% 
% Finger_Contribution = (Finger_trial_mean/Total_EMG_Mean)*100;
% 
% Finger_Outcomes = [Finger_pretrial_mean, Finger_trial_mean, Finger_posttrial_mean, Finger_peak, Finger_Contribution];
% 




