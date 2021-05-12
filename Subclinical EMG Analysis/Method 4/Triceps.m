%% 
%%%%%%%%%%%%%%%%%%%%%need to conert everything to muscle ind. prob easier
%%%%%%%%%%%%%%%%%%%%%to make functions
[~, Tricep3_Marker_ind] =  min(abs(Tricep3_x - Marker_start_time));  % finding the nearest corresponding time from Tricep time domain to Elbow time domain

[~, Tricep3_Marker_end] =  min(abs(Tricep3_x - Marker_end_time)); 

[~, Tricep3_Pre] =  min(abs(Tricep3_x - TFx_pre)); 
%Tricep_trial = Tricep1_x(Tricep_Marker_ind);
[~, Tricep3_post] =  min(abs(Tricep3_x - TFx_post));


Tricep3_STD = std(Tricep3_y(Tricep3_Pre-1:Tricep3_Marker_ind-1));
Tricep3_baseline_avg = mean(Tricep3_y(Tricep3_Pre-1:Tricep3_Marker_ind-1));
Tricep3_SD = Tricep3_baseline_avg + (Tricep3_STD*3);


for i = Tricep3_Marker_ind:Tricep3_Marker_end
if Tricep3_y(i) > Tricep3_SD && Tricep3_y(i+1) > Tricep3_SD && Tricep3_y(i+2) > Tricep3_SD && Tricep3_y(i+3) > Tricep3_SD && Tricep3_y(i+4) > Tricep3_SD && Tricep3_y(i+5) > Tricep3_SD && Tricep3_y(i+6) > Tricep3_SD...
        && Tricep3_y(i+7) > Tricep3_SD && Tricep3_y(i+8) > Tricep3_SD && Tricep3_y(i+9) > Tricep3_SD && Tricep3_y(i+10) > Tricep3_SD...
        && Tricep3_y(i+11) > Tricep3_SD && Tricep3_y(i+12) > Tricep3_SD && Tricep3_y(i+13) > Tricep3_SD && Tricep3_y(i+14) > Tricep3_SD...
        && Tricep3_y(i+15) > Tricep3_SD && Tricep3_y(i+16) > Tricep3_SD && Tricep3_y(i+17) > Tricep3_SD && Tricep3_y(i+18) > Tricep3_SD...
        && Tricep3_y(i+19) > Tricep3_SD && Tricep3_y(i+20) > Tricep3_SD...
        && Tricep3_y(i+21) > Tricep3_SD && Tricep3_y(i+22) > Tricep3_SD && Tricep3_y(i+23) > Tricep3_SD && Tricep3_y(i+24) > Tricep3_SD...
        && Tricep3_y(i+25) > Tricep3_SD && Tricep3_y(i+26) > Tricep3_SD && Tricep3_y(i+27) > Tricep3_SD && Tricep3_y(i+28) > Tricep3_SD...
        && Tricep3_y(i+29) > Tricep3_SD && Tricep3_y(i+30) > Tricep3_SD && Tricep3_y(i+31) > Tricep3_SD && Tricep3_y(i+32) > Tricep3_SD...
        && Tricep3_y(i+33) > Tricep3_SD && Tricep3_y(i+34) > Tricep3_SD && Tricep3_y(i+35) > Tricep3_SD && Tricep3_y(i+36) > Tricep3_SD...
        && Tricep3_y(i+37) > Tricep3_SD && Tricep3_y(i+38) > Tricep3_SD && Tricep3_y(i+39) > Tricep3_SD && Tricep3_y(i+40) > Tricep3_SD...
        && Tricep3_y(i+41) > Tricep3_SD && Tricep3_y(i+42) > Tricep3_SD && Tricep3_y(i+43) > Tricep3_SD && Tricep3_y(i+44) > Tricep3_SD...
        && Tricep3_y(i+45) > Tricep3_SD && Tricep3_y(i+46) > Tricep3_SD && Tricep3_y(i+47) > Tricep3_SD && Tricep3_y(i+48) > Tricep3_SD...
        && Tricep3_y(i+49) > Tricep3_SD
   
   
    Tricep3_Onset_Index = i;
    break
else 
    Tricep3_Onset_Index = NaN;
end
end

if ~isnan(Tricep3_Onset_Index)
Tricep3_onset_time = Tricep3_x(Tricep3_Onset_Index);   %putting it in Tricep time domain
else
    Tricep3_onset_time = NaN;
%[~, Tricep_trial] =  min(abs(Elbow - Tricep_trial));  % finding the nearest corresponding time from Tricep time domain to Elbow time domain
end
% if length(Tricep_trial) ~= 1
%   Tricep_trial(2) = [];
% end
% Tricep_Onset = [Tricep1_onset_time; Tricep2_onset_time; Tricep3_onset_time];
Tricep_Onset = Tricep3_onset_time;

%% Offset
 if isnan(Tricep3_Onset_Index) 
    Tricep3_Offset_Index = Inf;
    Tricep3_Offset_time = Inf;
%     break
 else
for i = Tricep3_Onset_Index:Tricep3_Marker_end

if Tricep3_y(i) < Tricep3_SD && Tricep3_y(i+1) < Tricep3_SD && Tricep3_y(i+2) < Tricep3_SD && Tricep3_y(i+3) < Tricep3_SD && Tricep3_y(i+4) < Tricep3_SD && Tricep3_y(i+5) < Tricep3_SD && Tricep3_y(i+6) < Tricep3_SD...
        && Tricep3_y(i+7) < Tricep3_SD && Tricep3_y(i+8) < Tricep3_SD && Tricep3_y(i+9) < Tricep3_SD && Tricep3_y(i+10) < Tricep3_SD...
        && Tricep3_y(i+11) < Tricep3_SD && Tricep3_y(i+12) < Tricep3_SD && Tricep3_y(i+13) < Tricep3_SD && Tricep3_y(i+14) < Tricep3_SD...
        && Tricep3_y(i+15) < Tricep3_SD && Tricep3_y(i+16) < Tricep3_SD && Tricep3_y(i+17) < Tricep3_SD && Tricep3_y(i+18) < Tricep3_SD...
        && Tricep3_y(i+19) < Tricep3_SD && Tricep3_y(i+20) < Tricep3_SD...
        && Tricep3_y(i+21) < Tricep3_SD && Tricep3_y(i+22) < Tricep3_SD && Tricep3_y(i+23) < Tricep3_SD && Tricep3_y(i+24) < Tricep3_SD...
        && Tricep3_y(i+25) < Tricep3_SD && Tricep3_y(i+26) < Tricep3_SD && Tricep3_y(i+27) < Tricep3_SD && Tricep3_y(i+28) < Tricep3_SD...
        && Tricep3_y(i+29) < Tricep3_SD && Tricep3_y(i+30) < Tricep3_SD && Tricep3_y(i+31) < Tricep3_SD && Tricep3_y(i+32) < Tricep3_SD...
        && Tricep3_y(i+33) < Tricep3_SD && Tricep3_y(i+34) < Tricep3_SD && Tricep3_y(i+35) < Tricep3_SD && Tricep3_y(i+36) < Tricep3_SD...
        && Tricep3_y(i+37) < Tricep3_SD && Tricep3_y(i+38) < Tricep3_SD && Tricep3_y(i+39) < Tricep3_SD && Tricep3_y(i+40) < Tricep3_SD...
        && Tricep3_y(i+41) < Tricep3_SD && Tricep3_y(i+42) < Tricep3_SD && Tricep3_y(i+43) < Tricep3_SD && Tricep3_y(i+44) < Tricep3_SD...
        && Tricep3_y(i+45) < Tricep3_SD && Tricep3_y(i+46) < Tricep3_SD && Tricep3_y(i+47) < Tricep3_SD && Tricep3_y(i+48) < Tricep3_SD...
        && Tricep3_y(i+49) < Tricep3_SD 
    
    
    
    Tricep3_Offset_Index = i;
    break
else 
    Tricep3_Offset_Index = NaN;
end
 end
 
 if ~isnan(Tricep3_Offset_Index)
Tricep3_Offset_time = Tricep3_x(Tricep3_Offset_Index);   %putting it in Tricep time domain
else
    Tricep3_Offset_time = NaN;
%[~, Tricep_trial] =  min(abs(Elbow - Tricep_trial));  % finding the nearest corresponding time from Tricep time domain to Elbow time domain
 end
 end

% Tricep_Offset = [Tricep1_Offset_time; Tricep2_Offset_time; Tricep3_Offset_time];
Tricep_Offset = Tricep3_Offset_time;


%% Offset from Marker
if isnan(Tricep3_Onset_Index) 
    Tricep3_FMO_Index = Inf;
    Tricep3_FMO_time = Inf;
%     break
 else
try
for i = Tricep3_Marker_end:(length(Tricep3_y)-20)


if Tricep3_y(i) < Tricep3_SD && Tricep3_y(i+1) < Tricep3_SD && Tricep3_y(i+2) < Tricep3_SD && Tricep3_y(i+3) < Tricep3_SD && Tricep3_y(i+4) < Tricep3_SD && Tricep3_y(i+5) < Tricep3_SD && Tricep3_y(i+6) < Tricep3_SD...
        && Tricep3_y(i+7) < Tricep3_SD && Tricep3_y(i+8) < Tricep3_SD && Tricep3_y(i+9) < Tricep3_SD && Tricep3_y(i+10) < Tricep3_SD...
        && Tricep3_y(i+11) < Tricep3_SD && Tricep3_y(i+12) < Tricep3_SD && Tricep3_y(i+13) < Tricep3_SD && Tricep3_y(i+14) < Tricep3_SD...
        && Tricep3_y(i+15) < Tricep3_SD && Tricep3_y(i+16) < Tricep3_SD && Tricep3_y(i+17) < Tricep3_SD && Tricep3_y(i+18) < Tricep3_SD...
        && Tricep3_y(i+19) < Tricep3_SD && Tricep3_y(i+20) < Tricep3_SD...
        && Tricep3_y(i+21) < Tricep3_SD && Tricep3_y(i+22) < Tricep3_SD && Tricep3_y(i+23) < Tricep3_SD && Tricep3_y(i+24) < Tricep3_SD...
        && Tricep3_y(i+25) < Tricep3_SD && Tricep3_y(i+26) < Tricep3_SD && Tricep3_y(i+27) < Tricep3_SD && Tricep3_y(i+28) < Tricep3_SD...
        && Tricep3_y(i+29) < Tricep3_SD && Tricep3_y(i+30) < Tricep3_SD && Tricep3_y(i+31) < Tricep3_SD && Tricep3_y(i+32) < Tricep3_SD...
        && Tricep3_y(i+33) < Tricep3_SD && Tricep3_y(i+34) < Tricep3_SD && Tricep3_y(i+35) < Tricep3_SD && Tricep3_y(i+36) < Tricep3_SD...
        && Tricep3_y(i+37) < Tricep3_SD && Tricep3_y(i+38) < Tricep3_SD && Tricep3_y(i+39) < Tricep3_SD && Tricep3_y(i+40) < Tricep3_SD...
        && Tricep3_y(i+41) < Tricep3_SD && Tricep3_y(i+42) < Tricep3_SD && Tricep3_y(i+43) < Tricep3_SD && Tricep3_y(i+44) < Tricep3_SD...
        && Tricep3_y(i+45) < Tricep3_SD && Tricep3_y(i+46) < Tricep3_SD && Tricep3_y(i+47) < Tricep3_SD && Tricep3_y(i+48) < Tricep3_SD...
        && Tricep3_y(i+49) < Tricep3_SD 
    
    
    Tricep3_FMO_Index = i;
    break
else 
    Tricep3_FMO_Index = NaN;
end
 end
 catch
 Tricep3_FMO_Index = NaN;
end
 if ~isnan(Tricep3_FMO_Index)
Tricep3_FMO_time = Tricep3_x(Tricep3_FMO_Index);   %putting it in Tricep time domain
else
    Tricep3_FMO_time = NaN;
%[~, Tricep_trial] =  min(abs(Elbow - Tricep_trial));  % finding the nearest corresponding time from Tricep time domain to Elbow time domain
 end
end


% Tricep_FMO = [Tricep1_FMO_time; Tricep2_FMO_time; Tricep3_FMO_time];
Tricep_FMO = Tricep3_FMO_time;

%% Tricep From Marker Times Code
% [~, Tricep3_Marker_ind] =  min(abs(Tricep3_x - Marker_start_time));  % finding the nearest corresponding time from Tricep time domain to Elbow time domain
% 
% [~, Tricep3_Marker_end] =  min(abs(Tricep3_x - Marker_end_time)); 
% 
% [~, Tricep3_pre] =  min(abs(Tricep3_x - TFx_pre));
% 
% [~, Tricep3_post] =  min(abs(Tricep3_x - TFx_post));

Tricep_trial_mean = mean(Tricep3_y(Tricep3_Marker_ind:Tricep3_Marker_end-1));

Tricep_pretrial_mean = mean(Tricep3_y(Tricep3_Marker_ind-dur:Tricep3_Marker_ind-1));

%Tricep_pretrial_mean = mean(Tricep3_y(1:Tricep3_Marker_ind-1)); %to use when not 5 sec pre

Tricep_posttrial_mean = mean(Tricep3_y(Tricep3_Marker_end:Tricep3_Marker_end+dur-1));

%Tricep_posttrial_mean = mean(Tricep3_y(Tricep3_Marker_end:end)); %to use when not 5 sec post

[Tricep_peak, Tricep_peak_ind] = max(Tricep3_y(Tricep3_Marker_ind:Tricep3_Marker_end-1));



 Tricep_trial_time = (Tricep3_x(Tricep3_Marker_end) - Tricep3_x(Tricep3_Marker_ind));
% 
% %Tricep_times = [(Tricep3_x(Tricep3_Marker_ind) - Tricep3_x(1)),Tricep_trial_time, (Tricep3_x(Tricep3_Marker_end+dur-1)- Tricep3_x(Tricep3_Marker_end))]; %pre < 5 
% 
% Tricep_times = [(Tricep3_x(Tricep3_Marker_ind-1)- Tricep3_x(Tricep3_Marker_ind-dur)),Tricep_trial_time, Tricep3_x(end) - Tricep3_x(Tricep3_Marker_end)]; %post < 5 
% 
% Tricep_Contribution = (Tricep_trial_mean/Total_EMG_Mean)*100;
% 
% Tricep_Outcomes = [Tricep_pretrial_mean, Tricep_trial_mean, Tricep_posttrial_mean, Tricep_peak, Tricep_Contribution];




