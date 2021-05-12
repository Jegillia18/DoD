%% Combine
%% MEP CODE

%Comes from MEP code. This is the pre and post Baselines mean values of teh
%max 3 and mid 3 based on the cooresponding values for MEP.
POST_WRIST_EX_BASELINE = [msogrps POST_WRIST_EX_BASELINE];
POST_THENAR_BASELINE = [msogrps POST_THENAR_BASELINE];
POST_HYPOTHENAR_BASELINE = [msogrps POST_HYPOTHENAR_BASELINE];

PRE_WRIST_EX_BASELINE = [msogrps PRE_WRIST_EX_BASELINE];
PRE_THENAR_BASELINE = [msogrps PRE_THENAR_BASELINE];
PRE_HYPOTHENAR_BASELINE = [msogrps PRE_HYPOTHENAR_BASELINE];

POST_BASELINE_VALUES = [POST_WRIST_EX_BASELINE; POST_THENAR_BASELINE; POST_HYPOTHENAR_BASELINE]; %*********** BASELINE Excel
PRE_BASELINE_VALUES = [PRE_WRIST_EX_BASELINE; PRE_THENAR_BASELINE; PRE_HYPOTHENAR_BASELINE]; %*********** BASELINE Excel

%% POST SUB CODE

%Comes from Post sub  code. This is the pre and post Baselines mean values
%of the max 3 and mid 3 based on the cooresponding values for sub values.

%POST_SUB_BASELINE_VALUES = [POST_SUB_WRIST_EX_BASELINE_VALUES; POST_SUB_THENAR_BASELINE_VALUES; POST_SUB_HYPOTHENAR_BASELINE_VALUES]; %BASELINE Excel

POST_SUB_Wrist_ex_data = [POST_SUB_Wrist_ex_data POST_SUB_WRIST_EX_BASELINE_VALUES];
POST_SUB_Thenar_data = [POST_SUB_Thenar_data POST_SUB_THENAR_BASELINE_VALUES];
POST_SUB_Hypothenar_data = [POST_SUB_Hypothenar_data POST_SUB_HYPOTHENAR_BASELINE_VALUES];

%Comes from Post sub  code.mean values of the max 3 and mid 3
POST_SUB = [POST_SUB_Wrist_ex_data; POST_SUB_Thenar_data; POST_SUB_Hypothenar_data]; %*********** %SUB_MEP excel

%% PRE SUB CODE

%Comes from Pre sub  code. This is the pre and post Baselines mean values
%of the max 3 and mid 3 based on the cooresponding values for sub values.

%PRE_SUB_BASELINE_VALUES = [PRE_SUB_WRIST_EX_BASELINE_VALUES; PRE_SUB_THENAR_BASELINE_VALUES; PRE_SUB_HYPOTHENAR_BASELINE_VALUES]; %BASELINE Excel

PRE_SUB_Wrist_ex_data = [PRE_SUB_Wrist_ex_data PRE_SUB_WRIST_EX_BASELINE_VALUES];
PRE_SUB_Thenar_data = [PRE_SUB_Thenar_data PRE_SUB_THENAR_BASELINE_VALUES];
PRE_SUB_Hypothenar_data = [PRE_SUB_Hypothenar_data PRE_SUB_HYPOTHENAR_BASELINE_VALUES];

%Comes from Pre sub  code.mean values of the max 3 and mid 3
PRE_SUB = [PRE_SUB_Wrist_ex_data; PRE_SUB_Thenar_data; PRE_SUB_Hypothenar_data]; %*********** %SUB_MEP excel

%% MT CODE

% MT_MEP_Wrist_ex = [MT_MEP_Wrist_ex_avg MT_MEP_Wrist_ex_values];
% MT_MEP_Thenar = [MT_MEP_Thenar_avg MT_MEP_Thenar_values];
% MT_MEP_Hypothenar = [MT_MEP_Hypothenar_avg MT_MEP_Hypothenar_values];
% % Combining previous
% 
% MT_MEP = [MT_MEP_Wrist_ex; MT_MEP_Thenar; MT_MEP_Hypothenar]; %*********** BASELINE Excel

MEP_BL_Wrist_ex_post = [MEP_BL_Wrist_ex_avg_post MEP_BL_Wrist_ex_values_post];
MEP_BL_Thenar_post = [MEP_BL_Thenar_avg_post MEP_BL_Thenar_values_post];
MEP_BL_Hypothenar_post = [MEP_BL_Hypothenar_avg_post MEP_BL_Hypothenar_values_post];
 
MEP_BL_POST = [MEP_BL_Wrist_ex_post; MEP_BL_Thenar_post; MEP_BL_Hypothenar_post]; %*********** BASELINE Excel

MEP_BL_Wrist_ex_pre = [MEP_BL_Wrist_ex_avg_pre MEP_BL_Wrist_ex_values_pre];
MEP_BL_Thenar_pre = [MEP_BL_Thenar_avg_pre MEP_BL_Thenar_values_pre];
MEP_BL_Hypothenar_pre = [MEP_BL_Hypothenar_avg_pre MEP_BL_Hypothenar_values_pre];

MEP_BL_PRE = [MEP_BL_Wrist_ex_pre; MEP_BL_Thenar_pre; MEP_BL_Hypothenar_pre]; %*********** BASELINE Excel


% From MT code. These are the post sub and baseline values that meet numeric
% criteria
MT_POST_SUB_Wrist_ex = [MT_POST_SUB_Wrist_ex_avg POST_BL_Wrist_ex_avg MT_POST_SUB_Wrist_ex_values POST_BL_Wrist_ex_values];
MT_POST_SUB_Thenar = [MT_POST_SUB_Thenar_avg POST_BL_Thenar_avg  MT_POST_SUB_Thenar_values POST_BL_Thenar_values];
MT_POST_SUB_Hypothenar = [MT_POST_SUB_Hypothenar_avg POST_BL_Hypothenar_avg MT_POST_SUB_Hypothenar_values POST_BL_Hypothenar_values];
%Combining previous
MT_POST_SUB = [MT_POST_SUB_Wrist_ex; MT_POST_SUB_Thenar; MT_POST_SUB_Hypothenar]; %*********** %SUB_MEP excel

% From MT code. These are the post sub and baseline values that meet numeric
% criteria
MT_PRE_SUB_Wrist_ex_avg = [MT_PRE_SUB_Wrist_ex_avg PRE_BL_Wrist_ex_avg MT_PRE_SUB_Wrist_ex_values PRE_BL_Wrist_ex_values];
MT_PRE_SUB_Thenar_avg = [MT_PRE_SUB_Thenar_avg PRE_BL_Thenar_avg MT_PRE_SUB_Thenar_values PRE_BL_Thenar_values];
MT_PRE_SUB_Hypothenar_avg = [MT_PRE_SUB_Hypothenar_avg PRE_BL_Hypothenar_avg MT_PRE_SUB_Hypothenar_values PRE_BL_Hypothenar_values];
%Combining previous
MT_PRE_SUB = [MT_PRE_SUB_Wrist_ex_avg; MT_PRE_SUB_Thenar_avg; MT_PRE_SUB_Hypothenar_avg]; %*********** %SUB_MEP excel

%% FINAL OUTPUTS
%clearvars -except POST_BASELINE_VALUES PRE_BASELINE_VALUES POST_SUB PRE_SUB MT_MEP MEP_BL_POST MEP_BL_PRE MT_POST_SUB MT_PRE_SUB



