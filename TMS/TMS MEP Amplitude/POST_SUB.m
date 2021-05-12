%% POST_STIMULUS BASELINE SUBTRACTED RESPONSES
%% % All the values are saved as cell arrays (iso cells) so they need to be
% converted to normal arrays and then the 3 maxes need to be extracted


%% BASELINE VALUES 
POST_BL_Wrist_ex = TMS_Table(:,37);                                      % Saves the MEP_Rt_wrist_ex column as a cell array (iso cell)
POST_BL_Wrist_ex = POST_BL_Wrist_ex(3:end);                            % Saves the MEP_Rt_wrist_ex from the 3rd row (where the values start)to the end
POST_BL_Wrist_ex=  cell2mat(POST_BL_Wrist_ex);                         % Converts the cell array into a regular matrix
POST_BL_Wrist_ex = splitapply(@(x1){round(x1,6)},POST_BL_Wrist_ex(frame_start:frame_end),G);       % Sorts MEP_Rt_wrist_ex based in the mso groups found before

POST_BL_Thenar = TMS_Table(:,41);                                        % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
POST_BL_Thenar = POST_BL_Thenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
POST_BL_Thenar = cell2mat(POST_BL_Thenar);                             % Converts the cell array into a regular matrix
POST_BL_Thenar = splitapply(@(x1){round(x1,6)},POST_BL_Thenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

POST_BL_Hypothenar = TMS_Table(:,42);                                         % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
POST_BL_Hypothenar = POST_BL_Hypothenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
POST_BL_Hypothenar = cell2mat(POST_BL_Hypothenar);                             % Converts the cell array into a regular matrix
POST_BL_Hypothenar = splitapply(@(x1){round(x1,6)},POST_BL_Hypothenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Wrist Extensor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pre-allocating%%%%%%%%%%%%%%%%%%
POST_SUB_Wrist_ex_data = zeros(1);
POST_SUB_WRIST_EX_BASELINE_VALUES = zeros(1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



POST_SUB_Wrist_ex = TMS_Table(:,13);                                         % Saves the MEP_Rt_wrist_ex column as a cell array (iso cell)
POST_SUB_Wrist_ex = POST_SUB_Wrist_ex(3:end);                                  % Saves the MEP_Rt_wrist_ex from the 3rd row (where the values start)to the end
POST_SUB_Wrist_ex=  cell2mat(POST_SUB_Wrist_ex);                               % Converts the cell array into a regular matrix

POST_SUB_Wrist_ex = splitapply(@(x1){round(x1,6)},POST_SUB_Wrist_ex(frame_start:frame_end),G);       % Sorts MEP_Rt_wrist_ex based in the mso groups found before

for i=1:length(POST_SUB_Wrist_ex)                                            % Each cell array is the stored values for each group. Will run for the number of groups
    [POST_SUB_Wrist_ex{i}, locs] = sort(POST_SUB_Wrist_ex{i},'descend');
    
    
    X = frames{i};                                                         % Saving the frames of the current group as temp variable X
    Y = locs;                                                              % Saving the index locations of the group as temp variable Y
    X = X(Y);                                                              % Saving the frames of the group as the correspond to the indexing location                      
    MX = X(1:3);                                                            % Saving the frames of the max 3 of the group
    
    Z = X(2:length(X)-1);
    
    temp = POST_SUB_Wrist_ex(i);                                               % Saving cell array as a temp variable
    temp = cell2mat(temp);                                                 % Converting from cell array to matrix

    temp_avtop = mean(temp(1:3));                                          % Taking the mean of the max 3 for the group
    
    temp_avmid = mean(temp(2:end-1));                                      % Taking the mean of the middle 3 for the group                                                 
    
    POST_SUB_Wrist_ex_data(:,i) = msogrps(i);
    
    
    POST_SUB_Wrist_ex_data(2,i) = temp_avtop;   % Saving as final variable
    
    POST_SUB_Wrist_ex_data(3,i) = temp_avmid;                                     % Saving the mean of the middle 3 of the group
    
    
     
    % BASELINE VALUES based on SUB values ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
        
    temp_BL = POST_BL_Wrist_ex{i};
    temp_BL = temp_BL(Y);
    
    BL_top = temp_BL(1:3);
    BL_mid = temp_BL(2:end-1);
    
   
    mean_BL_top = mean(BL_top);
    mean_BL_mid = mean(BL_mid);
  
    combine_temp = [mean_BL_top mean_BL_mid];
    
    POST_SUB_WRIST_EX_BASELINE_VALUES(i,:) = combine_temp; 
% BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
end



POST_SUB_Wrist_ex_data = POST_SUB_Wrist_ex_data';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Thenar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pre-allocating%%%%%%%%%%%%%%%%%%
POST_SUB_Thenar_data = zeros(1);
POST_SUB_THENAR_BASELINE_VALUES = zeros(1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Thenar
POST_SUB_Thenar = TMS_Table(:,17);                                         % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
POST_SUB_Thenar = POST_SUB_Thenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
POST_SUB_Thenar = cell2mat(POST_SUB_Thenar);                             % Converts the cell array into a regular matrix

POST_SUB_Thenar = splitapply(@(x1){round(x1,6)},POST_SUB_Thenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

for i=1:length(POST_SUB_Thenar)                                           % Each cell array is the stored values for each group. Will run for the number of groups
    [POST_SUB_Thenar{i}, locs] = sort(POST_SUB_Thenar{i},'descend');
    
    
    X = frames{i};                                                         % Saving the frames of the current group as temp variable X
    Y = locs;                                                              % Saving the index locations of the group as temp variable Y
    X = X(Y);                                                              % Saving the frames of the group as the correspond to the indexing location                      
    MX = X(1:3);                                                            % Saving the frames of the max 3 of the group
    
    Z = X(2:length(X)-1);
    
    temp = POST_SUB_Thenar(i);                                               % Saving cell array as a temp variable
    temp = cell2mat(temp);                                                 % Converting from cell array to matrix
    temp_avtop = mean(temp(1:3));                                          % Taking the mean of the max 3 for the group
    
    temp_avmid = mean(temp(2:end-1));                                      % Taking the mean of the middle 3 for the group                                                 
    
    POST_SUB_Thenar_data(:,i) = msogrps(i);
    
    
    POST_SUB_Thenar_data(2,i) = temp_avtop;   % Saving as final variable
    
    POST_SUB_Thenar_data(3,i) = temp_avmid;                                     % Saving the mean of the middle 3 of the group
    
    
    
    
%     % BASELINE VALUES based on SUB values ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
%         
    temp_BL = POST_BL_Thenar{i};
    temp_BL = temp_BL(Y);
    
    BL_top = temp_BL(1:3);
    BL_mid = temp_BL(2:end-1);
    
    
    mean_BL_top = mean(BL_top);
    mean_BL_mid = mean(BL_mid);
    
    
    combine_temp = [mean_BL_top mean_BL_mid];
    
    POST_SUB_THENAR_BASELINE_VALUES(i,:) = combine_temp; 
% % BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19     
end

POST_SUB_Thenar_data = POST_SUB_Thenar_data';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hypothenar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pre-allocating%%%%%%%%%%%%%%%%%%
POST_SUB_Hypothenar_data = zeros(1);
POST_SUB_HYPOTHENAR_BASELINE_VALUES = zeros(1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


POST_SUB_Hypothenar = TMS_Table(:,18);                                         % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
POST_SUB_Hypothenar = POST_SUB_Hypothenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
POST_SUB_Hypothenar = cell2mat(POST_SUB_Hypothenar);                             % Converts the cell array into a regular matrix

POST_SUB_Hypothenar = splitapply(@(x1){round(x1,6)},POST_SUB_Hypothenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

for i=1:length(POST_SUB_Hypothenar)                                           % Each cell array is the stored values for each group. Will run for the number of groups
    [POST_SUB_Hypothenar{i}, locs] = sort(POST_SUB_Hypothenar{i},'descend');
    
    
    X = frames{i};                                                         % Saving the frames of the current group as temp variable X
    Y = locs;                                                              % Saving the index locations of the group as temp variable Y
    X = X(Y);                                                              % Saving the frames of the group as the correspond to the indexing location                      
    MX = X(1:3);                                                            % Saving the frames of the max 3 of the group
    
    Z = X(2:length(X)-1);
    
    temp = POST_SUB_Hypothenar(i);                                               % Saving cell array as a temp variable
    temp = cell2mat(temp);                                                 % Converting from cell array to matrix
    temp_avtop = mean(temp(1:3));                                          % Taking the mean of the max 3 for the group
    
    temp_avmid = mean(temp(2:end-1));                                      % Taking the mean of the middle 3 for the group                                                 
    
    POST_SUB_Hypothenar_data(:,i) = msogrps(i);
    

    POST_SUB_Hypothenar_data(2,i) = temp_avtop;   % Saving as final variable
    
    POST_SUB_Hypothenar_data(3,i) = temp_avmid;                                     % Saving the mean of the middle 3 of the group
    

    
%     % BASELINE VALUES based on SUB values ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
%         
    temp_BL = POST_BL_Hypothenar{i};
    temp_BL = temp_BL(Y);
    
    BL_top = temp_BL(1:3);
    BL_mid = temp_BL(2:end-1);
    
    mean_BL_top = mean(BL_top);
    mean_BL_mid = mean(BL_mid);
    
    combine_temp = [mean_BL_top mean_BL_mid];
    
    POST_SUB_HYPOTHENAR_BASELINE_VALUES(i,:) = combine_temp; 
% % BASELINE VALUES based on SUB values ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19    
end

POST_SUB_Hypothenar_data = POST_SUB_Hypothenar_data';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear Unneccesary Variables

clear temp
clear temp_avtop
clear temp_mean
clear X
clear Y


% clear POST_SUB_Wrist_ex
% clear POST_SUB_Thenar
% clear POST_SUB_Hypothenar


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%
%Wrist Extensor
POST_SUB_Wrist_ex = TMS_Table(:,13);                                         % Saves the MEP_Rt_wrist_ex column as a cell array (iso cell)
POST_SUB_Wrist_ex = POST_SUB_Wrist_ex(3:end);                                  % Saves the MEP_Rt_wrist_ex from the 3rd row (where the values start)to the end
POST_SUB_Wrist_ex=  cell2mat(POST_SUB_Wrist_ex);                               % Converts the cell array into a regular matrix
POST_SUB_Wrist_ex = splitapply(@(x1){round(x1,6)},POST_SUB_Wrist_ex(frame_start:frame_end),G);       % Sorts MEP_Rt_wrist_ex based in the mso groups found before

%Thenar
POST_SUB_Thenar = TMS_Table(:,17);                                         % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
POST_SUB_Thenar = POST_SUB_Thenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
POST_SUB_Thenar = cell2mat(POST_SUB_Thenar);                             % Converts the cell array into a regular matrix
POST_SUB_Thenar = splitapply(@(x1){round(x1,6)},POST_SUB_Thenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

%Hypothenar
POST_SUB_Hypothenar = TMS_Table(:,18);                                         % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
POST_SUB_Hypothenar = POST_SUB_Hypothenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
POST_SUB_Hypothenar = cell2mat(POST_SUB_Hypothenar);                             % Converts the cell array into a regular matrix
POST_SUB_Hypothenar = splitapply(@(x1){round(x1,6)},POST_SUB_Hypothenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%