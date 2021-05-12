%% Trial 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc;
participants = [5 6 7 8 9 10 11	12	13	14	15 16 17 18 19	20	21	22	23	24	25	26	27	28 29 30	31	32	33	34 35	36	37	38	39	40	41	42	43	44	45	46	47	48	49	50	51	52	53	54	55	56	59 60 61	62	63	64	65 66 67 68	72	73	75	76	77	78	79	80]; %pre
%participants = [1 2 4 5 6 7 8 10 11	12	13	14	16	17	18 19	20	21	22	23	24	25	26	27	28 29 30	31	32	33	35	36	37	38	39	40	41	42	43	44	45	46	47	48	49	50	51	52	53	54	55	56	59	61	60 62	63	64	67	68	72	73	75	76	77	78	79	80]; %post
%participants = [1 2 8 10 11	16 17	18 19	22	23	24	28 29 30 35	36	37	42 45	48	49	50	51 52 54	55	59 60	62	64	73	76	77	80]; %fol
%participants = [2 4];
%pulled p4 only thenar and hypo
%pulled 1 and 2 
%pulled 7 cause opp3 has early marker on
%pulled p60 T2

%P16 T3 missing wrist ex3 
%P42 T3 missing wrist ex3
%P52 T3 missing triceps3

for l=1:length(participants)
    p = participants(l);
     for t =1%:3
        for s = 3
           
            cd 'C:\Users\cazmo\Documents\Rainmeter\Skins\Droptop Folders\Bookmarks\Subclinical EMG Analysis (1)\subclinical EMG individual trials'
            
Pre_file = load(sprintf('691_P%d_T1_subclinicalEMG_pg_%d',p,s));          
Pre_Name = fieldnames(Pre_file);                                       
%Pre_Name = Pre_Name{3};
% 
%% Marker
Marker_Name = fieldnames(Pre_file);
Marker_Name = Marker_Name{11}; %11 %2

Marker_x = Pre_file.(Marker_Name).times;                                   %Saves the time axis from the Bicep data to a variable, labeled with x for axis it should be plotted on.
Marker_y = Pre_file.(Marker_Name).values;                                  %Saves the bicep data for the elbow to a variable, labeled with y for axis it should be plotted on


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bicep EMG for First Trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Bicep3_Name = fieldnames(Pre_file);
Bicep3_Name = Bicep3_Name{3};

Bicep3_x = Pre_file.(Bicep3_Name).times;                                   %Saves the time axis from the Bicep data to a variable, labeled with x for axis it should be plotted on.
Bicep3_y = Pre_file.(Bicep3_Name).values;                                  %Saves the bicep data for the elbow to a variable, labeled with y for axis it should be plotted on
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%% Finger Flexor EMG Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FingerF3_Name = fieldnames(Pre_file);
FingerF3_Name = FingerF3_Name{6};

Finger3_x = Pre_file.(FingerF3_Name).times;                            %Saves the time axis from the finger flexor data to a variable, labeled with x for axis it should be plotted on. Will also used for a loop since all data are different lengths
Finger3_y = Pre_file.(FingerF3_Name).values;                           %Saves the finger flexor data to a variable, labeled with y for axis it should be plotted on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hypothenar EMG for First Trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Hypothenar emg data
Hypothenar3_Name = fieldnames(Pre_file);
Hypothenar3_Name = Hypothenar3_Name{9}; %9 %5

Hypothenar3_x = Pre_file.(Hypothenar3_Name).times;                                   %Saves the time axis from the Bicep data to a variable, labeled with x for axis it should be plotted on.
Hypothenar3_y = Pre_file.(Hypothenar3_Name).values;                                  %Saves the bicep data for the elbow to a variable, labeled with y for axis it should be plotted on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Thenar EMG for First Trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Thenar emg data
Thenar3_Name = fieldnames(Pre_file);
Thenar3_Name = Thenar3_Name{14}; %14 %8

Thenar3_x = Pre_file.(Thenar3_Name).times;                                   %Saves the time axis from the Bicep data to a variable, labeled with x for axis it should be plotted on.
Thenar3_y = Pre_file.(Thenar3_Name).values;                                  %Saves the bicep data for the elbow to a variable, labeled with y for axis it should be plotted on
%% Tricep EMG for First Trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Tricep3_Name = fieldnames(Pre_file);
Tricep3_Name = Tricep3_Name{17};

Tricep3_x = Pre_file.(Tricep3_Name).times;                                   %Saves the time axis from the Bicep data to a variable, labeled with x for axis it should be plotted on.
Tricep3_y = Pre_file.(Tricep3_Name).values;                                  %Saves the bicep data for the elbow to a variable, labeled with y for axis it should be plotted on
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Wrist Extensor EMG Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
WristEx3_Name = fieldnames(Pre_file);
WristEx3_Name = WristEx3_Name{20};

WristEx3_x = Pre_file.(WristEx3_Name).times;                               %Saves the time axis from the wrist flexor data to a variable, labeled with x for axis it should be plotted on. Will also used for a loop since all data are different lengths
WristEx3_y = Pre_file.(WristEx3_Name).values;                              %Saves the wrist flexor data to a variable, labeled with _y for axis it should be plotted on

% 
%% Wrist Flexor EMG Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
WristFl3_Name = fieldnames(Pre_file);
WristFl3_Name = WristFl3_Name{23};

WristFl3_x = Pre_file.(WristFl3_Name).times;                               %Saves the time axis from the wrist flexor data to a variable, labeled with x for axis it should be plotted on. Will also used for a loop since all data are different lengths
WristFl3_y = Pre_file.(WristFl3_Name).values;                              %Saves the wrist flexor data to a variable, labeled with _y for axis it should be plotted on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    

%% 
 cd 'C:\Users\cazmo\Documents\Rainmeter\Skins\Droptop Folders\Bookmarks\Subclinical EMG Analysis (1)\Subclinical EMG Analysis\Method 4'
 
% plot(Marker_x,Marker_y)
% title(Marker_Name)
% pause
% figure
  
 
 
 run('Marker_Finder');
 run('Bicep');
 run('Finger');
 run('Hypothenar');
 run('Thenar');
 run('Triceps');
 run('Wrist_Ex');
 run('Wrist_Flx');

% Times = [Bicep_Onset; Finger_Onset; Hypothenar_Onset; Thenar_Onset; Tricep_Onset; WristEx_Onset; WristFl_Onset];
% Times = [Hypothenar_Onset; Thenar_Onset; WristEx_Onset];
% Marker_Times = [Marker_start_time Marker_end_time];


Bicep_Marker = Bicep3_x(Bicep3_Marker_ind);
Bicep_Marker_End = Bicep3_x(Bicep3_Marker_end);
[Bicep_peak, Bicep_peak_ind] = max(Bicep3_y(Bicep3_Marker_ind:Bicep3_Marker_end-1));
Bicep_T2P = Bicep3_x((Bicep3_Marker_ind+Bicep_peak_ind)-1);
Bicep_Times = [Bicep_Marker; Bicep_Marker_End; Bicep_Onset; Bicep_T2P; Bicep_FMO; Bicep_Offset];
Bicep_BL = [Bicep3_baseline_avg; Bicep3_STD];


Finger_Marker = Finger3_x(Finger3_Marker_ind);
Finger_Marker_End = Finger3_x(Finger3_Marker_end);
[Finger_peak, Finger_peak_ind] = max(Finger3_y(Finger3_Marker_ind:Finger3_Marker_end-1));
Finger_T2P = Finger3_x((Finger3_Marker_ind+Finger_peak_ind)-1);
Finger_Times = [Finger_Marker; Finger_Marker_End; Finger_Onset; Finger_T2P;  Finger_FMO; Finger_Offset];
Finger_BL = [Finger3_baseline_avg; Finger3_STD];


Hypothenar_Marker = Hypothenar3_x(Hypothenar3_Marker_ind);
Hypothenar_Marker_End = Hypothenar3_x(Hypothenar3_Marker_end);
[Hypothenar_peak, Hypothenar_peak_ind] = max(Hypothenar3_y(Hypothenar3_Marker_ind:Hypothenar3_Marker_end-1));
Hypothenar_T2P = Hypothenar3_x((Hypothenar3_Marker_ind+Hypothenar_peak_ind)-1);
Hypothenar_Times = [Hypothenar_Marker; Hypothenar_Marker_End; Hypothenar_Onset; Hypothenar_T2P; Hypothenar_FMO; Hypothenar_Offset];
Hypothenar_BL = [Hypothenar3_baseline_avg; Hypothenar3_STD];


Thenar_Marker = Thenar3_x(Thenar3_Marker_ind);
Thenar_Marker_End = Thenar3_x(Thenar3_Marker_end);
[Thenar_peak, Thenar_peak_ind] = max(Thenar3_y(Thenar3_Marker_ind:Thenar3_Marker_end-1));
Thenar_T2P = Thenar3_x((Thenar3_Marker_ind+Thenar_peak_ind)-1);
Thenar_Times = [Thenar_Marker; Thenar_Marker_End; Thenar_Onset; Thenar_T2P; Thenar_FMO; Thenar_Offset];
Thenar_BL = [Thenar3_baseline_avg; Thenar3_STD];


Tricep_Marker = Tricep3_x(Tricep3_Marker_ind);
Tricep_Marker_End = Tricep3_x(Tricep3_Marker_end);
[Tricep_peak, Tricep_peak_ind] = max(Tricep3_y(Tricep3_Marker_ind:Tricep3_Marker_end-1));
Tricep_T2P = Tricep3_x((Tricep3_Marker_ind+Tricep_peak_ind)-1);
Tricep_Times = [Tricep_Marker; Tricep_Marker_End; Tricep_Onset; Tricep_T2P; Tricep_FMO; Tricep_Offset];
Tricep_BL = [Tricep3_baseline_avg; Tricep3_STD];


WristFl_Marker = WristFl3_x(WristFl3_Marker_ind);
WristFl_Marker_End = WristFl3_x(WristFl3_Marker_end);
[WristFl_peak, WristFl_peak_ind] = max(WristFl3_y(WristFl3_Marker_ind:WristFl3_Marker_end-1));
WristFl_T2P = WristFl3_x((WristFl3_Marker_ind+WristFl_peak_ind)-1);
WristFl_Times = [WristFl_Marker; WristFl_Marker_End; WristFl_Onset; WristFl_T2P; WristFl_FMO; WristFl_Offset];
WristFl_BL = [WristFl3_baseline_avg; WristFl3_STD];


WristEx_Marker = WristEx3_x(WristEx3_Marker_ind);
WristEx_Marker_End = WristEx3_x(WristEx3_Marker_end);
[WristEx_peak, WristEx_peak_ind] = max(WristEx3_y(WristEx3_Marker_ind:WristEx3_Marker_end-1));
WristEx_T2P = WristEx3_x((WristEx3_Marker_ind+WristEx_peak_ind)-1);
WristEx_Times = [WristEx_Marker; WristEx_Marker_End; WristEx_Onset; WristEx_T2P; WristEx_FMO; WristEx_Offset];
WristEx_BL = [WristEx3_baseline_avg; WristEx3_STD];

EMG_MARKER_TIMES = [Thenar_Marker; Hypothenar_Marker; Finger_Marker; WristEx_Marker; WristFl_Marker; Tricep_Marker; Bicep_Marker];

EMG_MARKER_OFFTIMES =  [Thenar_Marker_End; Hypothenar_Marker_End; Finger_Marker_End; WristEx_Marker_End; WristFl_Marker_End; Tricep_Marker_End; Bicep_Marker_End;];

Onset_Times = [Thenar_Onset; Hypothenar_Onset; Finger_Onset; WristEx_Onset; WristFl_Onset; Tricep_Onset; Bicep_Onset; ];

Offset_Times = [Thenar_Offset; Hypothenar_Offset; Finger_Offset; WristEx_Offset; WristFl_Offset; Tricep_Offset; Bicep_Offset];

FMO_Times = [Thenar_FMO; Hypothenar_FMO; Finger_FMO; WristEx_FMO; WristFl_FMO; Tricep_FMO; Bicep_FMO];


% Total_EMG_Mean = Thenar_trial_mean + Hypothenar_trial_mean + Finger_trial_mean + WristEx_trial_mean + WristFl_trial_mean + Tricep_trial_mean + Bicep_trial_mean;
% 
%Peaks = [Thenar_T2P, Hypothenar_T2P, Finger_T2P, WristEx_T2P, WristFl_T2P, Tricep_T2P, Bicep_T2P];


% Offset = [Offset_Times FMO_Times];

Outcomes(l,:) = [p; Thenar_BL; Hypothenar_BL; Finger_BL; WristEx_BL; WristFl_BL; Tricep_BL; Bicep_BL];

% if s == 1
%     s1 = [EMG_MARKER_TIMES; EMG_MARKER_OFFTIMES; Onset_Times; NaN; Offset_Times; FMO_Times];
% elseif s == 2
%     s2 = [EMG_MARKER_TIMES; EMG_MARKER_OFFTIMES; Onset_Times; NaN; Offset_Times; FMO_Times];
% elseif s == 3
%     s3 = [EMG_MARKER_TIMES; EMG_MARKER_OFFTIMES; Onset_Times; NaN; Offset_Times; FMO_Times];
% end
clearvars -except s1 s2 s3 participants t s p l Outcomes
close all
        end
% %         
%  DATA_1(l,:) = [s1];
%   DATA_2(l,:) = [s2];
%   DATA_3(l,:) = [s3];
    end
end
