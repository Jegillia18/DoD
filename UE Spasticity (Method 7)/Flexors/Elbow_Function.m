

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code to load and analyze spacticity Data 
% Cazmon Suri
% Note: Code can be adjusted to include and exclude data
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Elbow_variables_all]=Elbow_Function(u)
% This for loop will run 3 times for each trial analyzing the outcome
% measures and saving them each time. 
for t=2:3                                                                  % This variable corresponds to the trials (1-3). Should not need to be changed.

s=3;                                                                       % This variable corresponds to the session (pre=1, post=2, follow=3). Change the number depending on the session you are analyzing.


Elbow_file = load(sprintf('691_P%d_T%d_UEspasticity_elbow_%d',u,s,t));     % Loads and Stores all the data from spike in a variable tree. 

                                                                           % "%d" is a place holder that can be subbed for the value a specified variable. 
                                                                           % Usually in the respective order they are writen at the end of a command. See line 12. 
                                                                           % P%d - corresponds to the subject. The current value of  the "u" variable from the main
                                                                           % script will be subbed in here.
                                                                           % T%d - corresponds to the session. The variable "s" will be subbed in here.
                                                                           % elbow_%d - corresponds to the trial number. The current value of "t" will
                                                                           % be subbed in here.



Elbow_Name = fieldnames(Elbow_file);                                       % Creates a cell array with vectors of names of fields
Elbow_Name = Elbow_Name{3};                                                % Stores the joint data as a variable. 
                                                                           % The number corresponds with a place in the varaible tree. 3 is for the joint.



Elbow_x = Elbow_file.(Elbow_Name).times;                                   % Saves the time axis from the elbow joint data to a variable, labeled with x for axis it should be plotted on.
Elbow_y = Elbow_file.(Elbow_Name).values;                                  % Saves the joint data for the elbow to a variable, labeled with y for axis it should be plotted on.

[a,b]=min(Elbow_y);                                                        % Finds the value and location of full joint extension.

min_value = a;                                                             % Saves the value of full joint extension. 
min_time = Elbow_x(b);





Elbow_std = std(Elbow_y(450:550));                                         % Calculates the standard deviation for 1 second approximately prior to the start of the trial. 
Elbow_mean = mean(Elbow_y(450:550));                                       % Calculates the mean for 1 second approximately prior to the start of the trial.
Trial = Elbow_mean-(2.5*Elbow_std);                                        % Calculates the value that will be used to find the start of the trial.


for i=450:length(Elbow_y)                                                  % Sets the loop to look for start of the trail from 4.5 seconds to the end.
            
       if Elbow_y(i) < Trial && Elbow_y(i+1) < Trial && Elbow_y(i+2) < Trial % Conditional statement for trial onset. Conditions set here must be met.
       x=i;                                                                % Variable x will be saved at current i if conditions are met.
            break                                                          % Loop will break when the conditions have been met.
        else
            x=[];                                                          % Variable x will remain blank if conditions are not met.
       end       
end
y=x;
x = Elbow_x(x);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bicep EMG for First Trial

%Bicep emg data
Bicep_Name = fieldnames(Elbow_file);                                       % Creates a cell array with vectors of names of fields
Bicep_Name = Bicep_Name{1};                                                % Stores the desired data as a variable. Change number depending on muscle.

Bicep_x = Elbow_file.(Bicep_Name).times;                                   % Saves the time axis from the Bicep data to a variable, labeled with x for axis it should be plotted on.
Bicep_y = Elbow_file.(Bicep_Name).values;                                  % Saves the bicep data for the elbow to a variable, labeled with y for axis it should be plotted on
                                                                 
[~, trial_end] =  min(abs(Bicep_x - min_time));

if length(trial_end) ~= 1
  trial_end(2) = [];
end


Bicep_mean = mean(Bicep_y(1000:11000));                                    % Calculates the standard deviation of the first 5 seconds of the file. 
Bicep_std = std(Bicep_y(1000:11000));                                      % Calculates the mean of the first 5 seconds of the file.

Bicep_finder = Bicep_mean+(3*Bicep_std);                                 % Calculates the value that will be used to find RTA.
  

[~, trial_start] =  min(abs(Bicep_x - x));

if length(trial_start) ~= 1
  trial_start(2) = [];
end

% Converts the previously found x to same frequency as the emg Data (2000 hz). 

for i=trial_start+1:trial_end                                                    % Will search from the start of trial to time of full joint extension   

    if Bicep_y(i) > Bicep_finder && Bicep_y(i+1) > Bicep_finder && Bicep_y(i+2) > Bicep_finder && Bicep_y(i+3) > Bicep_finder && Bicep_y(i+4) > Bicep_finder && Bicep_y(i+5) > Bicep_finder && Bicep_y(i+6) > Bicep_finder && Bicep_y(i+7) > Bicep_finder && Bicep_y(i+8) > Bicep_finder && Bicep_y(i+9) > Bicep_finder && Bicep_y(i+10) > Bicep_finder && Bicep_y(i+11) > Bicep_finder && Bicep_y(i+12) > Bicep_finder && Bicep_y(i+13) > Bicep_finder && Bicep_y(i+14) > Bicep_finder && Bicep_y(i+15) > Bicep_finder && Bicep_y(i+16) > Bicep_finder && Bicep_y(i+17) > Bicep_finder && Bicep_y(i+18) > Bicep_finder && Bicep_y(i+19) > Bicep_finder && Bicep_y(i+20) > Bicep_finder && Bicep_y(i+21) > Bicep_finder && Bicep_y(i+22) > Bicep_finder && Bicep_y(i+23) > Bicep_finder && Bicep_y(i+24) > Bicep_finder && Bicep_y(i+25) > Bicep_finder && Bicep_y(i+26) > Bicep_finder && Bicep_y(i+27) > Bicep_finder && Bicep_y(i+28) > Bicep_finder && Bicep_y(i+29) > Bicep_finder %&& Bicep_y(i+30) > Bicep_finder && Bicep_y(i+31) > Bicep_finder && Bicep_y(i+32) > Bicep_finder && Bicep_y(i+33) > Bicep_finder && Bicep_y(i+34) > Bicep_finder && Bicep_y(i+35) > Bicep_finder && Bicep_y(i+36) > Bicep_finder && Bicep_y(i+37) > Bicep_finder && Bicep_y(i+38) > Bicep_finder && Bicep_y(i+39) > Bicep_finder && Bicep_y(i+40) > Bicep_finder && Bicep_y(i+41) > Bicep_finder && Bicep_y(i+42) > Bicep_finder && Bicep_y(i+43) > Bicep_finder && Bicep_y(i+44) > Bicep_finder && Bicep_y(i+45) > Bicep_finder && Bicep_y(i+46) > Bicep_finder && Bicep_y(i+47) > Bicep_finder && Bicep_y(i+48) > Bicep_finder && Bicep_y(i+49) > Bicep_finder && Bicep_y(i+50) > Bicep_finder && Bicep_y(i+51) > Bicep_finder && Bicep_y(i+52) > Bicep_finder && Bicep_y(i+53) > Bicep_finder && Bicep_y(i+54) > Bicep_finder && Bicep_y(i+55) > Bicep_finder && Bicep_y(i+56) > Bicep_finder && Bicep_y(i+57) > Bicep_finder && Bicep_y(i+58) > Bicep_finder && Bicep_y(i+59) > Bicep_finder && Bicep_y(i+60) > Bicep_finder && Bicep_y(i+61) > Bicep_finder && Bicep_y(i+62) > Bicep_finder && Bicep_y(i+63) > Bicep_finder && Bicep_y(i+64) > Bicep_finder && Bicep_y(i+65) > Bicep_finder && Bicep_y(i+66) > Bicep_finder && Bicep_y(i+67) > Bicep_finder && Bicep_y(i+68) > Bicep_finder && Bicep_y(i+69) > Bicep_finder && Bicep_y(i+70) > Bicep_finder && Bicep_y(i+71) > Bicep_finder && Bicep_y(i+72) > Bicep_finder && Bicep_y(i+73) > Bicep_finder && Bicep_y(i+74) > Bicep_finder && Bicep_y(i+75) > Bicep_finder && Bicep_y(i+76) > Bicep_finder && Bicep_y(i+77) > Bicep_finder && Bicep_y(i+78) > Bicep_finder && Bicep_y(i+79) > Bicep_finder && Bicep_y(i+80) > Bicep_finder && Bicep_y(i+81) > Bicep_finder && Bicep_y(i+82) > Bicep_finder && Bicep_y(i+83) > Bicep_finder && Bicep_y(i+84) > Bicep_finder && Bicep_y(i+85) > Bicep_finder && Bicep_y(i+86) > Bicep_finder && Bicep_y(i+87) > Bicep_finder && Bicep_y(i+88) > Bicep_finder && Bicep_y(i+89) > Bicep_finder && Bicep_y(i+90) > Bicep_finder && Bicep_y(i+91) > Bicep_finder && Bicep_y(i+92) > Bicep_finder && Bicep_y(i+93) > Bicep_finder && Bicep_y(i+94) > Bicep_finder && Bicep_y(i+95) > Bicep_finder && Bicep_y(i+96) > Bicep_finder && Bicep_y(i+97) > Bicep_finder && Bicep_y(i+98) > Bicep_finder && Bicep_y(i+99) > Bicep_finder
       Bicep_trial=i;                                                      % Variable will be saved at current i
            break                                                          % Loop will break when the conditions have been met
        else
            Bicep_trial=NaN;                                               % Variable will remain blank if conditions are not met.
    end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Finally Check to make sure the EMG point is not rounded to the same point as the Joint Angle

if ~isnan(Bicep_trial) 
Bicep_trial = Bicep_x(Bicep_trial);   %putting it in Bicep time domain

[~, Elbow_trial] =  min(abs(Elbow_x - Bicep_trial));  % finding the nearest corresponding time from Bicep time domain to Elbow time domain

if length(Elbow_trial) ~= 1
  Elbow_trial(2) = [];
end

end




% Bicep_trial_t = round(Bicep_trial/20);                                     % Converting the previously found Bicep onset to the same frequency as joint angle.
% if Bicep_trial_t==x                                                        % Checking to make sure that the Bicep onset is not the same as the joint angle onset.
%     Bicep_trial_t=ceil(Bicep_trial/20);                                    % If the onset points are the same reconvert to round up to next point.
% else
%     Bicep_trial_t=Bicep_trial_t;                                           % If the the points are not equal keep it as is.
% end


% Bicep_trial = Bicep_trial_t;

% BT = Bicep_trial;
%% Plot
Elbow_Trial_Time = x;                                             % Exact start time of trial on set.
Elbow_Trial_Value = Elbow_y(y);                                            % Exact value of trial on set in degrees.

if isnan(Bicep_trial)
    E_RTA_Time = NaN;
    E_RTA_Value = NaN;
else
    E_RTA_Time = Elbow_x(Elbow_trial);                                              % Exact time of RTA in seconds.
    E_RTA_Value = Elbow_y(Elbow_trial);                                             % Exact value of RTA in degrees.
end

if isnan(E_RTA_Time)
    Elbow_Delta_Time = NaN;
    Elbow_Delta_Value = NaN;
else
    Elbow_Delta_Time = E_RTA_Time - Elbow_Trial_Time;                      % Time between trial onset and RTA in seconds.
    Elbow_Delta_Value =  E_RTA_Value - Elbow_Trial_Value;                  % Difference between trial on set angle and RTA in degrees. 
end

% figure
% plot(Elbow_x,Elbow_y,Elbow_Trial_Time,Elbow_Trial_Value,'r*', E_RTA_Time,E_RTA_Value,'c*')
% title('Elbow Trial 1')
% xlabel('Time (sec.)')
% ylabel('Joint Angle (º)')

Joint_speed = (Elbow_Trial_Value-min_value)/(Elbow_x(b)-Elbow_Trial_Time); % Calculates joint speed
Elbow_variables(t,:) = [Elbow_Trial_Time, Elbow_Trial_Value, E_RTA_Time, E_RTA_Value, Elbow_Delta_Time, Elbow_Delta_Value, Joint_speed, min_time]; % Stores all the variables for this trial loop.

Elbow_variables(t,:) = [Elbow_y(y), Elbow_y(b)];
%Elbow_variables(t,:) = [Bicep_mean, Bicep_std];

end
Elbow_variables_all = [Elbow_variables(1,:), Elbow_variables(2,:), Elbow_variables(3,:)];
end


