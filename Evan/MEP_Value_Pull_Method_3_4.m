%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Method 3:
% Onset1: 3 consecutive points above MCD
% Offset1: 3 out of 5 points below MCD
% Onset2: 3 consecutive points above MCD
% Offset2: 3 out of 5 points below MCD
% 
%   Method 4:
% Onset1: 5 consecutive points above MCD
% Offset1: 3 out of 5 points below MCD
% Onset2: 5 consecutive points above MCD
% Offset2: 3 out of 5 points below MCD


clear
clc

set = [10:31,35:45,48:56,59:65,67,68,72,75,77,78,79,80];

for y = 1:length(set)
    p = set(y);
    
     data = sprintf('691_P%d_pre_corticalexcitability-MCD data_thenar.xlsx',p);
     
opts = spreadsheetImportOptions("NumVariables", 12);

% Specify sheet and range
opts.Sheet = "Averages";
opts.DataRange = "A1:L352";

% Specify column names and types
opts.VariableNames = ["s", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "thenaravg"];
opts.SelectedVariableNames = ["s", "thenaravg"];
opts.VariableTypes = ["double", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "double"];

% Specify variable properties
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11"], "EmptyFieldRule", "auto");

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
 temp_al = table2array(P10precorticalexcitabilityMCDdatathenar1(2:end,:)); % A and L Columns
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
waveform = temp_al(:,2);
MCD = temp_tv(2,1);
SD = temp_tv(2,2);


%MCD : Onset 1 
for i = start:(length(waveform)-5)
    %Below written like: wave(1) > MCD value ----- wave(2)> MCD value
 if waveform(i) > MCD && waveform(i+1) > MCD && waveform(i+2) > MCD && waveform(i+3) > MCD && waveform(i+4) > MCD
     MCD_onset1_index = i;
     MCD_onset1_time = time(i);
     break
     else
        MCD_onset1_index = NaN;
        MCD_onset1_time = NaN;
 end
end

%MCD : Offset 1 for 3/5
if isnan(MCD_onset1_index)
     MCD_offset1_index = NaN;
     MCD_offset1_time = NaN;
else
    B = 0;
    for i = MCD_onset1_index:(length(waveform)-5)
        for f = i:(length(waveform)-5)
            if waveform(f) < MCD
                c = 1;
            else
                c = 0;
            end
            B = B+c;
            if B>=3
                break
            end
        end
        break
    end
         if B >= 3    
            MCD_offset1_index = f;
            MCD_offset1_time = time(f);
         else
            MCD_offset1_index = NaN;
            MCD_offset1_time = NaN; 
         end
end

%MCD : Onset 2
if isnan(MCD_offset1_index)
    MCD_onset2_index = NaN;
    MCD_onset2_time = NaN;
    
else
    for i = MCD_offset1_index: (length(waveform)-5)
        if waveform(i) > MCD && waveform(i+1) > MCD && waveform(i+2) > MCD && waveform(i+3) < MCD && waveform(i+4) < MCD
            MCD_onset2_index = i;
            MCD_onset2_time = time(i);
        break
        else
            MCD_onset2_index = NaN;
            MCD_onset2_time = NaN;
        end
    end
end

%MCD : Offset 2 for 3/5
if isnan(MCD_onset2_index)
     MCD_offset2_index = NaN;
     MCD_offset2_time = NaN;
else
    B = 0;
    for i = MCD_onset2_index:(length(waveform)-5)
        for f = i:(length(waveform)-5)
            if waveform(f) < MCD
                c = 1;
            else
                c = 0;
            end
            B = B+c;
            if B>=3
                break
            end
        end
        break
    end
         if B >= 3    
            MCD_offset2_index = f;
            MCD_offset2_time = time(f);
         else
            MCD_offset2_index = NaN;
            MCD_offset2_time = NaN; 
         end
end


%SD : Onset 1
for i = start:(length(waveform)-5) 
 if waveform(i) > SD && waveform(i+1) > SD && waveform(i+2) > SD && waveform(i+3) > SD && waveform(i+4) > SD
     SD_onset1_index = i;
     SD_onset1_time = time(i);
     break
     else
        SD_onset1_index = NaN;
        SD_onset1_time = NaN;
 end
end

%SD : Offset 1 3/5
if isnan(SD_onset1_index)
     SD_offset1_index = NaN;
     SD_offset1_time = NaN;
else
    B = 0;
    for i = SD_onset1_index:(length(waveform)-5)
        for f = i:(length(waveform)-5)
            if waveform(f) < SD
                c = 1;
            else
                c = 0;
            end
            B = B+c;
            if B>=3
                break
            end
        end
        break
    end
         if B >= 3    
            SD_offset1_index = f;
            SD_offset1_time = time(f);
         else
            SD_offset1_index = NaN;
            SD_offset1_time = NaN; 
         end
end

%SD : Onset 2
if isnan(SD_offset1_index)
     SD_onset2_index = NaN;
     SD_onset2_time = NaN; 
else
    for i = SD_offset1_index: (length(waveform)-5)
        if waveform(i) > SD && waveform(i+1) > SD && waveform(i+2) > SD && waveform(i+3) > SD && waveform(i+4) > SD
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
    B = 0;
    for i = SD_onset2_index:(length(waveform)-5)
        for f = i:(length(waveform)-5)
            if waveform(f) < SD
                c = 1;
            else
                c = 0;
            end
            B = B+c;
            if B>=3
                break
            end
        end
        break
    end
         if B >= 3    
            SD_offset2_index = f;
            SD_offset2_time = time(f);
         else
            SD_offset2_index = NaN;
            SD_offset2_time = NaN; 
         end
end

% 
% plot(time, waveform);
% hold on
% yline(MCD,'r--')
% hold on
% yline(SD,'g--');
% 
% filename = sprintf('P%d_MEP_Plot',p);
% cd Plots_M3
% savefig(filename);
% close
% cd 'C:\Users\jg300416\Documents\MATLAB\DoD\Evan'
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

% Area 3: Onset 1 – Offset 2
try MCD_AUC3 = trapz(waveform(MCD_onset1_index:MCD_offset2_index));
catch MCD_AUC3 = NaN;
end

try SD_AUC3 = trapz(waveform(SD_onset1_index:SD_offset2_index));
catch SD_AUC3 = NaN;
end



Parameters(y,:) = [p MCD SD MCD_onset1_time MCD_offset1_time MCD_onset2_time...
    MCD_offset2_time SD_onset1_time SD_offset1_time SD_onset2_time SD_offset2_time ...
    MCD_AUC1 SD_AUC1 MCD_AUC2 SD_AUC2 MCD_AUC3 SD_AUC3];

clearvars -except Parameters y set 
end


%filename = 'Data_Method_3.xlsx';
filename = 'Data_Method_4.xlsx';
xlswrite(filename,Parameters(:,1),'Sheet1','A2')
xlswrite(filename,Parameters(:,2),'Sheet1','B2')
xlswrite(filename,Parameters(:,3),'Sheet1','C2')
xlswrite(filename,Parameters(:,4),'Sheet1','D2')
xlswrite(filename,Parameters(:,5),'Sheet1','E2')
xlswrite(filename,Parameters(:,6),'Sheet1','F2')
xlswrite(filename,Parameters(:,7),'Sheet1','G2')
xlswrite(filename,Parameters(:,8),'Sheet1','H2')
xlswrite(filename,Parameters(:,9),'Sheet1','I2')
xlswrite(filename,Parameters(:,10),'Sheet1','J2')
xlswrite(filename,Parameters(:,11),'Sheet1','K2')
xlswrite(filename,Parameters(:,12),'Sheet1','L2')
xlswrite(filename,Parameters(:,13),'Sheet1','M2')
xlswrite(filename,Parameters(:,14),'Sheet1','N2')
xlswrite(filename,Parameters(:,15),'Sheet1','O2')
xlswrite(filename,Parameters(:,16),'Sheet1','P2')
xlswrite(filename,Parameters(:,17),'Sheet1','Q2')
