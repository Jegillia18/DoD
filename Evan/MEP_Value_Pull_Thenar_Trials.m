%% Import data from spreadsheet
% 
%%IMP -- imports specifically from Thenar trials 1-10 not the average
%
%    Method 1:
% Onset1: 3 consecutive points above MCD
% Offset1: 3 consecutive points below MCD
% Onset2: 3 consecutive points above MCD
% Offset2: 3 consecutive points below MCD
% 
%    Method 2:
% Onset1: 5 consecutive points above MCD
% Offset1: 5 consecutive points below MCD
% Onset2: 5 consecutive points above MCD
% Offset2: 5 consecutive points below MCD

% Total peaks above MCD/SD it will look for is 5, on/off 


clear
clc

set = [10:31,35:45,48:56,59:65,67,68,72,75,77,78,79,80];
warning('off','all')

for y = 1:length(set)
    p = set(y);
    MEP_Data.(['Participant_',num2str(p),]) = table();
    
     data = sprintf('691_P%d_pre_corticalexcitability-MCD data_thenar.xlsx',p);
     
opts = spreadsheetImportOptions("NumVariables", 12);

% Specify sheet and range
opts.Sheet = "Averages";
opts.DataRange = "A1:L352";

% Specify column names and types
opts.VariableNames = ["s", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "thenaravg"];
opts.SelectedVariableNames = ["s", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "thenaravg"];
opts.VariableTypes = ["double","double", "double", "double", "double", "double","double", "double", "double", "double","double", "double"];

% Specify variable properties
% opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11"], "WhitespaceRule", "preserve");
% opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11"], "EmptyFieldRule", "auto");

% Import the data
P10precorticalexcitabilityMCDdatathenar1 = readtable(data, opts, "UseExcel", false);


%% Clear temporary variables
clear opts


opts = spreadsheetImportOptions("NumVariables", 22);

% Specify sheet and range
opts.Sheet = "Averages";
opts.DataRange = "A352:V353";

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "VarName20", "Var21", "VarName22"];
opts.SelectedVariableNames = ["VarName20", "VarName22"];
opts.VariableTypes = ["char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "string", "char", "string"];

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "VarName20", "Var21", "VarName22"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "VarName20", "Var21", "VarName22"], "EmptyFieldRule", "auto");

% Import the data
P11precorticalexcitabilityMCDdatathenar = readtable(data, opts, "UseExcel", false);


%% Clear temporary variables
clear opts
 temp_al = table2array(P10precorticalexcitabilityMCDdatathenar1); % A and L Columns
 temp_tv = str2double(table2array(P11precorticalexcitabilityMCDdatathenar)); % T and V Columns

 %Onset_Parameters(y,:) =  temp;


%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 12);

% % Specify sheet and range
% opts.Sheet = "Averages";
% opts.DataRange = "A2:L352";
% 
% % Specify column names and types
% opts.VariableNames = ["s", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "wristExAvg"];
% opts.SelectedVariableNames = ["s", "wristExAvg"];
% opts.VariableTypes = ["double", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "double"];
% 
% % Specify variable properties
% opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11"], "WhitespaceRule", "preserve");
% opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11"], "EmptyFieldRule", "auto");
% 
% % Import the data
% P12precorticalexcitabilityMCDdata = readtable(data, opts, "UseExcel", false);
% 
% temp2 = table2array(P12precorticalexcitabilityMCDdata);


%% Clear temporary variables
clear opts

time = temp_al(:,1);
start = find(time==.015);
% MCD = temp_tv(2,1);
% SD = temp_tv(2,2);

set2 = [2 3 4 5 6 7 8 9 10 11];
for L = 1:length(set2) %Thenar data trials
    h = set2(L);
    waveform = temp_al(:,h);
    MCD = temp_al((2:101),h);
    f = [];
        for k = 2:100
            Point_a = MCD(k-1,1);
            Point_b = MCD(k,1);
            Diff = abs(Point_a - Point_b);
            f(k,:) = Diff;
                 
        end
        
            new_diff = f(2:100);
            AVG = mean(new_diff);
            MCD = AVG *2.66; % MCD formula for each frame, typical mean consecutive diff formula
            SD = std(f)*2; % SD formula for each fram, typical standard Deviation formula
            
            TF = isnan(MCD); % If no frame was performed, this takes out the Nan values for MCD and SD
            TD = isnan(SD);
            if TF == 1
                MCD = 0;
            end
            if TD == 1
                SD = 0;
            end
            
            
            
            
    Trial = L;
    
    time = temp_al(:,1);
    start = find(time==.015);
%     MCD = temp_tv(2,1);
%     SD = temp_tv(2,2);

%MCD : Onset 1 
for i = start:(length(waveform)-5)
    %Below written like: wave(1) > MCD value ----- wave(2)> MCD value
 if waveform(i) > MCD && waveform(i+1) > MCD && waveform(i+2) > MCD% && waveform(i+3) > MCD && waveform(i+4) > MCD
     MCD_onset1_index = i;
     MCD_onset1_time = time(i);
     break
     else
        MCD_onset1_index = NaN;
        MCD_onset1_time = NaN;
 end
end

%MCD : Offset 1 
if isnan(MCD_onset1_index)
     MCD_offset1_index = NaN;
     MCD_offset1_time = NaN;
else
    for i = MCD_onset1_index:(length(waveform)-5) 
        if waveform(i) < MCD && waveform(i+1) < MCD && waveform(i+2) < MCD% && waveform(i+3) < MCD && waveform(i+4) < MCD
            MCD_offset1_index = i;
            MCD_offset1_time = time(i);
        break
        else
            MCD_offset1_index = NaN;
            MCD_offset1_time = NaN; 
        end
    end
end

%MCD : Onset 2
if isnan(MCD_offset1_index)
    MCD_onset2_index = NaN;
    MCD_onset2_time = NaN;
    
else
    for i = MCD_offset1_index: (length(waveform)-5)
        if waveform(i) > MCD && waveform(i+1) > MCD && waveform(i+2) > MCD% && waveform(i+3) < MCD && waveform(i+4) < MCD
            MCD_onset2_index = i;
            MCD_onset2_time = time(i);
        break
        else
            MCD_onset2_index = NaN;
            MCD_onset2_time = NaN;
        end
    end
end

%MCD : Offset 2
if isnan(MCD_onset2_index)
    MCD_offset2_index = NaN;
    MCD_offset2_time = NaN;
else
    for i = MCD_onset2_index: (length(waveform)-5)
        if waveform(i) < MCD && waveform(i+1) < MCD && waveform(i+2) < MCD% && waveform(i+3) < MCD && waveform(i+4) < MCD
            MCD_offset2_index = i;
            MCD_offset2_time = time(i);
        break
        else
            MCD_offset2_index = NaN;
            MCD_offset2_time = NaN;
        end
    end
end

%MCD : Onset 3
if isnan(MCD_offset2_index)
    MCD_onset3_index = NaN;
    MCD_onset3_time = NaN;
    
else
    for i = MCD_offset2_index: (length(waveform)-5)
        if waveform(i) > MCD && waveform(i+1) > MCD && waveform(i+2) > MCD% && waveform(i+3) < MCD && waveform(i+4) < MCD
            MCD_onset3_index = i;
            MCD_onset3_time = time(i);
        break
        else
            MCD_onset3_index = NaN;
            MCD_onset3_time = NaN;
        end
    end
end

%MCD : Offset 3
if isnan(MCD_onset3_index)
    MCD_offset3_index = NaN;
    MCD_offset3_time = NaN;
else
    for i = MCD_onset3_index: (length(waveform)-5)
        if waveform(i) < MCD && waveform(i+1) < MCD && waveform(i+2) < MCD% && waveform(i+3) < MCD && waveform(i+4) < MCD
            MCD_offset3_index = i;
            MCD_offset3_time = time(i);
        break
        else
            MCD_offset3_index = NaN;
            MCD_offset3_time = NaN;
        end
    end
end

%MCD : Onset 4
if isnan(MCD_offset3_index)
    MCD_onset4_index = NaN;
    MCD_onset4_time = NaN;
    
else
    for i = MCD_offset3_index: (length(waveform)-5)
        if waveform(i) > MCD && waveform(i+1) > MCD && waveform(i+2) > MCD% && waveform(i+3) < MCD && waveform(i+4) < MCD
            MCD_onset4_index = i;
            MCD_onset4_time = time(i);
        break
        else
            MCD_onset4_index = NaN;
            MCD_onset4_time = NaN;
        end
    end
end

%MCD : Offset 4
if isnan(MCD_onset4_index)
    MCD_offset4_index = NaN;
    MCD_offset4_time = NaN;
else
    for i = MCD_onset4_index: (length(waveform)-5)
        if waveform(i) < MCD && waveform(i+1) < MCD && waveform(i+2) < MCD% && waveform(i+3) < MCD && waveform(i+4) < MCD
            MCD_offset4_index = i;
            MCD_offset4_time = time(i);
        break
        else
            MCD_offset4_index = NaN;
            MCD_offset4_time = NaN;
        end
    end
end

%MCD : Onset 5
if isnan(MCD_offset4_index)
    MCD_onset5_index = NaN;
    MCD_onset5_time = NaN;
    
else
    for i = MCD_offset4_index: (length(waveform)-5)
        if waveform(i) > MCD && waveform(i+1) > MCD && waveform(i+2) > MCD% && waveform(i+3) < MCD && waveform(i+4) < MCD
            MCD_onset5_index = i;
            MCD_onset5_time = time(i);
        break
        else
            MCD_onset5_index = NaN;
            MCD_onset5_time = NaN;
        end
    end
end

%MCD : Offset 5
if isnan(MCD_onset5_index)
    MCD_offset5_index = NaN;
    MCD_offset5_time = NaN;
else
    for i = MCD_onset5_index: (length(waveform)-5)
        if waveform(i) < MCD && waveform(i+1) < MCD && waveform(i+2) < MCD% && waveform(i+3) < MCD && waveform(i+4) < MCD
            MCD_offset5_index = i;
            MCD_offset5_time = time(i);
        break
        else
            MCD_offset5_index = NaN;
            MCD_offset5_time = NaN;
        end
    end
end


%SD : Onset 1
for i = start:(length(waveform)-5) 
 if waveform(i) > SD && waveform(i+1) > SD && waveform(i+2) > SD% && waveform(i+3) > SD && waveform(i+4) > SD
     SD_onset1_index = i;
     SD_onset1_time = time(i);
     break
     else
        SD_onset1_index = NaN;
        SD_onset1_time = NaN;
 end
end

%SD : Offset 1
if isnan(SD_onset1_index)
     SD_offset1_index = NaN;
     SD_offset1_time = NaN;
else
    for i = SD_onset1_index:(length(waveform)-5) 
        if waveform(i) < SD && waveform(i+1) < SD && waveform(i+2) < SD% && waveform(i+3) < SD && waveform(i+4) < SD
            SD_offset1_index = i;
            SD_offset1_time = time(i);
        break
        else
            SD_offset1_index = NaN;
            SD_offset1_time = NaN; 
        end
    end
end

%SD : Onset 2
if isnan(SD_offset1_index)
     SD_onset2_index = NaN;
     SD_onset2_time = NaN; 
else
    for i = SD_offset1_index: (length(waveform)-5)
        if waveform(i) > SD && waveform(i+1) > SD && waveform(i+2) > SD% && waveform(i+3) > SD && waveform(i+4) > SD
         SD_onset2_index = i;
         SD_onset2_time = time(i);
     break
     else
        SD_onset2_index = NaN;
        SD_onset2_time = NaN;
        end
    end
end

%SD : Offset 2
if isnan(SD_onset2_index)
     SD_offset2_index = NaN;
     SD_offset2_time = NaN;
else
    for i = SD_onset2_index:(length(waveform)-5) 
        if waveform(i) < SD && waveform(i+1) < SD && waveform(i+2) < SD% && waveform(i+3) < SD && waveform(i+4) < SD
            SD_offset2_index = i;
            SD_offset2_time = time(i);
        break
        else
            SD_offset2_index = NaN;
            SD_offset2_time = NaN; 
        end
    end
end

%SD : Onset 3
if isnan(SD_offset2_index)
     SD_onset3_index = NaN;
     SD_onset3_time = NaN; 
else
    for i = SD_offset2_index: (length(waveform)-5)
        if waveform(i) > SD && waveform(i+1) > SD && waveform(i+2) > SD% && waveform(i+3) > SD && waveform(i+4) > SD
         SD_onset3_index = i;
         SD_onset3_time = time(i);
     break
     else
        SD_onset3_index = NaN;
        SD_onset3_time = NaN;
        end
    end
end

%SD : Offset 3
if isnan(SD_onset3_index)
     SD_offset3_index = NaN;
     SD_offset3_time = NaN;
else
    for i = SD_onset3_index:(length(waveform)-5) 
        if waveform(i) < SD && waveform(i+1) < SD && waveform(i+2) < SD% && waveform(i+3) < SD && waveform(i+4) < SD
            SD_offset3_index = i;
            SD_offset3_time = time(i);
        break
        else
            SD_offset3_index = NaN;
            SD_offset3_time = NaN; 
        end
    end
end


%SD : Onset 4
if isnan(SD_offset3_index)
     SD_onset4_index = NaN;
     SD_onset4_time = NaN; 
else
    for i = SD_offset3_index: (length(waveform)-5)
        if waveform(i) > SD && waveform(i+1) > SD && waveform(i+2) > SD% && waveform(i+3) > SD && waveform(i+4) > SD
         SD_onset4_index = i;
         SD_onset4_time = time(i);
     break
     else
        SD_onset4_index = NaN;
        SD_onset4_time = NaN;
        end
    end
end

%SD : Offset 4
if isnan(SD_onset4_index)
     SD_offset4_index = NaN;
     SD_offset4_time = NaN;
else
    for i = SD_onset4_index:(length(waveform)-5) 
        if waveform(i) < SD && waveform(i+1) < SD && waveform(i+2) < SD% && waveform(i+3) < SD && waveform(i+4) < SD
            SD_offset4_index = i;
            SD_offset4_time = time(i);
        break
        else
            SD_offset4_index = NaN;
            SD_offset4_time = NaN; 
        end
    end
end

%SD : Onset 5
if isnan(SD_offset4_index)
     SD_onset5_index = NaN;
     SD_onset5_time = NaN; 
else
    for i = SD_offset4_index: (length(waveform)-5)
        if waveform(i) > SD && waveform(i+1) > SD && waveform(i+2) > SD% && waveform(i+3) > SD && waveform(i+4) > SD
         SD_onset5_index = i;
         SD_onset5_time = time(i);
     break
     else
        SD_onset5_index = NaN;
        SD_onset5_time = NaN;
        end
    end
end

%SD : Offset 5
if isnan(SD_onset5_index)
     SD_offset5_index = NaN;
     SD_offset5_time = NaN;
else
    for i = SD_onset5_index:(length(waveform)-5) 
        if waveform(i) < SD && waveform(i+1) < SD && waveform(i+2) < SD% && waveform(i+3) < SD && waveform(i+4) < SD
            SD_offset5_index = i;
            SD_offset5_time = time(i);
        break
        else
            SD_offset5_index = NaN;
            SD_offset5_time = NaN; 
        end
    end
end


% 
plot(time, waveform);
hold on
yline(MCD,'r--')
hold on
yline(SD,'g--');

filename = sprintf('P%d_Trial%d_MEP_Plot',p,L);
cd Plots_M1
%cd Plots_M2
savefig(filename);
close
cd 'C:\Users\jg300416\Documents\MATLAB\DoD\Evan'
% %cd 'C:\Users\Jessi\Documents\DoD\Evan'



% MEP Area Under the Curve (AUC):
% Area 1: Onset 1 – Offset 1
try MCD_AUC1 = trapz(waveform(MCD_onset1_index:MCD_offset1_index));
catch MCD_AUC1 = NaN;
end

try SD_AUC1 = trapz(waveform(SD_onset1_index:SD_offset1_index));
catch SD_AUC1 = NaN;
end

% Area 2: Onset 2 – Offset 2
try MCD_AUC2 = trapz(waveform(MCD_onset2_index:MCD_offset2_index));
catch MCD_AUC2 = NaN;
end

try SD_AUC2 = trapz(waveform(SD_onset2_index:SD_offset2_index));
catch SD_AUC2 = NaN;
end

%%%%%%% Area 1_2: Offset 1 – Onset 2
try MCD_AUC1_2 = trapz(waveform(MCD_offset1_index:MCD_onset2_index));
catch MCD_AUC1_2 = NaN;
end

try SD_AUC1_2 = trapz(waveform(SD_offset1_index:SD_onset2_index));
catch SD_AUC1_2 = NaN;
end

% Area 3: Onset 3 – Offset 3
try MCD_AUC3 = trapz(waveform(MCD_onset3_index:MCD_offset3_index));
catch MCD_AUC3 = NaN;
end

try SD_AUC3 = trapz(waveform(SD_onset3_index:SD_offset3_index));
catch SD_AUC3 = NaN;
end

%%%%%%% Area 2_3: Offset 2 – Onset 3
try MCD_AUC2_3 = trapz(waveform(MCD_offset2_index:MCD_onset3_index));
catch MCD_AUC2_3 = NaN;
end

try SD_AUC2_3 = trapz(waveform(SD_offset2_index:SD_onset3_index));
catch SD_AUC2_3 = NaN;
end

% Area 4: Onset 4 – Offset 4
try MCD_AUC4 = trapz(waveform(MCD_onset4_index:MCD_offset4_index));
catch MCD_AUC4 = NaN;
end

try SD_AUC4 = trapz(waveform(SD_onset4_index:SD_offset4_index));
catch SD_AUC4 = NaN;
end

%%%%%%% Area 3_4: Offset 3 – Onset 4
try MCD_AUC3_4 = trapz(waveform(MCD_offset3_index:MCD_onset4_index));
catch MCD_AUC3_4 = NaN;
end

try SD_AUC3_4 = trapz(waveform(SD_offset3_index:SD_onset4_index));
catch SD_AUC3_4 = NaN;
end

% Area 5: Onset 5 – Offset 5
try MCD_AUC5 = trapz(waveform(MCD_onset5_index:MCD_offset5_index));
catch MCD_AUC5 = NaN;
end

try SD_AUC5 = trapz(waveform(SD_onset5_index:SD_offset5_index));
catch SD_AUC5 = NaN;
end

%%%%%%% Area 4_5: Offset 4 – Onset 5
try MCD_AUC4_5 = trapz(waveform(MCD_offset4_index:MCD_onset5_index));
catch MCD_AUC4_5 = NaN;
end

try SD_AUC4_5 = trapz(waveform(SD_offset4_index:SD_onset5_index));
catch SD_AUC4_5 = NaN;
end


% 
% Parameters_O(y,:) = [p, Trial, MCD, SD, MCD_onset1_time, MCD_offset1_time, MCD_onset2_time,...
%     MCD_offset2_time, MCD_onset3_time, MCD_offset3_time, MCD_onset4_time, MCD_offset4_time, MCD_onset5_time, MCD_offset5_time,...
%     SD_onset1_time, SD_offset1_time, SD_onset2_time, SD_offset2_time, SD_onset3_time, SD_offset3_time, SD_onset4_time, SD_offset4_time, SD_onset5_time, SD_offset5_time,...
%     MCD_AUC1, SD_AUC1, MCD_AUC2, SD_AUC2, MCD_AUC1_2, SD_AUC1_2, MCD_AUC3, SD_AUC3, MCD_AUC2_3, SD_AUC2_3, MCD_AUC4, SD_AUC4, MCD_AUC3_4, SD_AUC3_4, MCD_AUC5, SD_AUC5, MCD_AUC4_5, SD_AUC4_5];
% 
% Para(y,:) = ({'participant', 'Trial', 'MCD', 'SD' ,'MCD_onset1_time', 'MCD_offset1_time', 'MCD_onset2_time',...
%     'MCD_offset2_time', 'MCD_onset3_time', 'MCD_offset3_time', 'MCD_onset4_time', 'MCD_offset4_time', 'MCD_onset5_time', 'MCD_offset5_time',...
%     'SD_onset1_time', 'SD_offset1_time', 'SD_onset2_time', 'SD_offset2_time', 'SD_onset3_time', 'SD_offset3_time', 'SD_onset4_time', 'SD_offset4_time',...
%     'SD_onset5_time', 'SD_offset5_time', 'MCD_AUC1', 'SD_AUC1', 'MCD_AUC2', 'SD_AUC2', 'MCD_AUC1_2', 'SD_AUC1_2', 'MCD_AUC3', 'SD_AUC3',...
%     'MCD_AUC2_3', 'SD_AUC2_3', 'MCD_AUC4', 'SD_AUC4', 'MCD_AUC3_4', 'SD_AUC3_4', 'MCD_AUC5', 'SD_AUC5', 'MCD_AUC4_5', 'SD_AUC4_5'});
% 
% Parameters(:,:) = [Para;Parameters_O];





MEP_Data.(['Participant_',num2str(p),]).('Trial')(L,1) = Trial;
MEP_Data.(['Participant_',num2str(p),]).('MCD')(L,1) = MCD;
MEP_Data.(['Participant_',num2str(p),]).('SD')(L,1) = SD;

MEP_Data.(['Participant_',num2str(p),]).('MCD_onset1_time')(L,1) = MCD_onset1_time;
MEP_Data.(['Participant_',num2str(p),]).('MCD_offset1_time')(L,1) = MCD_offset1_time;
MEP_Data.(['Participant_',num2str(p),]).('MCD_onset2_time')(L,1) = MCD_onset2_time;
MEP_Data.(['Participant_',num2str(p),]).('MCD_offset2_time')(L,1) = MCD_offset2_time;
MEP_Data.(['Participant_',num2str(p),]).('MCD_onset3_time')(L,1) = MCD_onset3_time;
MEP_Data.(['Participant_',num2str(p),]).('MCD_offset3_time')(L,1) = MCD_offset3_time;
MEP_Data.(['Participant_',num2str(p),]).('MCD_onset4_time')(L,1) = MCD_onset4_time;
MEP_Data.(['Participant_',num2str(p),]).('MCD_offset4_time')(L,1) = MCD_offset4_time;
MEP_Data.(['Participant_',num2str(p),]).('MCD_onset5_time')(L,1) = MCD_onset5_time;
MEP_Data.(['Participant_',num2str(p),]).('MCD_offset5_time')(L,1) = MCD_offset5_time;
MEP_Data.(['Participant_',num2str(p),]).('MCD_offset5_time')(L,1) = MCD_offset5_time;
MEP_Data.(['Participant_',num2str(p),]).('MCD_offset5_time')(L,1) = MCD_offset5_time;

MEP_Data.(['Participant_',num2str(p),]).('SD_onset1_time')(L,1) = SD_onset1_time;
MEP_Data.(['Participant_',num2str(p),]).('SD_offset1_time')(L,1) = SD_offset1_time;
MEP_Data.(['Participant_',num2str(p),]).('SD_onset2_time')(L,1) = SD_onset2_time;
MEP_Data.(['Participant_',num2str(p),]).('SD_offset2_time')(L,1) = SD_offset2_time;
MEP_Data.(['Participant_',num2str(p),]).('SD_onset3_time')(L,1) = SD_onset3_time;
MEP_Data.(['Participant_',num2str(p),]).('SD_offset3_time')(L,1) = SD_offset3_time;
MEP_Data.(['Participant_',num2str(p),]).('SD_onset4_time')(L,1) = SD_onset4_time;
MEP_Data.(['Participant_',num2str(p),]).('SD_offset4_time')(L,1) = SD_offset4_time;
MEP_Data.(['Participant_',num2str(p),]).('SD_onset5_time')(L,1) = SD_onset5_time;
MEP_Data.(['Participant_',num2str(p),]).('SD_offset5_time')(L,1) = SD_offset5_time;
MEP_Data.(['Participant_',num2str(p),]).('SD_offset5_time')(L,1) = SD_offset5_time;
MEP_Data.(['Participant_',num2str(p),]).('SD_offset5_time')(L,1) = SD_offset5_time;

MEP_Data.(['Participant_',num2str(p),]).('MCD_AUC1')(L,1) = MCD_AUC1;
MEP_Data.(['Participant_',num2str(p),]).('SD_AUC1')(L,1) = SD_AUC1;
MEP_Data.(['Participant_',num2str(p),]).('MCD_AUC2')(L,1) = MCD_AUC2;
MEP_Data.(['Participant_',num2str(p),]).('SD_AUC2')(L,1) = MCD_AUC2;
MEP_Data.(['Participant_',num2str(p),]).('MCD_AUC1_2')(L,1) = MCD_AUC1_2;
MEP_Data.(['Participant_',num2str(p),]).('SD_AUC1_2')(L,1) = MCD_AUC1_2;
MEP_Data.(['Participant_',num2str(p),]).('MCD_AUC3')(L,1) = MCD_AUC3;
MEP_Data.(['Participant_',num2str(p),]).('SD_AUC3')(L,1) = SD_AUC3;
MEP_Data.(['Participant_',num2str(p),]).('MCD_AUC2_3')(L,1) = MCD_AUC2_3;
MEP_Data.(['Participant_',num2str(p),]).('SD_AUC2_3')(L,1) = SD_AUC2_3;
MEP_Data.(['Participant_',num2str(p),]).('MCD_AUC4')(L,1) = MCD_AUC4;
MEP_Data.(['Participant_',num2str(p),]).('SD_AUC4')(L,1) = SD_AUC4;
MEP_Data.(['Participant_',num2str(p),]).('MCD_AUC3_4')(L,1) = SD_AUC4;
MEP_Data.(['Participant_',num2str(p),]).('SD_AUC3_4')(L,1) = SD_AUC4;
MEP_Data.(['Participant_',num2str(p),]).('MCD_AUC5')(L,1) = MCD_AUC5;
MEP_Data.(['Participant_',num2str(p),]).('SD_AUC5')(L,1) = SD_AUC5;
MEP_Data.(['Participant_',num2str(p),]).('MCD_AUC4_5')(L,1) = MCD_AUC4_5;
MEP_Data.(['Participant_',num2str(p),]).('SD_AUC4_5')(L,1) = SD_AUC4_5;


clearvars -except Parameters y p set set2 MEP_Data temp_al temp_tv
end
end

% Sh = sprintf('Sheet%T',T);
% 
% filename = 'Data_Method_1.xlsx';
% %filename = 'Data_Method_2.xlsx';
% xlswrite(filename,Parameters(:,1),'Sheet1','A2')
% xlswrite(filename,Parameters(:,2),'Sheet1','B2')
% xlswrite(filename,Parameters(:,3),'Sheet1','C2')
% xlswrite(filename,Parameters(:,4),'Sheet1','D2')
% xlswrite(filename,Parameters(:,5),'Sheet1','E2')
% xlswrite(filename,Parameters(:,6),'Sheet1','F2')
% xlswrite(filename,Parameters(:,7),'Sheet1','G2')
% xlswrite(filename,Parameters(:,8),'Sheet1','H2')
% xlswrite(filename,Parameters(:,9),'Sheet1','I2')
% xlswrite(filename,Parameters(:,10),'Sheet1','J2')
% xlswrite(filename,Parameters(:,11),'Sheet1','K2')
% xlswrite(filename,Parameters(:,12),'Sheet1','L2')
% xlswrite(filename,Parameters(:,13),'Sheet1','M2')
% xlswrite(filename,Parameters(:,14),'Sheet1','N2')
% xlswrite(filename,Parameters(:,15),'Sheet1','O2')
% xlswrite(filename,Parameters(:,16),'Sheet1','P2')
% xlswrite(filename,Parameters(:,17),'Sheet1','Q2')
% xlswrite(filename,Parameters(:,18),'Sheet1','R2')
% 
% xlswrite(filename,Parameters(:,19),'Sheet1','S2')
% xlswrite(filename,Parameters(:,20),'Sheet1','T2')
% xlswrite(filename,Parameters(:,21),'Sheet1','U2')
% xlswrite(filename,Parameters(:,22),'Sheet1','V2')
% xlswrite(filename,Parameters(:,23),'Sheet1','W2')
% xlswrite(filename,Parameters(:,24),'Sheet1','X2')
% xlswrite(filename,Parameters(:,25),'Sheet1','Y2')
% xlswrite(filename,Parameters(:,26),'Sheet1','Z2')
% xlswrite(filename,Parameters(:,27),'Sheet1','AA2')
% xlswrite(filename,Parameters(:,28),'Sheet1','AB2')
% xlswrite(filename,Parameters(:,29),'Sheet1','AC2')
% xlswrite(filename,Parameters(:,30),'Sheet1','AD2')
% xlswrite(filename,Parameters(:,31),'Sheet1','AE2')
% xlswrite(filename,Parameters(:,32),'Sheet1','AF2')
% xlswrite(filename,Parameters(:,33),'Sheet1','AG2')
% xlswrite(filename,Parameters(:,34),'Sheet1','AH2')
% xlswrite(filename,Parameters(:,35),'Sheet1','AI2')
% xlswrite(filename,Parameters(:,36),'Sheet1','AJ2')
% 
% xlswrite(filename,Parameters(:,37),'Sheet1','AK2')
% xlswrite(filename,Parameters(:,38),'Sheet1','AL2')
% xlswrite(filename,Parameters(:,39),'Sheet1','AM2')
% xlswrite(filename,Parameters(:,40),'Sheet1','AN2')
% xlswrite(filename,Parameters(:,41),'Sheet1','AO2')
% 
