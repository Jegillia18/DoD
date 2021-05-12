%% 
%%%%%%%%%%%%%%%%%%%%%need to conert everything to muscle ind. prob easier
%%%%%%%%%%%%%%%%%%%%%to make functions
[~, Hypothenar3_Marker_ind] =  min(abs(Hypothenar3_x - Marker_start_time));  % finding the nearest corresponding time from Hypothenar time domain to Elbow time domain

[~, Hypothenar3_Marker_end] =  min(abs(Hypothenar3_x - Marker_end_time)); 

[~, Hypothenar3_Pre] =  min(abs(Hypothenar3_x - TFx_pre)); 
%Hypothenar_trial = Hypothenar1_x(Hypothenar_Marker_ind);
[~, Hypothenar3_post] =  min(abs(Hypothenar3_x - TFx_post));

Hypothenar3_STD = std(Hypothenar3_y(Hypothenar3_Pre-1:Hypothenar3_Marker_ind-1));
Hypothenar3_baseline_avg = mean(Hypothenar3_y(Hypothenar3_Pre-1:Hypothenar3_Marker_ind-1));
Hypothenar3_SD = Hypothenar3_baseline_avg + (Hypothenar3_STD*3);


for i = Hypothenar3_Marker_ind:Hypothenar3_Marker_end
if Hypothenar3_y(i) > Hypothenar3_SD && Hypothenar3_y(i+1) > Hypothenar3_SD && Hypothenar3_y(i+2) > Hypothenar3_SD && Hypothenar3_y(i+3) > Hypothenar3_SD && Hypothenar3_y(i+4) > Hypothenar3_SD && Hypothenar3_y(i+5) > Hypothenar3_SD && Hypothenar3_y(i+6) > Hypothenar3_SD...
        && Hypothenar3_y(i+7) > Hypothenar3_SD && Hypothenar3_y(i+8) > Hypothenar3_SD && Hypothenar3_y(i+9) > Hypothenar3_SD && Hypothenar3_y(i+10) > Hypothenar3_SD...
        && Hypothenar3_y(i+11) > Hypothenar3_SD && Hypothenar3_y(i+12) > Hypothenar3_SD && Hypothenar3_y(i+13) > Hypothenar3_SD && Hypothenar3_y(i+14) > Hypothenar3_SD...
        && Hypothenar3_y(i+15) > Hypothenar3_SD && Hypothenar3_y(i+16) > Hypothenar3_SD && Hypothenar3_y(i+17) > Hypothenar3_SD && Hypothenar3_y(i+18) > Hypothenar3_SD...
        && Hypothenar3_y(i+19) > Hypothenar3_SD && Hypothenar3_y(i+20) > Hypothenar3_SD...
        && Hypothenar3_y(i+21) > Hypothenar3_SD && Hypothenar3_y(i+22) > Hypothenar3_SD && Hypothenar3_y(i+23) > Hypothenar3_SD && Hypothenar3_y(i+24) > Hypothenar3_SD...
        && Hypothenar3_y(i+25) > Hypothenar3_SD && Hypothenar3_y(i+26) > Hypothenar3_SD && Hypothenar3_y(i+27) > Hypothenar3_SD && Hypothenar3_y(i+28) > Hypothenar3_SD...
        && Hypothenar3_y(i+29) > Hypothenar3_SD && Hypothenar3_y(i+30) > Hypothenar3_SD && Hypothenar3_y(i+31) > Hypothenar3_SD && Hypothenar3_y(i+32) > Hypothenar3_SD...
        && Hypothenar3_y(i+33) > Hypothenar3_SD && Hypothenar3_y(i+34) > Hypothenar3_SD && Hypothenar3_y(i+35) > Hypothenar3_SD && Hypothenar3_y(i+36) > Hypothenar3_SD...
        && Hypothenar3_y(i+37) > Hypothenar3_SD && Hypothenar3_y(i+38) > Hypothenar3_SD && Hypothenar3_y(i+39) > Hypothenar3_SD && Hypothenar3_y(i+40) > Hypothenar3_SD...
        && Hypothenar3_y(i+41) > Hypothenar3_SD && Hypothenar3_y(i+42) > Hypothenar3_SD && Hypothenar3_y(i+43) > Hypothenar3_SD && Hypothenar3_y(i+44) > Hypothenar3_SD...
        && Hypothenar3_y(i+45) > Hypothenar3_SD && Hypothenar3_y(i+46) > Hypothenar3_SD && Hypothenar3_y(i+47) > Hypothenar3_SD && Hypothenar3_y(i+48) > Hypothenar3_SD...
        && Hypothenar3_y(i+49) > Hypothenar3_SD
   
   
    Hypothenar3_Onset_Index = i;
    break
else 
    Hypothenar3_Onset_Index = NaN;
end
end

if ~isnan(Hypothenar3_Onset_Index)
Hypothenar3_onset_time = Hypothenar3_x(Hypothenar3_Onset_Index);   %putting it in Hypothenar time domain
else
    Hypothenar3_onset_time = NaN;
%[~, Hypothenar_trial] =  min(abs(Elbow - Hypothenar_trial));  % finding the nearest corresponding time from Hypothenar time domain to Elbow time domain
end
% if length(Hypothenar_trial) ~= 1
%   Hypothenar_trial(2) = [];
% end
% Hypothenar_Onset = [Hypothenar1_onset_time; Hypothenar2_onset_time; Hypothenar3_onset_time];
Hypothenar_Onset = Hypothenar3_onset_time;

%% Offset
 if isnan(Hypothenar3_Onset_Index) 
    Hypothenar3_Offset_Index = Inf;
    Hypothenar3_Offset_time = Inf;
%     break
 else
for i = Hypothenar3_Onset_Index:Hypothenar3_Marker_end

if Hypothenar3_y(i) < Hypothenar3_SD && Hypothenar3_y(i+1) < Hypothenar3_SD && Hypothenar3_y(i+2) < Hypothenar3_SD && Hypothenar3_y(i+3) < Hypothenar3_SD && Hypothenar3_y(i+4) < Hypothenar3_SD && Hypothenar3_y(i+5) < Hypothenar3_SD && Hypothenar3_y(i+6) < Hypothenar3_SD...
        && Hypothenar3_y(i+7) < Hypothenar3_SD && Hypothenar3_y(i+8) < Hypothenar3_SD && Hypothenar3_y(i+9) < Hypothenar3_SD && Hypothenar3_y(i+10) < Hypothenar3_SD...
        && Hypothenar3_y(i+11) < Hypothenar3_SD && Hypothenar3_y(i+12) < Hypothenar3_SD && Hypothenar3_y(i+13) < Hypothenar3_SD && Hypothenar3_y(i+14) < Hypothenar3_SD...
        && Hypothenar3_y(i+15) < Hypothenar3_SD && Hypothenar3_y(i+16) < Hypothenar3_SD && Hypothenar3_y(i+17) < Hypothenar3_SD && Hypothenar3_y(i+18) < Hypothenar3_SD...
        && Hypothenar3_y(i+19) < Hypothenar3_SD && Hypothenar3_y(i+20) < Hypothenar3_SD...
        && Hypothenar3_y(i+21) < Hypothenar3_SD && Hypothenar3_y(i+22) < Hypothenar3_SD && Hypothenar3_y(i+23) < Hypothenar3_SD && Hypothenar3_y(i+24) < Hypothenar3_SD...
        && Hypothenar3_y(i+25) < Hypothenar3_SD && Hypothenar3_y(i+26) < Hypothenar3_SD && Hypothenar3_y(i+27) < Hypothenar3_SD && Hypothenar3_y(i+28) < Hypothenar3_SD...
        && Hypothenar3_y(i+29) < Hypothenar3_SD && Hypothenar3_y(i+30) < Hypothenar3_SD && Hypothenar3_y(i+31) < Hypothenar3_SD && Hypothenar3_y(i+32) < Hypothenar3_SD...
        && Hypothenar3_y(i+33) < Hypothenar3_SD && Hypothenar3_y(i+34) < Hypothenar3_SD && Hypothenar3_y(i+35) < Hypothenar3_SD && Hypothenar3_y(i+36) < Hypothenar3_SD...
        && Hypothenar3_y(i+37) < Hypothenar3_SD && Hypothenar3_y(i+38) < Hypothenar3_SD && Hypothenar3_y(i+39) < Hypothenar3_SD && Hypothenar3_y(i+40) < Hypothenar3_SD...
        && Hypothenar3_y(i+41) < Hypothenar3_SD && Hypothenar3_y(i+42) < Hypothenar3_SD && Hypothenar3_y(i+43) < Hypothenar3_SD && Hypothenar3_y(i+44) < Hypothenar3_SD...
        && Hypothenar3_y(i+45) < Hypothenar3_SD && Hypothenar3_y(i+46) < Hypothenar3_SD && Hypothenar3_y(i+47) < Hypothenar3_SD && Hypothenar3_y(i+48) < Hypothenar3_SD...
        && Hypothenar3_y(i+49) < Hypothenar3_SD 
    
    
    
    Hypothenar3_Offset_Index = i;
    break
else 
    Hypothenar3_Offset_Index = NaN;
end
 end
 
 if ~isnan(Hypothenar3_Offset_Index)
Hypothenar3_Offset_time = Hypothenar3_x(Hypothenar3_Offset_Index);   %putting it in Hypothenar time domain
else
    Hypothenar3_Offset_time = NaN;
%[~, Hypothenar_trial] =  min(abs(Elbow - Hypothenar_trial));  % finding the nearest corresponding time from Hypothenar time domain to Elbow time domain
 end
end

% Hypothenar_Offset = [Hypothenar1_Offset_time; Hypothenar2_Offset_time; Hypothenar3_Offset_time];
Hypothenar_Offset = Hypothenar3_Offset_time;
%% Offset from Marker

if isnan(Hypothenar3_Onset_Index) 
    Hypothenar3_FMO_Index = Inf;
    Hypothenar3_FMO_time = Inf;
%     break
 else
try
for i = Hypothenar3_Marker_end:(length(Hypothenar3_y)-20)


if Hypothenar3_y(i) < Hypothenar3_SD && Hypothenar3_y(i+1) < Hypothenar3_SD && Hypothenar3_y(i+2) < Hypothenar3_SD && Hypothenar3_y(i+3) < Hypothenar3_SD && Hypothenar3_y(i+4) < Hypothenar3_SD && Hypothenar3_y(i+5) < Hypothenar3_SD && Hypothenar3_y(i+6) < Hypothenar3_SD...
        && Hypothenar3_y(i+7) < Hypothenar3_SD && Hypothenar3_y(i+8) < Hypothenar3_SD && Hypothenar3_y(i+9) < Hypothenar3_SD && Hypothenar3_y(i+10) < Hypothenar3_SD...
        && Hypothenar3_y(i+11) < Hypothenar3_SD && Hypothenar3_y(i+12) < Hypothenar3_SD && Hypothenar3_y(i+13) < Hypothenar3_SD && Hypothenar3_y(i+14) < Hypothenar3_SD...
        && Hypothenar3_y(i+15) < Hypothenar3_SD && Hypothenar3_y(i+16) < Hypothenar3_SD && Hypothenar3_y(i+17) < Hypothenar3_SD && Hypothenar3_y(i+18) < Hypothenar3_SD...
        && Hypothenar3_y(i+19) < Hypothenar3_SD && Hypothenar3_y(i+20) < Hypothenar3_SD...
        && Hypothenar3_y(i+21) < Hypothenar3_SD && Hypothenar3_y(i+22) < Hypothenar3_SD && Hypothenar3_y(i+23) < Hypothenar3_SD && Hypothenar3_y(i+24) < Hypothenar3_SD...
        && Hypothenar3_y(i+25) < Hypothenar3_SD && Hypothenar3_y(i+26) < Hypothenar3_SD && Hypothenar3_y(i+27) < Hypothenar3_SD && Hypothenar3_y(i+28) < Hypothenar3_SD...
        && Hypothenar3_y(i+29) < Hypothenar3_SD && Hypothenar3_y(i+30) < Hypothenar3_SD && Hypothenar3_y(i+31) < Hypothenar3_SD && Hypothenar3_y(i+32) < Hypothenar3_SD...
        && Hypothenar3_y(i+33) < Hypothenar3_SD && Hypothenar3_y(i+34) < Hypothenar3_SD && Hypothenar3_y(i+35) < Hypothenar3_SD && Hypothenar3_y(i+36) < Hypothenar3_SD...
        && Hypothenar3_y(i+37) < Hypothenar3_SD && Hypothenar3_y(i+38) < Hypothenar3_SD && Hypothenar3_y(i+39) < Hypothenar3_SD && Hypothenar3_y(i+40) < Hypothenar3_SD...
        && Hypothenar3_y(i+41) < Hypothenar3_SD && Hypothenar3_y(i+42) < Hypothenar3_SD && Hypothenar3_y(i+43) < Hypothenar3_SD && Hypothenar3_y(i+44) < Hypothenar3_SD...
        && Hypothenar3_y(i+45) < Hypothenar3_SD && Hypothenar3_y(i+46) < Hypothenar3_SD && Hypothenar3_y(i+47) < Hypothenar3_SD && Hypothenar3_y(i+48) < Hypothenar3_SD...
        && Hypothenar3_y(i+49) < Hypothenar3_SD 
    
    
    Hypothenar3_FMO_Index = i;
    break
else 
    Hypothenar3_FMO_Index = NaN;
end
 end
catch
   Hypothenar3_FMO_Index = NaN;
end

 if ~isnan(Hypothenar3_FMO_Index)
Hypothenar3_FMO_time = Hypothenar3_x(Hypothenar3_FMO_Index);   %putting it in Hypothenar time domain
else
    Hypothenar3_FMO_time = NaN;
%[~, Hypothenar_trial] =  min(abs(Elbow - Hypothenar_trial));  % finding the nearest corresponding time from Hypothenar time domain to Elbow time domain
 end
end


% Hypothenar_FMO = [Hypothenar1_FMO_time; Hypothenar2_FMO_time; Hypothenar3_FMO_time];
Hypothenar_FMO = Hypothenar3_FMO_time;

%% Hypothenar From Marker Times Code
% [~, Hypothenar3_Marker_ind] =  min(abs(Hypothenar3_x - Marker_start_time));  % finding the nearest corresponding time from Hypothenar time domain to Elbow time domain
% 
% [~, Hypothenar3_Marker_end] =  min(abs(Hypothenar3_x - Marker_end_time)); 
% 
% [~, Hypothenar3_pre] =  min(abs(Hypothenar3_x - TFx_pre));

% [~, Hypothenar3_post] =  min(abs(Hypothenar3_x - TFx_post));

Hypothenar_trial_mean = mean(Hypothenar3_y(Hypothenar3_Marker_ind:Hypothenar3_Marker_end-1));

Hypothenar_pretrial_mean = mean(Hypothenar3_y(Hypothenar3_Marker_ind-dur:Hypothenar3_Marker_ind-1));

%Hypothenar_pretrial_mean = mean(Hypothenar3_y(1:Hypothenar3_Marker_ind-1)); %to use when not 5 sec pre

Hypothenar_posttrial_mean = mean(Hypothenar3_y(Hypothenar3_Marker_end:Hypothenar3_Marker_end+dur-1));

%Hypothenar_posttrial_mean = mean(Hypothenar3_y(Hypothenar3_Marker_end:end)); %to use when not 5 sec post

[Hypothenar_peak, Hypothenar_peak_ind] = max(Hypothenar3_y(Hypothenar3_Marker_ind:Hypothenar3_Marker_end-1));




 Hypothenar_trial_time = (Hypothenar3_x(Hypothenar3_Marker_end) - Hypothenar3_x(Hypothenar3_Marker_ind));
% 
% %Hypothenar_times = [(Hypothenar3_x(Hypothenar3_Marker_ind) - Hypothenar3_x(1)),Hypothenar_trial_time, (Hypothenar3_x(Hypothenar3_Marker_end+dur-1)- Hypothenar3_x(Hypothenar3_Marker_end))]; %pre < 5 
% 
% Hypothenar_times = [(Hypothenar3_x(Hypothenar3_Marker_ind-1)- Hypothenar3_x(Hypothenar3_Marker_ind-dur)),Hypothenar_trial_time, Hypothenar3_x(end) - Hypothenar3_x(Hypothenar3_Marker_end)]; %post < 5 

% Hypothenar_Contribution = (Hypothenar_trial_mean/Total_EMG_Mean)*100;
% 
% Hypothenar_Outcomes = [Hypothenar_pretrial_mean, Hypothenar_trial_mean, Hypothenar_posttrial_mean, Hypothenar_peak, Hypothenar_Contribution];
% 
 



