%% PRE_STIMULUS BASELINE SUBTRACTED RESPONSES 
%% % All the values are saved as cell arrays (iso cells) so they need to be
% converted to normal arrays and then the 3 maxes need to be extracted
%% 

%Wrist Extensor
PRE_BL_Wrist_ex = TMS_Table(:,45);                                        % Saves the MEP_Rt_wrist_ex column as a cell array (iso cell)
PRE_BL_Wrist_ex = PRE_BL_Wrist_ex(3:end);                                % Saves the MEP_Rt_wrist_ex from the 3rd row (where the values start)to the end
PRE_BL_Wrist_ex=  cell2mat(PRE_BL_Wrist_ex);                             % Converts the cell array into a regular matrix
PRE_BL_Wrist_ex = splitapply(@(x1){round(x1,6)},PRE_BL_Wrist_ex(frame_start:frame_end),G);       % Sorts MEP_Rt_wrist_ex based in the mso groups found before
 
%Thenar
PRE_BL_Thenar = TMS_Table(:,49);                                          % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
PRE_BL_Thenar = PRE_BL_Thenar(3:end);                                    % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
PRE_BL_Thenar = cell2mat(PRE_BL_Thenar);                                 % Converts the cell array into a regular matrix
PRE_BL_Thenar = splitapply(@(x1){round(x1,6)},PRE_BL_Thenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

%Hypothenar
PRE_BL_Hypothenar = TMS_Table(:,50);                                      % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
PRE_BL_Hypothenar = PRE_BL_Hypothenar(3:end);                            % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
PRE_BL_Hypothenar = cell2mat(PRE_BL_Hypothenar);                         % Converts the cell array into a regular matrix
PRE_BL_Hypothenar = splitapply(@(x1){round(x1,6)},PRE_BL_Hypothenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Wrist Extensor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pre-allocating%%%%%%%%%%%%%%%%%%
PRE_SUB_Wrist_ex_data = zeros(1);
PRE_SUB_WRIST_EX_BASELINE_VALUES = zeros(1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


PRE_SUB_Wrist_ex = TMS_Table(:,21);                                         % Saves the MEP_Rt_wrist_ex column as a cell array (iso cell)
PRE_SUB_Wrist_ex = PRE_SUB_Wrist_ex(3:end);                                  % Saves the MEP_Rt_wrist_ex from the 3rd row (where the values start)to the end
PRE_SUB_Wrist_ex=  cell2mat(PRE_SUB_Wrist_ex);                               % Converts the cell array into a regular matrix

PRE_SUB_Wrist_ex = splitapply(@(x1){round(x1,6)},PRE_SUB_Wrist_ex(frame_start:frame_end),G);       % Sorts MEP_Rt_wrist_ex based in the mso groups found before

for i=1:length(PRE_SUB_Wrist_ex)                                            % Each cell array is the stored values for each group. Will run for the number of groups
    [PRE_SUB_Wrist_ex{i}, locs] = sort(PRE_SUB_Wrist_ex{i},'descend');
    
    
    X = frames{i};                                                         % Saving the frames of the current group as temp variable X
    Y = locs;                                                              % Saving the index locations of the group as temp variable Y
    X = X(Y);                                                              % Saving the frames of the group as the correspond to the indexing location                      
    MX = X(1:3);                                                            % Saving the frames of the max 3 of the group
    
    Z = X(2:length(X)-1);
    
    temp =  PRE_SUB_Wrist_ex(i);                                               % Saving cell array as a temp variable
    temp = cell2mat(temp);                                                 % Converting from cell array to matrix
    temp_avtop = mean(temp(1:3));                                          % Taking the mean of the max 3 for the group
    
    temp_avmid = mean(temp(2:end-1));                                      % Taking the mean of the middle 3 for the group                                                 
    
    PRE_SUB_Wrist_ex_data(:,i) = msogrps(i);
    
    PRE_SUB_Wrist_ex_data(2,i) = temp_avtop;   % Saving as final variable
    
    PRE_SUB_Wrist_ex_data(3,i) = temp_avmid;                                     % Saving the mean of the middle 3 of the group
    
    
%    % BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
%         
    temp_stim = PRE_BL_Wrist_ex{i};
    temp_stim = temp_stim(Y);
    
    stim_top = temp_stim(1:3);
    stim_mid = temp_stim(2:end-1);
    
    mean_stim_top = mean(stim_top);
    mean_stim_mid = mean(stim_mid);
    
    combine_temp = [mean_stim_top mean_stim_mid];
    
    PRE_SUB_WRIST_EX_BASELINE_VALUES(i,:) = combine_temp; 
% % BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
end

PRE_SUB_Wrist_ex_data = PRE_SUB_Wrist_ex_data';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Thenar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pre-allocating%%%%%%%%%%%%%%%%%%
PRE_SUB_Thenar_data = zeros(1);
PRE_SUB_THENAR_BASELINE_VALUES = zeros(1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Thenar
PRE_SUB_Thenar = TMS_Table(:,25);                                         % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
PRE_SUB_Thenar = PRE_SUB_Thenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
PRE_SUB_Thenar = cell2mat(PRE_SUB_Thenar);                             % Converts the cell array into a regular matrix

PRE_SUB_Thenar = splitapply(@(x1){round(x1,6)},PRE_SUB_Thenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

for i=1:length(PRE_SUB_Thenar)                                           % Each cell array is the stored values for each group. Will run for the number of groups
    [PRE_SUB_Thenar{i}, locs] = sort(PRE_SUB_Thenar{i},'descend');
    
    
    X = frames{i};                                                         % Saving the frames of the current group as temp variable X
    Y = locs;                                                              % Saving the index locations of the group as temp variable Y
    X = X(Y);                                                              % Saving the frames of the group as the correspond to the indexing location                      
    MX = X(1:3);                                                            % Saving the frames of the max 3 of the group
    
    Z = X(2:length(X)-1);
    
    temp = PRE_SUB_Thenar(i);                                               % Saving cell array as a temp variable
    temp = cell2mat(temp);                                                 % Converting from cell array to matrix
    temp_avtop = mean(temp(1:3));                                          % Taking the mean of the max 3 for the group
    
    temp_avmid = mean(temp(2:end-1));                                      % Taking the mean of the middle 3 for the group                                                 
    
    PRE_SUB_Thenar_data(:,i) = msogrps(i);
    
    PRE_SUB_Thenar_data(2,i) = temp_avtop;   % Saving as final variable
    
    PRE_SUB_Thenar_data(3,i) = temp_avmid;                                     % Saving the mean of the middle 3 of the group
    
    
% BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
        
    temp_stim = PRE_BL_Thenar{i};
    temp_stim = temp_stim(Y);
    
    stim_top = temp_stim(1:3);
    stim_mid = temp_stim(2:end-1);
    
    mean_stim_top = mean(stim_top);
    mean_stim_mid = mean(stim_mid);
    
    combine_temp = [mean_stim_top mean_stim_mid];
    
    PRE_SUB_THENAR_BASELINE_VALUES(i,:) = combine_temp; 
% % BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19      
    
    
end

PRE_SUB_Thenar_data = PRE_SUB_Thenar_data';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hypothenar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pre-allocating%%%%%%%%%%%%%%%%%%
PRE_SUB_Hypothenar_data = zeros(1);
PRE_SUB_HYPOTHENAR_BASELINE_VALUES = zeros(1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


PRE_SUB_Hypothenar = TMS_Table(:,26);                                         % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
PRE_SUB_Hypothenar = PRE_SUB_Hypothenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
PRE_SUB_Hypothenar = cell2mat(PRE_SUB_Hypothenar);                             % Converts the cell array into a regular matrix

PRE_SUB_Hypothenar = splitapply(@(x1){round(x1,6)},PRE_SUB_Hypothenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

for i=1:length(PRE_SUB_Hypothenar)                                           % Each cell array is the stored values for each group. Will run for the number of groups
    [PRE_SUB_Hypothenar{i}, locs] = sort(PRE_SUB_Hypothenar{i},'descend');
    
    
    X = frames{i};                                                         % Saving the frames of the current group as temp variable X
    Y = locs;                                                              % Saving the index locations of the group as temp variable Y
    X = X(Y);                                                              % Saving the frames of the group as the correspond to the indexing location                      
    MX = X(1:3);                                                            % Saving the frames of the max 3 of the group
    
    Z = X(2:length(X)-1);
    
    temp = PRE_SUB_Hypothenar(i);                                               % Saving cell array as a temp variable
    temp = cell2mat(temp);                                                 % Converting from cell array to matrix
    temp_avtop = mean(temp(1:3));                                          % Taking the mean of the max 3 for the group
    
    temp_avmid = mean(temp(2:end-1));                                      % Taking the mean of the middle 3 for the group                                                 
    
    PRE_SUB_Hypothenar_data(:,i) = msogrps(i);
    
    PRE_SUB_Hypothenar_data(2,i) = temp_avtop;   % Saving as final variable
    
    PRE_SUB_Hypothenar_data(3,i) = temp_avmid;                                     % Saving the mean of the middle 3 of the group
    
    
%    % BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
        
    temp_stim = PRE_BL_Hypothenar{i};
    temp_stim = temp_stim(Y);
    
    stim_top = temp_stim(1:3);
    stim_mid = temp_stim(2:end-1);
    
    mean_stim_top = mean(stim_top);
    mean_stim_mid = mean(stim_mid);
    
    combine_temp = [mean_stim_top mean_stim_mid];
    
    PRE_SUB_HYPOTHENAR_BASELINE_VALUES(i,:) = combine_temp; 
% % BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19     
  
end

PRE_SUB_Hypothenar_data = PRE_SUB_Hypothenar_data';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear Unneccesary Variables

clear temp
clear temp_avtop
clear temp_mean
clear X
clear Y


% clear PRE_SUB_Wrist_ex
% clear PRE_SUB_Thenar
% clear PRE_SUB_Hypothenar



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% 
% 
%Wrist Extensor
PRE_SUB_Wrist_ex = TMS_Table(:,21);                                        % Saves the MEP_Rt_wrist_ex column as a cell array (iso cell)
PRE_SUB_Wrist_ex = PRE_SUB_Wrist_ex(3:end);                                % Saves the MEP_Rt_wrist_ex from the 3rd row (where the values start)to the end
PRE_SUB_Wrist_ex=  cell2mat(PRE_SUB_Wrist_ex);                             % Converts the cell array into a regular matrix
PRE_SUB_Wrist_ex = splitapply(@(x1){round(x1,6)},PRE_SUB_Wrist_ex(frame_start:frame_end),G);       % Sorts MEP_Rt_wrist_ex based in the mso groups found before
 
%Thenar
PRE_SUB_Thenar = TMS_Table(:,25);                                          % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
PRE_SUB_Thenar = PRE_SUB_Thenar(3:end);                                    % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
PRE_SUB_Thenar = cell2mat(PRE_SUB_Thenar);                                 % Converts the cell array into a regular matrix
PRE_SUB_Thenar = splitapply(@(x1){round(x1,6)},PRE_SUB_Thenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

%Hypothenar
PRE_SUB_Hypothenar = TMS_Table(:,26);                                      % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
PRE_SUB_Hypothenar = PRE_SUB_Hypothenar(3:end);                            % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
PRE_SUB_Hypothenar = cell2mat(PRE_SUB_Hypothenar);                         % Converts the cell array into a regular matrix
PRE_SUB_Hypothenar = splitapply(@(x1){round(x1,6)},PRE_SUB_Hypothenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%