%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code to load and analyze spacticity Data 
% Cazmon Suri
% Note: Code can be adjusted to include and exclude data
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Wrist_variables_all]=Wrist_Function(u)
% This for loop will run 3 times for each trial analyzing the outcome
% measures and saving them each time.
for t=1:3                                                                  % This variable corresponds to the trials (1-3). Should not need to be changed.

s=3;                                                                       % This variable corresponds to the session (pre=1, post=2, follow=3). Change the number depending on the session you are analyzing.
    
Wrist_file = load(sprintf('691_P%d_T%d_UEspasticity_wrist_%d',u,s,t));     % Loads and Stores all the data from spike in a variable tree. 


                                                                           % "%d" is a place holder that can be subbed for the value a specified variable. 
                                                                           % Usually in the respective order they are writen at the end of a command. See line 12. 
                                                                           % P%d - corresponds to the subject. The current value of  the "u" variable from the main
                                                                           % script will be subbed in here.
                                                                           % T%d - corresponds to the session. The variable "s" will be subbed in here.
                                                                           % wrist_%d - corresponds to the trial number. The current value of "t" will
                                                                           % be subbed in here.


Wrist_Name = fieldnames(Wrist_file);                                       % Creates a cell array with vectors of names of fields
Wrist_Name = Wrist_Name{3};                                                % Stores the joint data as a variable.
                                                                           % The number corresponds with a place in the varaible tree. 3 is for the joint.

                                                                                                                                                    
Wrist_x = Wrist_file.(Wrist_Name).times;                                   % Saves the time axis from the wrist joint data to a variable, labeled with x for axis it should be plotted on.
Wrist_y = Wrist_file.(Wrist_Name).values;                                  % Saves the joint data for the wrist to a variable, labeled with y for axis it should be plotted on.
                                                                           

[a,b]=min(Wrist_y);                                                        % Finds the value and location of full joint extension.
                                                           
min_value = a;                                                             % Saves the value of full joint extension. 
min_time = Wrist_x(b);



Wrist_std = std(Wrist_y(450:550));                                         % Calculates the standard deviation for 1 second approximately prior to the start of the trial.  
Wrist_mean = mean(Wrist_y(450:550));                                       % Calculates the mean for 1 second approximately prior to the start of the trial.
Trial = Wrist_mean-(2.5*Wrist_std);                                        % Calculates the value that will be used to find the start of the trial.

for i=450:length(Wrist_y)                                                  % Sets the loop to look for start of the trail from 4.5 seconds to the end.
            
       if Wrist_y(i) < Trial && Wrist_y(i+1) < Trial && Wrist_y(i+2) < Trial % Conditional statement for trial onset. Conditions set here must be met.
       x=i;                                                                % Variable x will be saved at current i if conditions are met.
            break                                                          % Loop will break when the conditions have been met.
        else
            x=[];                                                          % Variable x will remain blank if conditions are not met.
       end       
end
y=x;
x = Wrist_x(x);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Wrist Flexor EMG Data

WristFl_Name = fieldnames(Wrist_file);                                     % Creates a cell array with vectors of names of fields
WristFl_Name = WristFl_Name{7};                                            % Stores the desired data as a variable. Change number depending on muscle.

WristFl_x = Wrist_file.(WristFl_Name).times;                               % Saves the time axis from the wrist flexor data to a variable, labeled with x for axis it should be plotted on.
WristFl_y = Wrist_file.(WristFl_Name).values;                              % Saves the wrist flexor data for the wrist to a variable, labeled with y for axis it should be plotted on

[~, trial_end] =  min(abs(WristFl_x - min_time));

if length(trial_end) ~= 1
  trial_end(2) = [];
end


WristFl_mean = mean(WristFl_y(1000:11000));                                % Calculates the standard deviation of the first 5 seconds of the file. 
WristFl_std = std(WristFl_y(1000:11000));                                  % Calculates the mean of the first 5 seconds of the file.

WristFl_finder = WristFl_mean+(3*WristFl_std);                           % Calculates the value that will be used to find RTA.

[~, trial_start] =  min(abs(WristFl_x - x));

if length(trial_start) ~= 1
  trial_start(2) = [];
end

for i=trial_start+1:trial_end                                                      % Will search from the start of trial to time of full joint extension                                           

    if WristFl_y(i) > WristFl_finder && WristFl_y(i+1) > WristFl_finder && WristFl_y(i+2) > WristFl_finder && WristFl_y(i+3) > WristFl_finder && WristFl_y(i+4) > WristFl_finder && WristFl_y(i+5) > WristFl_finder && WristFl_y(i+6) > WristFl_finder && WristFl_y(i+7) > WristFl_finder && WristFl_y(i+8) > WristFl_finder && WristFl_y(i+9) > WristFl_finder && WristFl_y(i+10) > WristFl_finder && WristFl_y(i+11) > WristFl_finder && WristFl_y(i+12) > WristFl_finder && WristFl_y(i+13) > WristFl_finder && WristFl_y(i+14) > WristFl_finder && WristFl_y(i+15) > WristFl_finder && WristFl_y(i+16) > WristFl_finder && WristFl_y(i+17) > WristFl_finder && WristFl_y(i+18) > WristFl_finder && WristFl_y(i+19) > WristFl_finder && WristFl_y(i+20) > WristFl_finder && WristFl_y(i+21) > WristFl_finder && WristFl_y(i+22) > WristFl_finder && WristFl_y(i+23) > WristFl_finder && WristFl_y(i+24) > WristFl_finder && WristFl_y(i+25) > WristFl_finder && WristFl_y(i+26) > WristFl_finder && WristFl_y(i+27) > WristFl_finder && WristFl_y(i+28) > WristFl_finder && WristFl_y(i+29) > WristFl_finder %&& WristFl_y(i+30) > WristFl_finder && WristFl_y(i+31) > WristFl_finder && WristFl_y(i+32) > WristFl_finder && WristFl_y(i+33) > WristFl_finder && WristFl_y(i+34) > WristFl_finder && WristFl_y(i+35) > WristFl_finder && WristFl_y(i+36) > WristFl_finder && WristFl_y(i+37) > WristFl_finder && WristFl_y(i+38) > WristFl_finder && WristFl_y(i+39) > WristFl_finder && WristFl_y(i+40) > WristFl_finder && WristFl_y(i+41) > WristFl_finder && WristFl_y(i+42) > WristFl_finder && WristFl_y(i+43) > WristFl_finder && WristFl_y(i+44) > WristFl_finder && WristFl_y(i+45) > WristFl_finder && WristFl_y(i+46) > WristFl_finder && WristFl_y(i+47) > WristFl_finder && WristFl_y(i+48) > WristFl_finder && WristFl_y(i+49) > WristFl_finder && WristFl_y(i+50) > WristFl_finder && WristFl_y(i+51) > WristFl_finder && WristFl_y(i+52) > WristFl_finder && WristFl_y(i+53) > WristFl_finder && WristFl_y(i+54) > WristFl_finder && WristFl_y(i+55) > WristFl_finder && WristFl_y(i+56) > WristFl_finder && WristFl_y(i+57) > WristFl_finder && WristFl_y(i+58) > WristFl_finder && WristFl_y(i+59) > WristFl_finder && WristFl_y(i+60) > WristFl_finder && WristFl_y(i+61) > WristFl_finder && WristFl_y(i+62) > WristFl_finder && WristFl_y(i+63) > WristFl_finder && WristFl_y(i+64) > WristFl_finder && WristFl_y(i+65) > WristFl_finder && WristFl_y(i+66) > WristFl_finder && WristFl_y(i+67) > WristFl_finder && WristFl_y(i+68) > WristFl_finder && WristFl_y(i+69) > WristFl_finder && WristFl_y(i+70) > WristFl_finder && WristFl_y(i+71) > WristFl_finder && WristFl_y(i+72) > WristFl_finder && WristFl_y(i+73) > WristFl_finder && WristFl_y(i+74) > WristFl_finder && WristFl_y(i+75) > WristFl_finder && WristFl_y(i+76) > WristFl_finder && WristFl_y(i+77) > WristFl_finder && WristFl_y(i+78) > WristFl_finder && WristFl_y(i+79) > WristFl_finder && WristFl_y(i+80) > WristFl_finder && WristFl_y(i+81) > WristFl_finder && WristFl_y(i+82) > WristFl_finder && WristFl_y(i+83) > WristFl_finder && WristFl_y(i+84) > WristFl_finder && WristFl_y(i+85) > WristFl_finder && WristFl_y(i+86) > WristFl_finder && WristFl_y(i+87) > WristFl_finder && WristFl_y(i+88) > WristFl_finder && WristFl_y(i+89) > WristFl_finder && WristFl_y(i+90) > WristFl_finder && WristFl_y(i+91) > WristFl_finder && WristFl_y(i+92) > WristFl_finder && WristFl_y(i+93) > WristFl_finder && WristFl_y(i+94) > WristFl_finder && WristFl_y(i+95) > WristFl_finder && WristFl_y(i+96) > WristFl_finder && WristFl_y(i+97) > WristFl_finder && WristFl_y(i+98) > WristFl_finder && WristFl_y(i+99) > WristFl_finder
       WristFl_trial=i;                                                    % Variable will be saved at current i
            break                                                          % Loop will break when the conditions have been met
        else
            WristFl_trial=NaN;                                             % Variable will remain blank if conditions are not met.
    end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Finally Check to make sure the EMG point is not rounded to the same point as the Joint Angle

if ~isnan(WristFl_trial) 
WristFl_trial = WristFl_x(WristFl_trial);   %putting it in Bicep time domain

[~, Wrist_trial] =  min(abs(Wrist_x - WristFl_trial));  % finding the nearest corresponding time from Bicep time domain to Elbow time domain

if length(Wrist_trial) ~= 1
  Wrist_trial(2) = [];
end

end


% WristFl_trial_t = round(WristFl_trial/20);                                 % Converting the previously found Wrist Flexor onset to the same frequency as joint angle.
% if WristFl_trial_t==x                                                      % Checking to make sure that the Wrist Flexor onset is not the same as the joint angle onset.
%     WristFl_trial_t=ceil(WristFl_trial/20);                                % If the onset points are the same re convert to round up to next point.
% else
%     WristFl_trial_t=WristFl_trial_t;                                       % If the the points are not equal keep it as is.
% end
% 
% 
% WristFl_trial = WristFl_trial_t;
% 
% WFT = WristFl_trial;
%% Plot
Wrist_Trial_Time = x;                                             % Exact start time of trial on set.
Wrist_Trial_Value = Wrist_y(y);                                            % Exact value of trial on set in degrees.

if isnan(WristFl_trial)
    W_RTA_Time = NaN;
    W_RTA_Value = NaN;
else
    W_RTA_Time = Wrist_x(Wrist_trial);                                             % Exact time of RTA in seconds.
    W_RTA_Value = Wrist_y(Wrist_trial);                                            % Exact value of RTA in degrees.
end

if isnan(W_RTA_Time)
    Wrist_Delta_Time = NaN;
    Wrist_Delta_Value = NaN;
else
    Wrist_Delta_Time = W_RTA_Time - Wrist_Trial_Time;                      % Time between trial onset and RTA in seconds.
    Wrist_Delta_Value =  W_RTA_Value - Wrist_Trial_Value;                  % Difference between trial on set angle and RTA in degrees. 
end


% figure
% plot(Wrist_x,Wrist_y, Wrist_Trial_Time,Wrist_Trial_Value,'r*', W_RTA_Time,W_RTA_Value,'c*')
% title('Wrist Trial 1')
% xlabel('Time (sec.)')
% ylabel('Joint Angle (º)')

%Joint_speed = (Wrist_Trial_Value-min_value)/(Wrist_x(b)-Wrist_Trial_Time); % Calculates joint speed
%Wrist_variables(t,:) = [Wrist_Trial_Time, Wrist_Trial_Value, W_RTA_Time, W_RTA_Value, Wrist_Delta_Time, Wrist_Delta_Value, Joint_speed, min_time]; % Stores all the variables for this trial loop.
%Wrist_variables(t,:) = [Wrist_y(y), Wrist_y(b)];

Wrist_variables(t,:) = [Wrist_mean, Wrist_std];
end
Wrist_variables_all = [Wrist_variables(1,:), Wrist_variables(2,:), Wrist_variables(3,:)];
end



