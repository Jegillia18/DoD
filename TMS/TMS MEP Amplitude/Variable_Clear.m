%% Priority Variables
clear MEP
clear MT_MEP
clear MT_MEP_BOTH
clear MT_POST_SUB
clear MT_POST_SUB_BOTH
clear MT_PRE_SUB
clear MT_PRE_SUB_BOTH
clear POST_SUB
clear PRE_SUB



%% 

clear frame_end
clear frame_start
clear frames
clear G
clear i
clear locs
clear MSO
clear msogrps
clear n

clear sheet

clear MEP_Finger_Fl
clear MEP_Wrist_ex
clear MEP_Wrist_flx
clear MEP_Triceps
clear MEP_Biceps
clear MEP_Thenar
clear MEP_Hypothenar

clear MEP_Finger_Fl_data
clear MEP_Wrist_ex_data
clear MEP_Wrist_flx_data
clear MEP_Triceps_data
clear MEP_Biceps_data
clear MEP_Thenar_data
clear MEP_Hypothenar_data

clear MT_MEP_Finger_Fl
clear MT_MEP_Wrist_ex
clear MT_MEP_Wrist_flx
clear MT_MEP_Triceps
clear MT_MEP_Biceps
clear MT_MEP_Thenar
clear MT_MEP_Hypothenar

clear MT_MEP_Finger_Fl_B
clear MT_MEP_Wrist_ex_B
clear MT_MEP_Wrist_flx_B
clear MT_MEP_Triceps_B
clear MT_MEP_Biceps_B
clear MT_MEP_Thenar_B
clear MT_MEP_Hypothenar_B

clear MT_MEP_Finger_Fl_avg
clear MT_MEP_Wrist_ex_avg
clear MT_MEP_Wrist_flx_avg
clear MT_MEP_Triceps_avg
clear MT_MEP_Biceps_avg
clear MT_MEP_Thenar_avg
clear MT_MEP_Hypothenar_avg

clear MT_MEP_Finger_Fl_avg_B
clear MT_MEP_Wrist_ex_avg_B
clear MT_MEP_Wrist_flx_avg_B
clear MT_MEP_Triceps_avg_B
clear MT_MEP_Biceps_avg_B
clear MT_MEP_Thenar_avg_B
clear MT_MEP_Hypothenar_avg_B

clear MT_MEP_Finger_Fl_avg_Q
clear MT_MEP_Wrist_ex_avg_Q
clear MT_MEP_Wrist_flx_avg_Q
clear MT_MEP_Triceps_avg_Q
clear MT_MEP_Biceps_avg_Q
clear MT_MEP_Thenar_avg_Q
clear MT_MEP_Hypothenar_avg_Q

clear MT_MEP_Finger_Fl_values_200
clear MT_MEP_Wrist_ex_values_200
clear MT_MEP_Wrist_flx_values_200
clear MT_MEP_Triceps_values_200
clear MT_MEP_Biceps_values_200
clear MT_MEP_Thenar_values_200
clear MT_MEP_Hypothenar_values_200

clear MT_MEP_Finger_Fl_values_200_B
clear MT_MEP_Wrist_ex_values_200_B
clear MT_MEP_Wrist_flx_values_200_B
clear MT_MEP_Triceps_values_200_B
clear MT_MEP_Biceps_values_200_B
clear MT_MEP_Thenar_values_200_B
clear MT_MEP_Hypothenar_values_200_B

clear MT_MEP_Finger_Fl_values_50
clear MT_MEP_Wrist_ex_values_50
clear MT_MEP_Wrist_flx_values_50
clear MT_MEP_Triceps_values_50
clear MT_MEP_Biceps_values_50
clear MT_MEP_Thenar_values_50
clear MT_MEP_Hypothenar_values_50

clear MT_MEP_Finger_Fl_values_50_B
clear MT_MEP_Wrist_ex_values_50_B
clear MT_MEP_Wrist_flx_values_50_B
clear MT_MEP_Triceps_values_50_B
clear MT_MEP_Biceps_values_50_B
clear MT_MEP_Thenar_values_50_B
clear MT_MEP_Hypothenar_values_50_B

clear MT_MEP_Finger_Fl_values_Q
clear MT_MEP_Wrist_ex_values_Q
clear MT_MEP_Wrist_flx_values_Q
clear MT_MEP_Triceps_values_Q
clear MT_MEP_Biceps_values_Q
clear MT_MEP_Thenar_values_Q
clear MT_MEP_Hypothenar_values_Q

clear MT_MEP_Finger_Fl_Q
clear MT_MEP_Wrist_ex_Q
clear MT_MEP_Wrist_flx_Q
clear MT_MEP_Triceps_Q
clear MT_MEP_Biceps_Q
clear MT_MEP_Thenar_Q
clear MT_MEP_Hypothenar_Q



clear POST_SUB_Finger_Fl
clear POST_SUB_Wrist_ex
clear POST_SUB_Wrist_flx
clear POST_SUB_Triceps
clear POST_SUB_Biceps
clear POST_SUB_Thenar
clear POST_SUB_Hypothenar

clear POST_SUB_Finger_Fl_data
clear POST_SUB_Wrist_ex_data
clear POST_SUB_Wrist_flx_data
clear POST_SUB_Triceps_data
clear POST_SUB_Biceps_data
clear POST_SUB_Thenar_data
clear POST_SUB_Hypothenar_data

clear MT_POST_SUB_Finger_Fl
clear MT_POST_SUB_Wrist_ex
clear MT_POST_SUB_Wrist_flx
clear MT_POST_SUB_Triceps
clear MT_POST_SUB_Biceps
clear MT_POST_SUB_Thenar
clear MT_POST_SUB_Hypothenar

clear MT_POST_SUB_Finger_Fl_B
clear MT_POST_SUB_Wrist_ex_B
clear MT_POST_SUB_Wrist_flx_B
clear MT_POST_SUB_Triceps_B
clear MT_POST_SUB_Biceps_B
clear MT_POST_SUB_Thenar_B
clear MT_POST_SUB_Hypothenar_B

clear MT_POST_SUB_Finger_Fl_avg
clear MT_POST_SUB_Wrist_ex_avg
clear MT_POST_SUB_Wrist_flx_avg
clear MT_POST_SUB_Triceps_avg
clear MT_POST_SUB_Biceps_avg
clear MT_POST_SUB_Thenar_avg
clear MT_POST_SUB_Hypothenar_avg

clear MT_POST_SUB_Finger_Fl_avg_B
clear MT_POST_SUB_Wrist_ex_avg_B
clear MT_POST_SUB_Wrist_flx_avg_B
clear MT_POST_SUB_Triceps_avg_B
clear MT_POST_SUB_Biceps_avg_B
clear MT_POST_SUB_Thenar_avg_B
clear MT_POST_SUB_Hypothenar_avg_B

clear MT_POST_SUB_Finger_Fl_avg_Q
clear MT_POST_SUB_Wrist_ex_avg_Q
clear MT_POST_SUB_Wrist_flx_avg_Q
clear MT_POST_SUB_Triceps_avg_Q
clear MT_POST_SUB_Biceps_avg_Q
clear MT_POST_SUB_Thenar_avg_Q
clear MT_POST_SUB_Hypothenar_avg_Q

clear MT_POST_SUB_Finger_Fl_values_50
clear MT_POST_SUB_Wrist_ex_values_50
clear MT_POST_SUB_Wrist_flx_values_50
clear MT_POST_SUB_Triceps_values_50
clear MT_POST_SUB_Biceps_values_50
clear MT_POST_SUB_Thenar_values_50
clear MT_POST_SUB_Hypothenar_values_50

clear MT_POST_SUB_Finger_Fl_values_50_B
clear MT_POST_SUB_Wrist_ex_values_50_B
clear MT_POST_SUB_Wrist_flx_values_50_B
clear MT_POST_SUB_Triceps_values_50_B
clear MT_POST_SUB_Biceps_values_50_B
clear MT_POST_SUB_Thenar_values_50_B
clear MT_POST_SUB_Hypothenar_values_50_B


clear MT_POST_SUB_Finger_Fl_baseline
clear MT_POST_SUB_Wrist_ex_baseline
clear MT_POST_SUB_Wrist_flx_baseline
clear MT_POST_SUB_Triceps_baseline
clear MT_POST_SUB_Biceps_baseline
clear MT_POST_SUB_Thenar_baseline
clear MT_POST_SUB_Hypothenar_baseline

clear MT_POST_SUB_Finger_Fl_BOTH_baseline
clear MT_POST_SUB_Wrist_ex_BOTH_baseline
clear MT_POST_SUB_Wrist_flx_BOTH_baseline
clear MT_POST_SUB_Triceps_BOTH_baseline
clear MT_POST_SUB_Biceps_BOTH_baseline
clear MT_POST_SUB_Thenar_BOTH_baseline
clear MT_POST_SUB_Hypothenar_BOTH_baseline

clear MT_POST_SUB_Finger_Fl_QUAL_baseline
clear MT_POST_SUB_Wrist_ex_QUAL_baseline
clear MT_POST_SUB_Wrist_flx_QUAL_baseline
clear MT_POST_SUB_Triceps_QUAL_baseline
clear MT_POST_SUB_Biceps_QUAL_baseline
clear MT_POST_SUB_Thenar_QUAL_baseline
clear MT_POST_SUB_Hypothenar_QUAL_baseline

clear MT_POST_SUB_Finger_Fl_values_Q
clear MT_POST_SUB_Wrist_ex_values_Q
clear MT_POST_SUB_Wrist_flx_values_Q
clear MT_POST_SUB_Triceps_values_Q
clear MT_POST_SUB_Biceps_values_Q
clear MT_POST_SUB_Thenar_values_Q
clear MT_POST_SUB_Hypothenar_values_Q

clear MT_POST_SUB_Finger_Fl_Q
clear MT_POST_SUB_Wrist_ex_Q
clear MT_POST_SUB_Wrist_flx_Q
clear MT_POST_SUB_Triceps_Q
clear MT_POST_SUB_Biceps_Q
clear MT_POST_SUB_Thenar_Q
clear MT_POST_SUB_Hypothenar_Q

clear MT_POST_BASELINE
clear MT_POST_BASELINE_BOTH
clear MT_POST_BASELINE_QUAL


clear PRE_SUB_Finger_Fl
clear PRE_SUB_Wrist_ex
clear PRE_SUB_Wrist_flx
clear PRE_SUB_Triceps
clear PRE_SUB_Biceps
clear PRE_SUB_Thenar
clear PRE_SUB_Hypothenar

clear PRE_SUB_Finger_Fl_data
clear PRE_SUB_Wrist_ex_data
clear PRE_SUB_Wrist_flx_data
clear PRE_SUB_Triceps_data
clear PRE_SUB_Biceps_data
clear PRE_SUB_Thenar_data
clear PRE_SUB_Hypothenar_data

clear MT_PRE_SUB_Finger_Fl
clear MT_PRE_SUB_Wrist_ex
clear MT_PRE_SUB_Wrist_flx
clear MT_PRE_SUB_Triceps
clear MT_PRE_SUB_Biceps
clear MT_PRE_SUB_Thenar
clear MT_PRE_SUB_Hypothenar

clear MT_PRE_SUB_Finger_Fl_B
clear MT_PRE_SUB_Wrist_ex_B
clear MT_PRE_SUB_Wrist_flx_B
clear MT_PRE_SUB_Triceps_B
clear MT_PRE_SUB_Biceps_B
clear MT_PRE_SUB_Thenar_B
clear MT_PRE_SUB_Hypothenar_B

clear MT_PRE_SUB_Finger_Fl_avg
clear MT_PRE_SUB_Wrist_ex_avg
clear MT_PRE_SUB_Wrist_flx_avg
clear MT_PRE_SUB_Triceps_avg
clear MT_PRE_SUB_Biceps_avg
clear MT_PRE_SUB_Thenar_avg
clear MT_PRE_SUB_Hypothenar_avg

clear MT_PRE_SUB_Finger_Fl_avg_B
clear MT_PRE_SUB_Wrist_ex_avg_B
clear MT_PRE_SUB_Wrist_flx_avg_B
clear MT_PRE_SUB_Triceps_avg_B
clear MT_PRE_SUB_Biceps_avg_B
clear MT_PRE_SUB_Thenar_avg_B
clear MT_PRE_SUB_Hypothenar_avg_B


clear MT_PRE_SUB_Finger_Fl_avg_Q
clear MT_PRE_SUB_Wrist_ex_avg_Q
clear MT_PRE_SUB_Wrist_flx_avg_Q
clear MT_PRE_SUB_Triceps_avg_Q
clear MT_PRE_SUB_Biceps_avg_Q
clear MT_PRE_SUB_Thenar_avg_Q
clear MT_PRE_SUB_Hypothenar_avg_Q

clear MT_PRE_SUB_Finger_Fl_values_50
clear MT_PRE_SUB_Wrist_ex_values_50
clear MT_PRE_SUB_Wrist_flx_values_50
clear MT_PRE_SUB_Triceps_values_50
clear MT_PRE_SUB_Biceps_values_50
clear MT_PRE_SUB_Thenar_values_50
clear MT_PRE_SUB_Hypothenar_values_50

clear MT_PRE_SUB_Finger_Fl_values_50_B
clear MT_PRE_SUB_Wrist_ex_values_50_B
clear MT_PRE_SUB_Wrist_flx_values_50_B
clear MT_PRE_SUB_Triceps_values_50_B
clear MT_PRE_SUB_Biceps_values_50_B
clear MT_PRE_SUB_Thenar_values_50_B
clear MT_PRE_SUB_Hypothenar_values_50_B


clear MT_PRE_SUB_Finger_Fl_baseline
clear MT_PRE_SUB_Wrist_ex_baseline
clear MT_PRE_SUB_Wrist_flx_baseline
clear MT_PRE_SUB_Triceps_baseline
clear MT_PRE_SUB_Biceps_baseline
clear MT_PRE_SUB_Thenar_baseline
clear MT_PRE_SUB_Hypothenar_baseline

clear MT_PRE_SUB_Finger_Fl_BOTH_baseline
clear MT_PRE_SUB_Wrist_ex_BOTH_baseline
clear MT_PRE_SUB_Wrist_flx_BOTH_baseline
clear MT_PRE_SUB_Triceps_BOTH_baseline
clear MT_PRE_SUB_Biceps_BOTH_baseline
clear MT_PRE_SUB_Thenar_BOTH_baseline
clear MT_PRE_SUB_Hypothenar_BOTH_baseline

clear MT_PRE_SUB_Finger_Fl_QUAL_baseline
clear MT_PRE_SUB_Wrist_ex_QUAL_baseline
clear MT_PRE_SUB_Wrist_flx_QUAL_baseline
clear MT_PRE_SUB_Triceps_QUAL_baseline
clear MT_PRE_SUB_Biceps_QUAL_baseline
clear MT_PRE_SUB_Thenar_QUAL_baseline
clear MT_PRE_SUB_Hypothenar_QUAL_baseline


clear MT_PRE_SUB_Finger_Fl_values_Q
clear MT_PRE_SUB_Wrist_ex_values_Q
clear MT_PRE_SUB_Wrist_flx_values_Q
clear MT_PRE_SUB_Triceps_values_Q
clear MT_PRE_SUB_Biceps_values_Q
clear MT_PRE_SUB_Thenar_values_Q
clear MT_PRE_SUB_Hypothenar_values_Q

clear MT_PRE_SUB_Finger_Fl_Q
clear MT_PRE_SUB_Wrist_ex_Q
clear MT_PRE_SUB_Wrist_flx_Q
clear MT_PRE_SUB_Triceps_Q
clear MT_PRE_SUB_Biceps_Q
clear MT_PRE_SUB_Thenar_Q
clear MT_PRE_SUB_Hypothenar_Q

clear MT_PRE_BASELINE
clear MT_PRE_BASELINE_BOTH
clear MT_PRE_BASELINE_QUAL




clear Q_Finger_Fl
clear Q_Wrist_ex
clear Q_Wrist_flx
clear Q_Triceps
clear Q_Biceps
clear Q_Thenar
clear Q_Hypothenar

clear TR_Finger_Fl
clear TR_Wrist_ex
clear TR_Wrist_flx
clear TR_Triceps
clear TR_Biceps
clear TR_Thenar
clear TR_Hypothenar


clear temp
clear temp_avtop
clear temp_mean
clear temp_MEP
clear temp_SUB
clear TR_grps
clear TR_Lft_hypothenar
clear TR_Lft_hypothenar_test
clear TR_Lft_thenar
clear TR_Lft_thenar_test
clear TR_Lft_wrist_ex
clear TR_Lft_wrist_ex_test
clear TR_Rt_hypothenar
clear TR_Rt_hypothenar_test
clear TR_Rt_thenar
clear TR_Rt_thenar_test
clear TR_Rt_wrist_ex
clear TR_Rt_wrist_ex_test
clear TRLHT
clear TRLTT
clear TRLW
clear TRRHT
clear TRRT
clear TRRW
clear X
clear Y

clear MEP_Lft_hypothenar_data
clear MEP_Lft_thenar_data
clear MEP_Lft_wrist_ex_data
clear MEP_Rt_hypothenar_data
clear MEP_Rt_thenar_data
clear MEP_Rt_wrist_ex_data

clear SUB_Lft_hypothenar_data
clear SUB_Lft_thenar_data
clear SUB_Lft_wrist_ex_data
clear SUB_Rt_hypothenar_data
clear SUB_Rt_thenar_data
clear SUB_Rt_wrist_ex_data

clear TR_Lft_hypothenar_data
clear TR_Lft_thenar_data
clear TR_Lft_wrist_ex_data
clear TR_Rt_hypothenar_data
clear TR_Rt_thenar_data
clear TR_Rt_wrist_ex_data

clear MT_MEP_Rt_thenar
clear MT_MEP_Rt_hypothenar
clear MT_MEP_Rt_wrist_ex
clear MT_SUB_Rt_hypothenar
clear MT_SUB_Rt_thenar
clear MT_SUB_Rt_wrist_ex

clear MT_MEP_Lft_thenar
clear MT_MEP_Lft_hypothenar
clear MT_MEP_Lft_wrist_ex
clear MT_SUB_Lft_hypothenar
clear MT_SUB_Lft_thenar
clear MT_SUB_Lft_wrist_ex

clear POST_STIM_Finger_Fl
clear POST_STIM_Wrist_ex
clear POST_STIM_Wrist_flx
clear POST_STIM_Triceps
clear POST_STIM_Biceps
clear POST_STIM_Thenar
clear POST_STIM_Hypothenar

clear POST_STIM_Finger_Fl_avg
clear POST_STIM_Wrist_ex_avg
clear POST_STIM_Wrist_flx_avg
clear POST_STIM_Triceps_avg
clear POST_STIM_Biceps_avg
clear POST_STIM_Thenar_avg
clear POST_STIM_Hypothenar_avg

clear POST_STIM_Finger_Fl_avg_B
clear POST_STIM_Wrist_ex_avg_B
clear POST_STIM_Wrist_flx_avg_B
clear POST_STIM_Triceps_avg_B
clear POST_STIM_Biceps_avg_B
clear POST_STIM_Thenar_avg_B
clear POST_STIM_Hypothenar_avg_B

clear POST_STIM_Finger_Fl_avg_Q
clear POST_STIM_Wrist_ex_avg_Q
clear POST_STIM_Wrist_flx_avg_Q
clear POST_STIM_Triceps_avg_Q
clear POST_STIM_Biceps_avg_Q
clear POST_STIM_Thenar_avg_Q
clear POST_STIM_Hypothenar_avg_Q

clear POST_STIM_Finger_Fl_values
clear POST_STIM_Wrist_ex_values
clear POST_STIM_Wrist_flx_values
clear POST_STIM_Triceps_values
clear POST_STIM_Biceps_values
clear POST_STIM_Thenar_values
clear POST_STIM_Hypothenar_values

clear POST_STIM_Finger_Fl_values_B
clear POST_STIM_Wrist_ex_values_B
clear POST_STIM_Wrist_flx_values_B
clear POST_STIM_Triceps_values_B
clear POST_STIM_Biceps_values_B
clear POST_STIM_Thenar_values_B
clear POST_STIM_Hypothenar_values_B

clear POST_STIM_Finger_Fl_values_Q
clear POST_STIM_Wrist_ex_values_Q
clear POST_STIM_Wrist_flx_values_Q
clear POST_STIM_Triceps_values_Q
clear POST_STIM_Biceps_values_Q
clear POST_STIM_Thenar_values_Q
clear POST_STIM_Hypothenar_values_Q

clear PRE_STIM_Finger_Fl
clear PRE_STIM_Wrist_ex
clear PRE_STIM_Wrist_flx
clear PRE_STIM_Triceps
clear PRE_STIM_Biceps
clear PRE_STIM_Thenar
clear PRE_STIM_Hypothenar

clear PRE_STIM_Finger_Fl_avg
clear PRE_STIM_Wrist_ex_avg
clear PRE_STIM_Wrist_flx_avg
clear PRE_STIM_Triceps_avg
clear PRE_STIM_Biceps_avg
clear PRE_STIM_Thenar_avg
clear PRE_STIM_Hypothenar_avg

clear PRE_STIM_Finger_Fl_avg_B
clear PRE_STIM_Wrist_ex_avg_B
clear PRE_STIM_Wrist_flx_avg_B
clear PRE_STIM_Triceps_avg_B
clear PRE_STIM_Biceps_avg_B
clear PRE_STIM_Thenar_avg_B
clear PRE_STIM_Hypothenar_avg_B

clear PRE_STIM_Finger_Fl_avg_Q
clear PRE_STIM_Wrist_ex_avg_Q
clear PRE_STIM_Wrist_flx_avg_Q
clear PRE_STIM_Triceps_avg_Q
clear PRE_STIM_Biceps_avg_Q
clear PRE_STIM_Thenar_avg_Q
clear PRE_STIM_Hypothenar_avg_Q

clear PRE_STIM_Finger_Fl_values
clear PRE_STIM_Wrist_ex_values
clear PRE_STIM_Wrist_flx_values
clear PRE_STIM_Triceps_values
clear PRE_STIM_Biceps_values
clear PRE_STIM_Thenar_values
clear PRE_STIM_Hypothenar_values

clear PRE_STIM_Finger_Fl_values_B
clear PRE_STIM_Wrist_ex_values_B
clear PRE_STIM_Wrist_flx_values_B
clear PRE_STIM_Triceps_values_B
clear PRE_STIM_Biceps_values_B
clear PRE_STIM_Thenar_values_B
clear PRE_STIM_Hypothenar_values_B

clear PRE_STIM_Finger_Fl_values_Q
clear PRE_STIM_Wrist_ex_values_Q
clear PRE_STIM_Wrist_flx_values_Q
clear PRE_STIM_Triceps_values_Q
clear PRE_STIM_Biceps_values_Q
clear PRE_STIM_Thenar_values_Q
clear PRE_STIM_Hypothenar_values_Q

%%%%%%%%%%%%%%NEW%%%%%%%%%%%%%%%%%%%
clear POST_SUB_FINGER_FL_BASELINE_VALUES
clear POST_SUB_WRIST_EX_BASELINE_VALUES
clear POST_SUB_WRIST_FLX_BASELINE_VALUES
clear POST_SUB_TRICEPS_BASELINE_VALUES
clear POST_SUB_BICEPS_BASELINE_VALUES
clear POST_SUB_THENAR_BASELINE_VALUES
clear POST_SUB_HYPOTHENAR_BASELINE_VALUES

clear PRE_SUB_FINGER_FL_BASELINE_VALUES
clear PRE_SUB_WRIST_EX_BASELINE_VALUES
clear PRE_SUB_WRIST_FLX_BASELINE_VALUES
clear PRE_SUB_TRICEPS_BASELINE_VALUES
clear PRE_SUB_BICEPS_BASELINE_VALUES
clear PRE_SUB_THENAR_BASELINE_VALUES
clear PRE_SUB_HYPOTHENAR_BASELINE_VALUES

clear POST_SUB_BASELINE_VALUES
clear PRE_SUB_BASELINE_VALUES

clear POST_MEP_FINGER_FL_BASELINE_VALUES
clear POST_MEP_WRIST_EX_BASELINE_VALUES
clear POST_MEP_WRIST_FLX_BASELINE_VALUES
clear POST_MEP_TRICEPS_BASELINE_VALUES
clear POST_MEP_BICEPS_BASELINE_VALUES
clear POST_MEP_THENAR_BASELINE_VALUES
clear POST_MEP_HYPOTHENAR_BASELINE_VALUES

clear PRE_MEP_FINGER_FL_BASELINE_VALUES
clear PRE_MEP_WRIST_EX_BASELINE_VALUES
clear PRE_MEP_WRIST_FLX_BASELINE_VALUES
clear PRE_MEP_TRICEPS_BASELINE_VALUES
clear PRE_MEP_BICEPS_BASELINE_VALUES
clear PRE_MEP_THENAR_BASELINE_VALUES
clear PRE_MEP_HYPOTHENAR_BASELINE_VALUES

clear POST_MEP_BASELINE_VALUES
clear PRE_MEP_BASELINE_VALUES
