%% MEP Response (Cursor 1-2)
%% % All the values are saved as cell arrays (iso cells) so they need to be
% converted to normal arrays and then the 3 maxes need to be extracted

%% 



POST_BL_Wrist_ex = TMS_Table(:,37);                                         % Saves the MEP_Rt_wrist_ex column as a cell array (iso cell)
POST_BL_Wrist_ex = POST_BL_Wrist_ex(3:end);                                  % Saves the MEP_Rt_wrist_ex from the 3rd row (where the values start)to the end
POST_BL_Wrist_ex=  cell2mat(POST_BL_Wrist_ex);                               % Converts the cell array into a regular matrix
POST_BL_Wrist_ex = splitapply(@(x1){round(x1,6)},POST_BL_Wrist_ex(frame_start:frame_end),G);       % Sorts MEP_Rt_wrist_ex based in the mso groups found before

POST_BL_Thenar = TMS_Table(:,41);                                         % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
POST_BL_Thenar = POST_BL_Thenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
POST_BL_Thenar = cell2mat(POST_BL_Thenar);                             % Converts the cell array into a regular matrix
POST_BL_Thenar = splitapply(@(x1){round(x1,6)},POST_BL_Thenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

POST_BL_Hypothenar = TMS_Table(:,42);                                         % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
POST_BL_Hypothenar = POST_BL_Hypothenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
POST_BL_Hypothenar = cell2mat(POST_BL_Hypothenar);                             % Converts the cell array into a regular matrix
POST_BL_Hypothenar = splitapply(@(x1){round(x1,6)},POST_BL_Hypothenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

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
%Pre-allocating%%%%%%%
MEP_Wrist_ex_data = zeros(1);
POST_WRIST_EX_BASELINE = zeros(1,2);
PRE_WRIST_EX_BASELINE = zeros(1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MEP_Wrist_ex = TMS_Table(:,5);                                             % Saves the MEP for designated muscle column as a cell array (iso cell)
MEP_Wrist_ex = MEP_Wrist_ex(3:end);                                        % Saves the MEP for designated muscle from the 3rd row (where the values start)to the end
MEP_Wrist_ex=  cell2mat(MEP_Wrist_ex);                                     % Converts the cell array into a regular matrix

MEP_Wrist_ex = splitapply(@(x1){round(x1,6)},MEP_Wrist_ex(frame_start:frame_end),G);       % Creates groups based on the found MSO groups (G)

for i=1:length(MEP_Wrist_ex)                                               % Each cell array is the stored values for each group. Will run for the number of groups
    [MEP_Wrist_ex{i}, locs] = sort(MEP_Wrist_ex{i},'descend');              % Sorts each group (cell arrays) in descending order
    
    
    X = frames{i};                                                         % Saving the frames of the current group as temp variable X
    Y = locs;                                                              % Saving the index locations of the group as temp variable Y
    X = X(Y);                                                              % Saving the frames of the group as the correspond to the indexing location                      
    MX = X(1:3);                                                            % Saving the frames of the max 3 of the group
    
    Z = X(2:length(X)-1);
    
    temp = MEP_Wrist_ex(i);                                               % Saving cell array as a temp variable
    temp = cell2mat(temp);                                                 % Converting from cell array to matrix
    temp_avtop = mean(temp(1:3));                                          % Taking the mean of the max 3 for the group
    
    temp_avmid = mean(temp(2:end-1));                                      % Taking the mean of the middle 3 for the group
    
    MEP_Wrist_ex_data(:,i) = msogrps(i);
    
    MEP_Wrist_ex_data(2,i) = temp_avtop;                                   % Saving the mean of the max 3 of the group 
   
    MEP_Wrist_ex_data(3,i) = temp_avmid;                                   % Saving the mean of the middle 3 of the group
    
   
    
 % BASELINE Based on MEP VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
        
    PS_temp_BL = POST_BL_Wrist_ex{i};
    PS_temp_BL = PS_temp_BL(Y);
    
    PS_BL_top = PS_temp_BL(1:3);
    PS_BL_mid = PS_temp_BL(2:end-1);
    
   
    PS_mean_BL_top = mean(PS_BL_top);
    PS_mean_BL_mid = mean(PS_BL_mid);
 
    
    PS_combine_temp = [PS_mean_BL_top PS_mean_BL_mid];
    
    POST_WRIST_EX_BASELINE(i,:) = PS_combine_temp; 
% BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
   
% BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
        
    PR_temp_BL = PRE_BL_Wrist_ex{i};
    PR_temp_BL = PR_temp_BL(Y);
    
    PR_BL_top = PR_temp_BL(1:3);
    PR_BL_mid = PR_temp_BL(2:end-1);
    
   
    PR_mean_BL_top = mean(PR_BL_top);
    PR_mean_BL_mid = mean(PR_BL_mid);

    
    PR_combine_temp = [PR_mean_BL_top PR_mean_BL_mid];
    
    PRE_WRIST_EX_BASELINE(i,:) = PR_combine_temp; 
% BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19

end

%MEP_Wrist_ex_data = MEP_Wrist_ex_data';                                    % Transposing variable for organization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Thenar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Pre-allocating%%%%%%%
MEP_Thenar_data = zeros(1);
POST_THENAR_BASELINE = zeros(1,2);
PRE_THENAR_BASELINE = zeros(1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Thenar
MEP_Thenar = TMS_Table(:,9);                                               % Saves the MEP for designated muscle column as a cell array (iso cell)
MEP_Thenar = MEP_Thenar(3:end);                                            % Saves the MEP for designated muscle from the 3rd row (where the values start)to the end
MEP_Thenar = cell2mat(MEP_Thenar);                                         % Converts the cell array into a regular matrix

MEP_Thenar = splitapply(@(x1){round(x1,6)},MEP_Thenar(frame_start:frame_end),G);      % Creates groups based on the found MSO groups (G)

for i=1:length(MEP_Thenar)                                                 % Each cell array is the stored values for each group. Will run for the number of groups
    [MEP_Thenar{i}, locs] = sort(MEP_Thenar{i},'descend');                  % Sorts each group (cell arrays) in descending order
    
    
    X = frames{i};                                                         % Saving the frames of the current group as temp variable X
    Y = locs;                                                              % Saving the index locations of the group as temp variable Y
    X = X(Y);                                                              % Saving the frames of the group as the correspond to the indexing location                      
    MX = X(1:3);                                                            % Saving the frames of the max 3 of the group
    
    Z = X(2:length(X)-1);
    
    temp = MEP_Thenar(i);                                               % Saving cell array as a temp variable
    temp = cell2mat(temp);                                                 % Converting from cell array to matrix
    temp_avtop = mean(temp(1:3));                                          % Taking the mean of the max 3 for the group
   
    temp_avmid = mean(temp(2:end-1));                                      % Taking the mean of the middle 3 for the group
    
    MEP_Thenar_data(:,i) = msogrps(i);                                     % Saving the mso value that corresponds with the current group
    

    MEP_Thenar_data(2,i) = temp_avtop;                                     % Saving the mean of the max 3 of the group 
    
    MEP_Thenar_data(3,i) = temp_avmid;                                     % Saving the mean of the middle 3 of the group
    
        % BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
        
    PS_temp_BL = POST_BL_Thenar{i};
    PS_temp_BL = PS_temp_BL(Y);
    
    PS_BL_top = PS_temp_BL(1:3);
    PS_BL_mid = PS_temp_BL(2:end-1);
    
    
    PS_mean_BL_top = mean(PS_BL_top);
    PS_mean_BL_mid = mean(PS_BL_mid);
    
    
    PS_combine_temp = [PS_mean_BL_top PS_mean_BL_mid];
    
    POST_THENAR_BASELINE(i,:) = PS_combine_temp; 
% BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19     
    
        % BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
        
     PR_temp_BL = PRE_BL_Thenar{i};
    PR_temp_BL = PR_temp_BL(Y);
    
    PR_BL_top = PR_temp_BL(1:3);
    PR_BL_mid = PR_temp_BL(2:end-1);
    
    
    PR_mean_BL_top = mean(PR_BL_top);
    PR_mean_BL_mid = mean(PR_BL_mid);
   
    PR_combine_temp = [PR_mean_BL_top PR_mean_BL_mid];
    
    PRE_THENAR_BASELINE(i,:) = PR_combine_temp; 
% BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19      
    
end

%MEP_Thenar_data = MEP_Thenar_data';                                        % Transposing variable for organization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hypothenar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Pre-allocating%%%%%%%
MEP_Hypothenar_data = zeros(1);
POST_HYPOTHENAR_BASELINE = zeros(1,2);
PRE_HYPOTHENAR_BASELINE = zeros(1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



MEP_Hypothenar = TMS_Table(:,10);                                          % Saves the MEP for designated muscle column as a cell array (iso cell)
MEP_Hypothenar = MEP_Hypothenar(3:end);                                    % Saves the MEP for designated muscle from the 3rd row (where the values start)to the end
MEP_Hypothenar = cell2mat(MEP_Hypothenar);                                 % Converts the cell array into a regular matrix

MEP_Hypothenar = splitapply(@(x1){round(x1,6)},MEP_Hypothenar(frame_start:frame_end),G);      % Creates groups based on the found MSO groups (G)

for i=1:length(MEP_Hypothenar)                                             % Each cell array is the stored values for each group. Will run for the number of groups
    [MEP_Hypothenar{i}, locs] = sort(MEP_Hypothenar{i},'descend');          % Sorts each group (cell arrays) in descending order
    
    
    X = frames{i};                                                         % Saving the frames of the current group as temp variable X
    Y = locs;                                                              % Saving the index locations of the group as temp variable Y
    X = X(Y);                                                              % Saving the frames of the group as the correspond to the indexing location                      
    MX = X(1:3);                                                            % Saving the frames of the max 3 of the group
    
    Z = X(2:length(X)-1);
    
    temp = MEP_Hypothenar(i);                                               % Saving cell array as a temp variable
    temp = cell2mat(temp);                                                 % Converting from cell array to matrix
    
    temp_avtop = mean(temp(1:3));                                          % Taking the mean of the max 3 for the group
    
    temp_avmid = mean(temp(2:end-1));                                      % Taking the mean of the middle 3 for the group                                                 
    
    MEP_Hypothenar_data(:,i) = msogrps(i);                                 % Saving the mso value that corresponds with the current group
    
  
    MEP_Hypothenar_data(2,i) = temp_avtop;                                 % Saving the mean of the max 3 of the group 
    
    MEP_Hypothenar_data(3,i) = temp_avmid;                                     % Saving the mean of the middle 3 of the group
    
    
        % BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
        
    PS_temp_BL = POST_BL_Hypothenar{i};
    PS_temp_BL = PS_temp_BL(Y);
    
    PS_BL_top = PS_temp_BL(1:3);
    PS_BL_mid = PS_temp_BL(2:end-1);
    
    
    PS_mean_BL_top = mean(PS_BL_top);
    PS_mean_BL_mid = mean(PS_BL_mid);
    
    
    PS_combine_temp = [PS_mean_BL_top PS_mean_BL_mid];
    
    POST_HYPOTHENAR_BASELINE(i,:) = PS_combine_temp; 
% BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
        
   % BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19
        
    PR_temp_BL = PRE_BL_Hypothenar{i};
    PR_temp_BL = PR_temp_BL(Y);
    
    PR_BL_top = PR_temp_BL(1:3);
    PR_BL_mid = PR_temp_BL(2:end-1);
    
    
    PR_mean_BL_top = mean(PR_BL_top);
    PR_mean_BL_mid = mean(PR_BL_mid);
    
    
    PR_combine_temp = [PR_mean_BL_top PR_mean_BL_mid];
    
    PRE_HYPOTHENAR_BASELINE(i,:) = PR_combine_temp; 
% BASELINE STIM VALUES ADDITION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2/26/19     


end

%MEP_Hypothenar_data = MEP_Hypothenar_data';                                % Transposing variable for organization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear Unneccesary Variables

clear temp
clear temp_avtop
clear temp_mean
clear X
clear Y


clear MEP_Wrist_ex
clear MEP_Thenar
clear MEP_Hypothenar

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MEP Response (Cursor 1-2)

%Wrist Extensor
MEP_Wrist_ex = TMS_Table(:,5);                                         
MEP_Wrist_ex = MEP_Wrist_ex(3:end);                                  
MEP_Wrist_ex=  cell2mat(MEP_Wrist_ex);                               
MEP_Wrist_ex = splitapply(@(x1){round(x1,6)},MEP_Wrist_ex(frame_start:frame_end),G);       

%Thenar
MEP_Thenar = TMS_Table(:,9);                                         
MEP_Thenar = MEP_Thenar(3:end);                                
MEP_Thenar = cell2mat(MEP_Thenar);                             
MEP_Thenar = splitapply(@(x1){round(x1,6)},MEP_Thenar(frame_start:frame_end),G);      

%Hypothenar
MEP_Hypothenar = TMS_Table(:,10);                                         
MEP_Hypothenar = MEP_Hypothenar(3:end);                               
MEP_Hypothenar = cell2mat(MEP_Hypothenar);                             
MEP_Hypothenar = splitapply(@(x1){round(x1,6)},MEP_Hypothenar(frame_start:frame_end),G);      

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%