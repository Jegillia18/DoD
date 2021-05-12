%% 
%%%%%%%%%%%%%%%%%%%%%need to conert everything to muscle ind. prob easier
%%%%%%%%%%%%%%%%%%%%%to make functions
[~, Bicep3_Marker_ind] =  min(abs(Bicep3_x - Marker_start_time));  % finding the nearest corresponding time from Bicep time domain to Elbow time domain

[~, Bicep3_Marker_end] =  min(abs(Bicep3_x - Marker_end_time)); 

[~, Bicep3_Pre] =  min(abs(Bicep3_x - TFx_pre)); %this used to be Bicep1_x i think i messed up, its just time should be fine
%Bicep_trial = Bicep1_x(Bicep_Marker_ind);
[~, Bicep3_post] =  min(abs(Bicep3_x - TFx_post));

Bicep3_STD = std(Bicep3_y(Bicep3_Pre-1:Bicep3_Marker_ind-1));
Bicep3_baseline_avg = mean(Bicep3_y(Bicep3_Pre-1:Bicep3_Marker_ind-1));
Bicep3_SD = Bicep3_baseline_avg + (Bicep3_STD*3);


for i = Bicep3_Marker_ind:Bicep3_Marker_end
if Bicep3_y(i) > Bicep3_SD && Bicep3_y(i+1) > Bicep3_SD && Bicep3_y(i+2) > Bicep3_SD && Bicep3_y(i+3) > Bicep3_SD && Bicep3_y(i+4) > Bicep3_SD && Bicep3_y(i+5) > Bicep3_SD && Bicep3_y(i+6) > Bicep3_SD...
        && Bicep3_y(i+7) > Bicep3_SD && Bicep3_y(i+8) > Bicep3_SD && Bicep3_y(i+9) > Bicep3_SD && Bicep3_y(i+10) > Bicep3_SD...
        && Bicep3_y(i+11) > Bicep3_SD && Bicep3_y(i+12) > Bicep3_SD && Bicep3_y(i+13) > Bicep3_SD && Bicep3_y(i+14) > Bicep3_SD...
        && Bicep3_y(i+15) > Bicep3_SD && Bicep3_y(i+16) > Bicep3_SD && Bicep3_y(i+17) > Bicep3_SD && Bicep3_y(i+18) > Bicep3_SD...
        && Bicep3_y(i+19) > Bicep3_SD && Bicep3_y(i+20) > Bicep3_SD...
        && Bicep3_y(i+21) > Bicep3_SD && Bicep3_y(i+22) > Bicep3_SD && Bicep3_y(i+23) > Bicep3_SD && Bicep3_y(i+24) > Bicep3_SD...
        && Bicep3_y(i+25) > Bicep3_SD && Bicep3_y(i+26) > Bicep3_SD && Bicep3_y(i+27) > Bicep3_SD && Bicep3_y(i+28) > Bicep3_SD...
        && Bicep3_y(i+29) > Bicep3_SD && Bicep3_y(i+30) > Bicep3_SD && Bicep3_y(i+31) > Bicep3_SD && Bicep3_y(i+32) > Bicep3_SD...
        && Bicep3_y(i+33) > Bicep3_SD && Bicep3_y(i+34) > Bicep3_SD && Bicep3_y(i+35) > Bicep3_SD && Bicep3_y(i+36) > Bicep3_SD...
        && Bicep3_y(i+37) > Bicep3_SD && Bicep3_y(i+38) > Bicep3_SD && Bicep3_y(i+39) > Bicep3_SD && Bicep3_y(i+40) > Bicep3_SD...
        && Bicep3_y(i+41) > Bicep3_SD && Bicep3_y(i+42) > Bicep3_SD && Bicep3_y(i+43) > Bicep3_SD && Bicep3_y(i+44) > Bicep3_SD...
        && Bicep3_y(i+45) > Bicep3_SD && Bicep3_y(i+46) > Bicep3_SD && Bicep3_y(i+47) > Bicep3_SD && Bicep3_y(i+48) > Bicep3_SD...
        && Bicep3_y(i+49) > Bicep3_SD
   
   
    Bicep3_Onset_Index = i;
    break
else 
    Bicep3_Onset_Index = NaN;
end
end

if ~isnan(Bicep3_Onset_Index)
Bicep3_onset_time = Bicep3_x(Bicep3_Onset_Index);   %putting it in Bicep time domain
else
    Bicep3_onset_time = NaN;
%[~, Bicep_trial] =  min(abs(Elbow - Bicep_trial));  % finding the nearest corresponding time from Bicep time domain to Elbow time domain
end
% if length(Bicep_trial) ~= 1
%   Bicep_trial(2) = [];
% end
% Bicep_Onset = [Bicep1_onset_time; Bicep2_onset_time; Bicep3_onset_time];

Bicep_Onset = Bicep3_onset_time;
%% Offset

 if isnan(Bicep3_Onset_Index) 
    Bicep3_Offset_Index = Inf;
    Bicep3_Offset_time = Inf;
%     break
 else
for i = Bicep3_Onset_Index:Bicep3_Marker_end

if Bicep3_y(i) < Bicep3_SD && Bicep3_y(i+1) < Bicep3_SD && Bicep3_y(i+2) < Bicep3_SD && Bicep3_y(i+3) < Bicep3_SD && Bicep3_y(i+4) < Bicep3_SD && Bicep3_y(i+5) < Bicep3_SD && Bicep3_y(i+6) < Bicep3_SD...
        && Bicep3_y(i+7) < Bicep3_SD && Bicep3_y(i+8) < Bicep3_SD && Bicep3_y(i+9) < Bicep3_SD && Bicep3_y(i+10) < Bicep3_SD...
        && Bicep3_y(i+11) < Bicep3_SD && Bicep3_y(i+12) < Bicep3_SD && Bicep3_y(i+13) < Bicep3_SD && Bicep3_y(i+14) < Bicep3_SD...
        && Bicep3_y(i+15) < Bicep3_SD && Bicep3_y(i+16) < Bicep3_SD && Bicep3_y(i+17) < Bicep3_SD && Bicep3_y(i+18) < Bicep3_SD...
        && Bicep3_y(i+19) < Bicep3_SD && Bicep3_y(i+20) < Bicep3_SD...
        && Bicep3_y(i+21) < Bicep3_SD && Bicep3_y(i+22) < Bicep3_SD && Bicep3_y(i+23) < Bicep3_SD && Bicep3_y(i+24) < Bicep3_SD...
        && Bicep3_y(i+25) < Bicep3_SD && Bicep3_y(i+26) < Bicep3_SD && Bicep3_y(i+27) < Bicep3_SD && Bicep3_y(i+28) < Bicep3_SD...
        && Bicep3_y(i+29) < Bicep3_SD && Bicep3_y(i+30) < Bicep3_SD && Bicep3_y(i+31) < Bicep3_SD && Bicep3_y(i+32) < Bicep3_SD...
        && Bicep3_y(i+33) < Bicep3_SD && Bicep3_y(i+34) < Bicep3_SD && Bicep3_y(i+35) < Bicep3_SD && Bicep3_y(i+36) < Bicep3_SD...
        && Bicep3_y(i+37) < Bicep3_SD && Bicep3_y(i+38) < Bicep3_SD && Bicep3_y(i+39) < Bicep3_SD && Bicep3_y(i+40) < Bicep3_SD...
        && Bicep3_y(i+41) < Bicep3_SD && Bicep3_y(i+42) < Bicep3_SD && Bicep3_y(i+43) < Bicep3_SD && Bicep3_y(i+44) < Bicep3_SD...
        && Bicep3_y(i+45) < Bicep3_SD && Bicep3_y(i+46) < Bicep3_SD && Bicep3_y(i+47) < Bicep3_SD && Bicep3_y(i+48) < Bicep3_SD...
        && Bicep3_y(i+49) < Bicep3_SD 
    
    
    
    Bicep3_Offset_Index = i;
    break
else 
    Bicep3_Offset_Index = NaN;
end
 end
 
 if ~isnan(Bicep3_Offset_Index)
Bicep3_Offset_time = Bicep3_x(Bicep3_Offset_Index);   %putting it in Bicep time domain
else
    Bicep3_Offset_time = NaN;
%[~, Bicep_trial] =  min(abs(Elbow - Bicep_trial));  % finding the nearest corresponding time from Bicep time domain to Elbow time domain
 end
end

% Bicep_Offset = [Bicep1_Offset_time; Bicep2_Offset_time; Bicep3_Offset_time];
Bicep_Offset = Bicep3_Offset_time;
%% Offset from Marker

if isnan(Bicep3_Onset_Index) 
    Bicep3_FMO_Index = Inf;
    Bicep3_FMO_time = Inf;
%     break
 else
try
for i = Bicep3_Marker_end:(length(Bicep3_y)-20)


if Bicep3_y(i) < Bicep3_SD && Bicep3_y(i+1) < Bicep3_SD && Bicep3_y(i+2) < Bicep3_SD && Bicep3_y(i+3) < Bicep3_SD && Bicep3_y(i+4) < Bicep3_SD && Bicep3_y(i+5) < Bicep3_SD && Bicep3_y(i+6) < Bicep3_SD...
        && Bicep3_y(i+7) < Bicep3_SD && Bicep3_y(i+8) < Bicep3_SD && Bicep3_y(i+9) < Bicep3_SD && Bicep3_y(i+10) < Bicep3_SD...
        && Bicep3_y(i+11) < Bicep3_SD && Bicep3_y(i+12) < Bicep3_SD && Bicep3_y(i+13) < Bicep3_SD && Bicep3_y(i+14) < Bicep3_SD...
        && Bicep3_y(i+15) < Bicep3_SD && Bicep3_y(i+16) < Bicep3_SD && Bicep3_y(i+17) < Bicep3_SD && Bicep3_y(i+18) < Bicep3_SD...
        && Bicep3_y(i+19) < Bicep3_SD && Bicep3_y(i+20) < Bicep3_SD...
        && Bicep3_y(i+21) < Bicep3_SD && Bicep3_y(i+22) < Bicep3_SD && Bicep3_y(i+23) < Bicep3_SD && Bicep3_y(i+24) < Bicep3_SD...
        && Bicep3_y(i+25) < Bicep3_SD && Bicep3_y(i+26) < Bicep3_SD && Bicep3_y(i+27) < Bicep3_SD && Bicep3_y(i+28) < Bicep3_SD...
        && Bicep3_y(i+29) < Bicep3_SD && Bicep3_y(i+30) < Bicep3_SD && Bicep3_y(i+31) < Bicep3_SD && Bicep3_y(i+32) < Bicep3_SD...
        && Bicep3_y(i+33) < Bicep3_SD && Bicep3_y(i+34) < Bicep3_SD && Bicep3_y(i+35) < Bicep3_SD && Bicep3_y(i+36) < Bicep3_SD...
        && Bicep3_y(i+37) < Bicep3_SD && Bicep3_y(i+38) < Bicep3_SD && Bicep3_y(i+39) < Bicep3_SD && Bicep3_y(i+40) < Bicep3_SD...
        && Bicep3_y(i+41) < Bicep3_SD && Bicep3_y(i+42) < Bicep3_SD && Bicep3_y(i+43) < Bicep3_SD && Bicep3_y(i+44) < Bicep3_SD...
        && Bicep3_y(i+45) < Bicep3_SD && Bicep3_y(i+46) < Bicep3_SD && Bicep3_y(i+47) < Bicep3_SD && Bicep3_y(i+48) < Bicep3_SD...
        && Bicep3_y(i+49) < Bicep3_SD 
    
    
    Bicep3_FMO_Index = i;
    break
else 
    Bicep3_FMO_Index = NaN;
end
 end
 catch
 Bicep3_FMO_Index = NaN;
end

 if ~isnan(Bicep3_FMO_Index)
Bicep3_FMO_time = Bicep3_x(Bicep3_FMO_Index);   %putting it in Bicep time domain
else
    Bicep3_FMO_time = NaN;
%[~, Bicep_trial] =  min(abs(Elbow - Bicep_trial));  % finding the nearest corresponding time from Bicep time domain to Elbow time domain
 end
end


% Bicep_FMO = [Bicep1_FMO_time; Bicep2_FMO_time; Bicep3_FMO_time];
Bicep_FMO = Bicep3_FMO_time;



%% Bicep From Marker Times Code
% [~, Bicep3_Marker_ind] =  min(abs(Bicep3_x - Marker_start_time));  % finding the nearest corresponding time from Bicep time domain to Elbow time domain
% 
% [~, Bicep3_Marker_end] =  min(abs(Bicep3_x - Marker_end_time)); 
% 
% [~, Bicep3_pre] =  min(abs(Bicep3_x - TFx_pre));

% [~, Bicep3_post] =  min(abs(Bicep3_x - TFx_post));

Bicep_trial_mean = mean(Bicep3_y(Bicep3_Marker_ind:Bicep3_Marker_end-1));

Bicep_pretrial_mean = mean(Bicep3_y(Bicep3_Marker_ind-dur:Bicep3_Marker_ind-1));

%Bicep_pretrial_mean = mean(Bicep3_y(1:Bicep3_Marker_ind-1)); %to use when not 5 sec pre

Bicep_posttrial_mean = mean(Bicep3_y(Bicep3_Marker_end:Bicep3_Marker_end+dur-1));

%Bicep_posttrial_mean = mean(Bicep3_y(Bicep3_Marker_end:end)); %to use when not 5 sec post

[Bicep_peak, Bicep_peak_ind] = max(Bicep3_y(Bicep3_Marker_ind:Bicep3_Marker_end-1));



 Bicep_trial_time = (Bicep3_x(Bicep3_Marker_end) - Bicep3_x(Bicep3_Marker_ind));
% 
% %Bicep_times = [(Bicep3_x(Bicep3_Marker_ind) - Bicep3_x(1)),Bicep_trial_time, (Bicep3_x(Bicep3_Marker_end+dur-1)- Bicep3_x(Bicep3_Marker_end))]; %pre < 5 
% 
% Bicep_times = [(Bicep3_x(Bicep3_Marker_ind-1)- Bicep3_x(Bicep3_Marker_ind-dur)),Bicep_trial_time, Bicep3_x(end) - Bicep3_x(Bicep3_Marker_end)]; %post < 5 

% Bicep_Contribution = (Bicep_trial_mean/Total_EMG_Mean)*100;
% 
% Bicep_Outcomes = [Bicep_pretrial_mean, Bicep_trial_mean, Bicep_posttrial_mean, Bicep_peak, Bicep_Contribution];




