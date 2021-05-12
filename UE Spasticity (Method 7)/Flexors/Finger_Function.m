%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code to load and analyze spacticity Data 
% Cazmon Suri
% Note: Code can be adjusted to include and exclude data
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Finger_variables_all]=Finger_Function(u)
% This for loop will run 3 times for each trial analyzing the outcome
% measures and saving them each time.
for t=1:3                                                                  % This variable corresponds to the trials (1-3). Should not need to be changed.

s=3;                                                                       % This variable corresponds to the session (pre=1, post=2, follow=3). Change the number depending on the session you are analyzing.

Finger_file = load(sprintf('691_P%d_T%d_UEspasticity_finger_%d',u,s,t));   % Loads and Stores all the data from spike in a variable tree. 


                                                                           % "%d" is a place holder that can be subbed for the value a specified variable. 
                                                                           % Usually in the respective order they are writen at the end of a command. See line 12. 
                                                                           % P%d - corresponds to the subject. The current value of  the "u" variable from the main
                                                                           % script will be subbed in here.
                                                                           % T%d - corresponds to the session. The variable "s" will be subbed in here.
                                                                           % finger_%d - corresponds to the trial number. The current value of "t" will
                                                                           % be subbed in here.


Finger_Name = fieldnames(Finger_file);                                     % Creates a cell array with vectors of names of fields
Finger_Name = Finger_Name{3};                                              % Stores the joint data as a variable.
                                                                           % The number corresponds with a place in the varaible tree. 3 is for the joint.
                                                                           
                                                                           
Finger_x = Finger_file.(Finger_Name).times;                                % Saves the time axis from the finger joint data to a variable, labeled with x for axis it should be plotted on.
Finger_y = Finger_file.(Finger_Name).values;                               % Saves the joint data for the finger to a variable, labeled with y for axis it should be plotted on.

[a,b]=min(Finger_y);                                                       % Finds the value and location of full joint extension.

min_value = a;                                                             % Saves the value of full joint extension. 
min_time = Finger_x(b);


Finger_std = std(Finger_y(450:550));                                       % Calculates the standard deviation for 1 second approximately prior to the start of the trial. 
Finger_mean = mean(Finger_y(450:550));                                     % Calculates the mean for 1 second approximately prior to the start of the trial.
Trial = Finger_mean-(2.5*Finger_std);                                      % Calculates the value that will be used to find the start of the trial.

for i=450:length(Finger_y)                                                 % Sets the loop to look for start of the trail from 4.5 seconds to the end.
            
       if Finger_y(i) < Trial && Finger_y(i+1) < Trial && Finger_y(i+2) < Trial % Conditional statement for trial onset. Conditions set here must be met.
       x=i;                                                                % Variable x will be saved at current i if conditions are met.
            break                                                          % Loop will break when the conditions have been met.
        else
            x=[];                                                          % Variable x will remain blank if conditions are not met.
       end       
end

y=x;
x = Finger_x(x);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Finger Flexor EMG Data

FingerFl_Name = fieldnames(Finger_file);                                   % Creates a cell array with vectors of names of fields
FingerFl_Name = FingerFl_Name{2};                                          % Stores the desired data as a variable. Change number depending on muscle.

FingerFl_x = Finger_file.(FingerFl_Name).times;                            % Saves the time axis from the finger flexor data to a variable, labeled with x for axis it should be plotted on.
FingerFl_y = Finger_file.(FingerFl_Name).values;                           % Saves the finger flexor data for the finger to a variable, labeled with y for axis it should be plotted on

[~, trial_end] =  min(abs(FingerFl_x - min_time));

if length(trial_end) ~= 1
  trial_end(2) = [];
end


FingerFl_mean = mean(FingerFl_y(1000:11000));                              % Calculates the standard deviation of the first 5 seconds of the file. 
FingerFl_std = std(FingerFl_y(1000:11000));                                % Calculates the mean of the first 5 seconds of the file.

FingerFl_finder = FingerFl_mean+(3*FingerFl_std);                        % Calculates the value that will be used to find RTA.


[~, trial_start] =  min(abs(FingerFl_x - x));

if length(trial_start) ~= 1
  trial_start(2) = [];
end
 

for i=trial_start+1:trial_end                                                       % Will search from the start of trial to time of full joint extension

    if FingerFl_y(i) > FingerFl_finder && FingerFl_y(i+1) > FingerFl_finder && FingerFl_y(i+2) > FingerFl_finder && FingerFl_y(i+3) > FingerFl_finder && FingerFl_y(i+4) > FingerFl_finder && FingerFl_y(i+5) > FingerFl_finder && FingerFl_y(i+6) > FingerFl_finder && FingerFl_y(i+7) > FingerFl_finder && FingerFl_y(i+8) > FingerFl_finder && FingerFl_y(i+9) > FingerFl_finder && FingerFl_y(i+10) > FingerFl_finder && FingerFl_y(i+11) > FingerFl_finder && FingerFl_y(i+12) > FingerFl_finder && FingerFl_y(i+13) > FingerFl_finder && FingerFl_y(i+14) > FingerFl_finder && FingerFl_y(i+15) > FingerFl_finder && FingerFl_y(i+16) > FingerFl_finder && FingerFl_y(i+17) > FingerFl_finder && FingerFl_y(i+18) > FingerFl_finder && FingerFl_y(i+19) > FingerFl_finder && FingerFl_y(i+20) > FingerFl_finder && FingerFl_y(i+21) > FingerFl_finder && FingerFl_y(i+22) > FingerFl_finder && FingerFl_y(i+23) > FingerFl_finder && FingerFl_y(i+24) > FingerFl_finder && FingerFl_y(i+25) > FingerFl_finder && FingerFl_y(i+26) > FingerFl_finder && FingerFl_y(i+27) > FingerFl_finder && FingerFl_y(i+28) > FingerFl_finder && FingerFl_y(i+29) > FingerFl_finder %&& FingerFl_y(i+30) > FingerFl_finder && FingerFl_y(i+31) > FingerFl_finder && FingerFl_y(i+32) > FingerFl_finder && FingerFl_y(i+33) > FingerFl_finder && FingerFl_y(i+34) > FingerFl_finder && FingerFl_y(i+35) > FingerFl_finder && FingerFl_y(i+36) > FingerFl_finder && FingerFl_y(i+37) > FingerFl_finder && FingerFl_y(i+38) > FingerFl_finder && FingerFl_y(i+39) > FingerFl_finder && FingerFl_y(i+40) > FingerFl_finder && FingerFl_y(i+41) > FingerFl_finder && FingerFl_y(i+42) > FingerFl_finder && FingerFl_y(i+43) > FingerFl_finder && FingerFl_y(i+44) > FingerFl_finder && FingerFl_y(i+45) > FingerFl_finder && FingerFl_y(i+46) > FingerFl_finder && FingerFl_y(i+47) > FingerFl_finder && FingerFl_y(i+48) > FingerFl_finder && FingerFl_y(i+49) > FingerFl_finder && FingerFl_y(i+50) > FingerFl_finder && FingerFl_y(i+51) > FingerFl_finder && FingerFl_y(i+52) > FingerFl_finder && FingerFl_y(i+53) > FingerFl_finder && FingerFl_y(i+54) > FingerFl_finder && FingerFl_y(i+55) > FingerFl_finder && FingerFl_y(i+56) > FingerFl_finder && FingerFl_y(i+57) > FingerFl_finder && FingerFl_y(i+58) > FingerFl_finder && FingerFl_y(i+59) > FingerFl_finder && FingerFl_y(i+60) > FingerFl_finder && FingerFl_y(i+61) > FingerFl_finder && FingerFl_y(i+62) > FingerFl_finder && FingerFl_y(i+63) > FingerFl_finder && FingerFl_y(i+64) > FingerFl_finder && FingerFl_y(i+65) > FingerFl_finder && FingerFl_y(i+66) > FingerFl_finder && FingerFl_y(i+67) > FingerFl_finder && FingerFl_y(i+68) > FingerFl_finder && FingerFl_y(i+69) > FingerFl_finder && FingerFl_y(i+70) > FingerFl_finder && FingerFl_y(i+71) > FingerFl_finder && FingerFl_y(i+72) > FingerFl_finder && FingerFl_y(i+73) > FingerFl_finder && FingerFl_y(i+74) > FingerFl_finder && FingerFl_y(i+75) > FingerFl_finder && FingerFl_y(i+76) > FingerFl_finder && FingerFl_y(i+77) > FingerFl_finder && FingerFl_y(i+78) > FingerFl_finder && FingerFl_y(i+79) > FingerFl_finder && FingerFl_y(i+80) > FingerFl_finder && FingerFl_y(i+81) > FingerFl_finder && FingerFl_y(i+82) > FingerFl_finder && FingerFl_y(i+83) > FingerFl_finder && FingerFl_y(i+84) > FingerFl_finder && FingerFl_y(i+85) > FingerFl_finder && FingerFl_y(i+86) > FingerFl_finder && FingerFl_y(i+87) > FingerFl_finder && FingerFl_y(i+88) > FingerFl_finder && FingerFl_y(i+89) > FingerFl_finder && FingerFl_y(i+90) > FingerFl_finder && FingerFl_y(i+91) > FingerFl_finder && FingerFl_y(i+92) > FingerFl_finder && FingerFl_y(i+93) > FingerFl_finder && FingerFl_y(i+94) > FingerFl_finder && FingerFl_y(i+95) > FingerFl_finder && FingerFl_y(i+96) > FingerFl_finder && FingerFl_y(i+97) > FingerFl_finder && FingerFl_y(i+98) > FingerFl_finder && FingerFl_y(i+99) > FingerFl_finder
       FingerFl_trial=i;                                                   % Variable will be saved at current i
            break                                                          % Loop will break when the conditions have been met
        else
            FingerFl_trial=NaN;                                            % Variable will remain blank if conditions are not met.
    end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Finally Check to make sure the EMG point is not rounded to the same point as the Joint Angle

if ~isnan(FingerFl_trial) 
FingerFl_trial = FingerFl_x(FingerFl_trial);   %putting it in Bicep time domain

[~, Finger_trial] =  min(abs(Finger_x - FingerFl_trial));  % finding the nearest corresponding time from Bicep time domain to Elbow time domain

if length(Finger_trial) ~= 1
  Finger_trial(2) = [];
end

end



% FingerFl_trial_t = round(FingerFl_trial/20);                               % Converting the previously found Finger Flexor onset to the same frequency as joint angle.
% if FingerFl_trial_t==x                                                     % Checking to make sure that the Finger Flexor onset is not the same as the joint angle onset.
%     FingerFl_trial_t=ceil(FingerFl_trial/20);                              % If the onset points are the same re convert to round up to next point.
% else
%     FingerFl_trial_t=FingerFl_trial_t;                                     % If the the points are not equal keep it as is.
% end
% 
% 
% FingerFl_trial = FingerFl_trial_t;
% 
% FFT = FingerFl_trial;
%% Plot
Finger_Trial_Time = x;                                           % Exact start time of trial on set.
Finger_Trial_Value = Finger_y(y);                                          % Exact value of trial on set in degrees.


if isnan(FingerFl_trial)
    F_RTA_Time = NaN;
    F_RTA_Value = NaN;
else
    F_RTA_Time = Finger_x(Finger_trial);                                            % Exact time of RTA in seconds.
    F_RTA_Value = Finger_y(Finger_trial);                                           % Exact value of RTA in degrees.
end

if isnan(F_RTA_Time)
    Finger_Delta_Time = NaN;
    Finger_Delta_Value = NaN;
else
    Finger_Delta_Time = F_RTA_Time - Finger_Trial_Time;                    % Time between trial onset and RTA in seconds.
    Finger_Delta_Value =  F_RTA_Value - Finger_Trial_Value;                % Difference between trial on set angle and RTA in degrees. 
end


% figure
% plot(Finger_x,Finger_y, Finger_Trial_Time,Finger_Trial_Value,'r*', F_RTA_Time,F_RTA_Value,'c*')
% title('Finger Trial 1')
% xlabel('Time (sec.)')
% ylabel('Joint Angle (º)')

%Joint_speed = (Finger_Trial_Value-min_value)/(Finger_x(b)-Finger_Trial_Time); % Calculates joint speed
%Finger_variables(t,:) = [Finger_Trial_Time, Finger_Trial_Value, F_RTA_Time, F_RTA_Value, Finger_Delta_Time, Finger_Delta_Value, Joint_speed, min_time]; % Stores all the variables for this trial loop.
%Finger_variables(t,:) = [Finger_y(y), Finger_y(b)];
Finger_variables(t,:) = [FingerFl_mean, FingerFl_std];
end
Finger_variables_all = [Finger_variables(1,:), Finger_variables(2,:), Finger_variables(3,:)];
end

