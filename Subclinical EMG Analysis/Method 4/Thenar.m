%% 
%%%%%%%%%%%%%%%%%%%%%need to conert everything to muscle ind. prob easier
%%%%%%%%%%%%%%%%%%%%%to make functions
[~, Thenar3_Marker_ind] =  min(abs(Thenar3_x - Marker_start_time));  % finding the nearest corresponding time from Thenar time domain to Elbow time domain

[~, Thenar3_Marker_end] =  min(abs(Thenar3_x - Marker_end_time)); 

[~, Thenar3_Pre] =  min(abs(Thenar3_x - TFx_pre)); 
%Thenar_trial = Thenar1_x(Thenar_Marker_ind);
[~, Thenar3_post] =  min(abs(Thenar3_x - TFx_post));

Thenar3_STD = std(Thenar3_y(Thenar3_Pre-1:Thenar3_Marker_ind-1));
Thenar3_baseline_avg = mean(Thenar3_y(Thenar3_Pre-1:Thenar3_Marker_ind-1));
Thenar3_SD = Thenar3_baseline_avg + (Thenar3_STD*3);


for i = Thenar3_Marker_ind:Thenar3_Marker_end
if Thenar3_y(i) > Thenar3_SD && Thenar3_y(i+1) > Thenar3_SD && Thenar3_y(i+2) > Thenar3_SD && Thenar3_y(i+3) > Thenar3_SD && Thenar3_y(i+4) > Thenar3_SD && Thenar3_y(i+5) > Thenar3_SD && Thenar3_y(i+6) > Thenar3_SD...
        && Thenar3_y(i+7) > Thenar3_SD && Thenar3_y(i+8) > Thenar3_SD && Thenar3_y(i+9) > Thenar3_SD && Thenar3_y(i+10) > Thenar3_SD...
        && Thenar3_y(i+11) > Thenar3_SD && Thenar3_y(i+12) > Thenar3_SD && Thenar3_y(i+13) > Thenar3_SD && Thenar3_y(i+14) > Thenar3_SD...
        && Thenar3_y(i+15) > Thenar3_SD && Thenar3_y(i+16) > Thenar3_SD && Thenar3_y(i+17) > Thenar3_SD && Thenar3_y(i+18) > Thenar3_SD...
        && Thenar3_y(i+19) > Thenar3_SD && Thenar3_y(i+20) > Thenar3_SD...
        && Thenar3_y(i+21) > Thenar3_SD && Thenar3_y(i+22) > Thenar3_SD && Thenar3_y(i+23) > Thenar3_SD && Thenar3_y(i+24) > Thenar3_SD...
        && Thenar3_y(i+25) > Thenar3_SD && Thenar3_y(i+26) > Thenar3_SD && Thenar3_y(i+27) > Thenar3_SD && Thenar3_y(i+28) > Thenar3_SD...
        && Thenar3_y(i+29) > Thenar3_SD && Thenar3_y(i+30) > Thenar3_SD && Thenar3_y(i+31) > Thenar3_SD && Thenar3_y(i+32) > Thenar3_SD...
        && Thenar3_y(i+33) > Thenar3_SD && Thenar3_y(i+34) > Thenar3_SD && Thenar3_y(i+35) > Thenar3_SD && Thenar3_y(i+36) > Thenar3_SD...
        && Thenar3_y(i+37) > Thenar3_SD && Thenar3_y(i+38) > Thenar3_SD && Thenar3_y(i+39) > Thenar3_SD && Thenar3_y(i+40) > Thenar3_SD...
        && Thenar3_y(i+41) > Thenar3_SD && Thenar3_y(i+42) > Thenar3_SD && Thenar3_y(i+43) > Thenar3_SD && Thenar3_y(i+44) > Thenar3_SD...
        && Thenar3_y(i+45) > Thenar3_SD && Thenar3_y(i+46) > Thenar3_SD && Thenar3_y(i+47) > Thenar3_SD && Thenar3_y(i+48) > Thenar3_SD...
        && Thenar3_y(i+49) > Thenar3_SD
   
   
    Thenar3_Onset_Index = i;
    break
else 
    Thenar3_Onset_Index = NaN;
end
end

if ~isnan(Thenar3_Onset_Index)
Thenar3_onset_time = Thenar3_x(Thenar3_Onset_Index);   %putting it in Thenar time domain
else
    Thenar3_onset_time = NaN;
%[~, Thenar_trial] =  min(abs(Elbow - Thenar_trial));  % finding the nearest corresponding time from Thenar time domain to Elbow time domain
end
% if length(Thenar_trial) ~= 1
%   Thenar_trial(2) = [];
% end
% Thenar_Onset = [Thenar1_onset_time; Thenar2_onset_time; Thenar3_onset_time];
Thenar_Onset = Thenar3_onset_time;

%% Offset

 if isnan(Thenar3_Onset_Index) 
    Thenar3_Offset_Index = Inf;
    Thenar3_Offset_time = Inf;
%     break
 else
for i = Thenar3_Onset_Index:Thenar3_Marker_end

if Thenar3_y(i) < Thenar3_SD && Thenar3_y(i+1) < Thenar3_SD && Thenar3_y(i+2) < Thenar3_SD && Thenar3_y(i+3) < Thenar3_SD && Thenar3_y(i+4) < Thenar3_SD && Thenar3_y(i+5) < Thenar3_SD && Thenar3_y(i+6) < Thenar3_SD...
        && Thenar3_y(i+7) < Thenar3_SD && Thenar3_y(i+8) < Thenar3_SD && Thenar3_y(i+9) < Thenar3_SD && Thenar3_y(i+10) < Thenar3_SD...
        && Thenar3_y(i+11) < Thenar3_SD && Thenar3_y(i+12) < Thenar3_SD && Thenar3_y(i+13) < Thenar3_SD && Thenar3_y(i+14) < Thenar3_SD...
        && Thenar3_y(i+15) < Thenar3_SD && Thenar3_y(i+16) < Thenar3_SD && Thenar3_y(i+17) < Thenar3_SD && Thenar3_y(i+18) < Thenar3_SD...
        && Thenar3_y(i+19) < Thenar3_SD && Thenar3_y(i+20) < Thenar3_SD...
        && Thenar3_y(i+21) < Thenar3_SD && Thenar3_y(i+22) < Thenar3_SD && Thenar3_y(i+23) < Thenar3_SD && Thenar3_y(i+24) < Thenar3_SD...
        && Thenar3_y(i+25) < Thenar3_SD && Thenar3_y(i+26) < Thenar3_SD && Thenar3_y(i+27) < Thenar3_SD && Thenar3_y(i+28) < Thenar3_SD...
        && Thenar3_y(i+29) < Thenar3_SD && Thenar3_y(i+30) < Thenar3_SD && Thenar3_y(i+31) < Thenar3_SD && Thenar3_y(i+32) < Thenar3_SD...
        && Thenar3_y(i+33) < Thenar3_SD && Thenar3_y(i+34) < Thenar3_SD && Thenar3_y(i+35) < Thenar3_SD && Thenar3_y(i+36) < Thenar3_SD...
        && Thenar3_y(i+37) < Thenar3_SD && Thenar3_y(i+38) < Thenar3_SD && Thenar3_y(i+39) < Thenar3_SD && Thenar3_y(i+40) < Thenar3_SD...
        && Thenar3_y(i+41) < Thenar3_SD && Thenar3_y(i+42) < Thenar3_SD && Thenar3_y(i+43) < Thenar3_SD && Thenar3_y(i+44) < Thenar3_SD...
        && Thenar3_y(i+45) < Thenar3_SD && Thenar3_y(i+46) < Thenar3_SD && Thenar3_y(i+47) < Thenar3_SD && Thenar3_y(i+48) < Thenar3_SD...
        && Thenar3_y(i+49) < Thenar3_SD 
    
    
    
    Thenar3_Offset_Index = i;
    break
else 
    Thenar3_Offset_Index = NaN;
end
 end
 
 if ~isnan(Thenar3_Offset_Index)
Thenar3_Offset_time = Thenar3_x(Thenar3_Offset_Index);   %putting it in Thenar time domain
else
    Thenar3_Offset_time = NaN;
%[~, Thenar_trial] =  min(abs(Elbow - Thenar_trial));  % finding the nearest corresponding time from Thenar time domain to Elbow time domain
 end
end

% Thenar_Offset = [Thenar1_Offset_time; Thenar2_Offset_time; Thenar3_Offset_time];
Thenar_Offset = Thenar3_Offset_time;

%% Offset from Marker

if isnan(Thenar3_Onset_Index) 
    Thenar3_FMO_Index = Inf;
    Thenar3_FMO_time = Inf;
%     break
 else
try
for i = Thenar3_Marker_end:(length(Thenar3_y)-20)


if Thenar3_y(i) < Thenar3_SD && Thenar3_y(i+1) < Thenar3_SD && Thenar3_y(i+2) < Thenar3_SD && Thenar3_y(i+3) < Thenar3_SD && Thenar3_y(i+4) < Thenar3_SD && Thenar3_y(i+5) < Thenar3_SD && Thenar3_y(i+6) < Thenar3_SD...
        && Thenar3_y(i+7) < Thenar3_SD && Thenar3_y(i+8) < Thenar3_SD && Thenar3_y(i+9) < Thenar3_SD && Thenar3_y(i+10) < Thenar3_SD...
        && Thenar3_y(i+11) < Thenar3_SD && Thenar3_y(i+12) < Thenar3_SD && Thenar3_y(i+13) < Thenar3_SD && Thenar3_y(i+14) < Thenar3_SD...
        && Thenar3_y(i+15) < Thenar3_SD && Thenar3_y(i+16) < Thenar3_SD && Thenar3_y(i+17) < Thenar3_SD && Thenar3_y(i+18) < Thenar3_SD...
        && Thenar3_y(i+19) < Thenar3_SD && Thenar3_y(i+20) < Thenar3_SD...
        && Thenar3_y(i+21) < Thenar3_SD && Thenar3_y(i+22) < Thenar3_SD && Thenar3_y(i+23) < Thenar3_SD && Thenar3_y(i+24) < Thenar3_SD...
        && Thenar3_y(i+25) < Thenar3_SD && Thenar3_y(i+26) < Thenar3_SD && Thenar3_y(i+27) < Thenar3_SD && Thenar3_y(i+28) < Thenar3_SD...
        && Thenar3_y(i+29) < Thenar3_SD && Thenar3_y(i+30) < Thenar3_SD && Thenar3_y(i+31) < Thenar3_SD && Thenar3_y(i+32) < Thenar3_SD...
        && Thenar3_y(i+33) < Thenar3_SD && Thenar3_y(i+34) < Thenar3_SD && Thenar3_y(i+35) < Thenar3_SD && Thenar3_y(i+36) < Thenar3_SD...
        && Thenar3_y(i+37) < Thenar3_SD && Thenar3_y(i+38) < Thenar3_SD && Thenar3_y(i+39) < Thenar3_SD && Thenar3_y(i+40) < Thenar3_SD...
        && Thenar3_y(i+41) < Thenar3_SD && Thenar3_y(i+42) < Thenar3_SD && Thenar3_y(i+43) < Thenar3_SD && Thenar3_y(i+44) < Thenar3_SD...
        && Thenar3_y(i+45) < Thenar3_SD && Thenar3_y(i+46) < Thenar3_SD && Thenar3_y(i+47) < Thenar3_SD && Thenar3_y(i+48) < Thenar3_SD...
        && Thenar3_y(i+49) < Thenar3_SD 
    
    
    Thenar3_FMO_Index = i;
    break
else 
    Thenar3_FMO_Index = NaN;
end
 end
 catch
  Thenar3_FMO_Index = NaN;
end
 if ~isnan(Thenar3_FMO_Index)
Thenar3_FMO_time = Thenar3_x(Thenar3_FMO_Index);   %putting it in Thenar time domain
else
    Thenar3_FMO_time = NaN;
%[~, Thenar_trial] =  min(abs(Elbow - Thenar_trial));  % finding the nearest corresponding time from Thenar time domain to Elbow time domain
 end
end


% Thenar_FMO = [Thenar1_FMO_time; Thenar2_FMO_time; Thenar3_FMO_time];
Thenar_FMO = Thenar3_FMO_time;

%% Thenar From Marker Times Code
% [~, Thenar3_Marker_ind] =  min(abs(Thenar3_x - Marker_start_time));  % finding the nearest corresponding time from Thenar time domain to Elbow time domain
% 
% [~, Thenar3_Marker_end] =  min(abs(Thenar3_x - Marker_end_time)); 
% 
% [~, Thenar3_pre] =  min(abs(Thenar3_x - TFx_pre));
% 
% [~, Thenar3_post] =  min(abs(Thenar3_x - TFx_post));
% 
Thenar_trial_mean = mean(Thenar3_y(Thenar3_Marker_ind:Thenar3_Marker_end-1));

Thenar_pretrial_mean = mean(Thenar3_y(Thenar3_Marker_ind-dur:Thenar3_Marker_ind-1));
% 
% Thenar_pretrial_mean = mean(Thenar3_y(1:Thenar3_Marker_ind-1)); %to use when not 5 sec pre
% 
Thenar_posttrial_mean = mean(Thenar3_y(Thenar3_Marker_end:Thenar3_Marker_end+dur-1));
% 
%Thenar_posttrial_mean = mean(Thenar3_y(Thenar3_Marker_end:end)); %to use when not 5 sec post

[Thenar_peak, Thenar_peak_ind] = max(Thenar3_y(Thenar3_Marker_ind:Thenar3_Marker_end-1));




 Thenar_trial_time = (Thenar3_x(Thenar3_Marker_end) - Thenar3_x(Thenar3_Marker_ind));
% 
%Thenar_times = [(Thenar3_x(Thenar3_Marker_ind) - Thenar3_x(1)),Thenar_trial_time, (Thenar3_x(Thenar3_Marker_end+dur-1)- Thenar3_x(Thenar3_Marker_end))]; %pre < 5 
% 
% Thenar_times = [(Thenar3_x(Thenar3_Marker_ind-1)- Thenar3_x(Thenar3_Marker_ind-dur)),Thenar_trial_time, Thenar3_x(end) - Thenar3_x(Thenar3_Marker_end)]; %post < 5 

% Thenar_Contribution = (Thenar_trial_mean/Total_EMG_Mean)*100;
% 
% Thenar_Outcomes = [Thenar_pretrial_mean, Thenar_trial_mean, Thenar_posttrial_mean, Thenar_peak, Thenar_Contribution];
% 
%



