%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\cazmo\Desktop\DoD Muscle Extraction\MCD_pre\691_P10_pre_corticalexcitability-MCD data.xlsx
%    Worksheet: Averages
%
clear
clc

set = [10:31,35:45,48:56,59:65,67,68,72,75,77,78,79,80];

for y = 1:length(set)
    p = set(y);
    
     data = sprintf('691_P%d_pre_corticalexcitability-MCD data.xlsx',p);
%% Setup the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 22);

% Specify sheet and range
opts.Sheet = "Averages";
opts.DataRange = "A353:V353";

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "VarName20", "Var21", "VarName22"];
opts.SelectedVariableNames = ["VarName20", "VarName22"];
opts.VariableTypes = ["char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "string", "char", "string"];

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "VarName20", "Var21", "VarName22"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "VarName20", "Var21", "VarName22"], "EmptyFieldRule", "auto");

% Import the data
P10precorticalexcitabilityMCDdataS1 = readtable(data, opts, "UseExcel", false);


%% Clear temporary variables
clear opts
 temp = str2double(table2array(P10precorticalexcitabilityMCDdataS1));
 Onset_Parameters(y,:) =  temp;


%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 12);

% Specify sheet and range
opts.Sheet = "Averages";
opts.DataRange = "A2:L352";

% Specify column names and types
opts.VariableNames = ["s", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "wristExAvg"];
opts.SelectedVariableNames = ["s", "wristExAvg"];
opts.VariableTypes = ["double", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "double"];

% Specify variable properties
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11"], "EmptyFieldRule", "auto");

% Import the data
P12precorticalexcitabilityMCDdata = readtable(data, opts, "UseExcel", false);

temp2 = table2array(P12precorticalexcitabilityMCDdata);


%% Clear temporary variables
clear opts

time = temp2(:,1);
start = find(time==.015);
waveform = temp2(:,2);
MCD = temp(:,1);
SD = temp(:,2);


%MCD
for i = start:(length(waveform)-5) 
 if waveform(i) > MCD && waveform(i+1) > MCD && waveform(i+2) > MCD && waveform(i+3) > MCD && waveform(i+4) > MCD
     MCD_onset_index = i;
     MCD_onset_time = time(i);
     break
     else
        MCD_onset_index = NaN;
        MCD_onset_time = NaN;
 end
end

if isnan(MCD_onset_index)
     MCD_offset_index = NaN;
     MCD_offset_time = NaN;
else
    for i = MCD_onset_index:(length(waveform)-5) 
        if waveform(i) < MCD && waveform(i+1) < MCD && waveform(i+2) < MCD && waveform(i+3) < MCD && waveform(i+4) < MCD
            MCD_offset_index = i;
            MCD_offset_time = time(i);
        break
        else
            MCD_offset_index = NaN;
            MCD_offset_time = NaN; 
        end
    end
end

%2SD
for i = start:(length(waveform)-5) 
 if waveform(i) > SD && waveform(i+1) > SD && waveform(i+2) > SD && waveform(i+3) > SD && waveform(i+4) > SD
     SD_onset_index = i;
     SD_onset_time = time(i);
     break
     else
        SD_onset_index = NaN;
        SD_onset_time = NaN;
 end
end

if isnan(SD_onset_index)
     SD_offset_index = NaN;
     SD_offset_time = NaN;
else
    for i = SD_onset_index:(length(waveform)-5) 
        if waveform(i) < SD && waveform(i+1) < SD && waveform(i+2) < SD && waveform(i+3) < SD && waveform(i+4) < SD
            SD_offset_index = i;
            SD_offset_time = time(i);
        break
        else
            SD_offset_index = NaN;
            SD_offset_time = NaN; 
        end
    end
end



plot(time, waveform);
hold on
yline(MCD,'r--')
hold on
yline(SD,'g--');

filename = sprintf('P%d_MEP_Plot',p);
cd Plots
savefig(filename);
close
cd 'C:\Users\cs201470\Desktop\DoD Muscle Extraction'

try MCD_AUC = trapz(waveform(MCD_onset_index:MCD_offset_index));
catch MCD_AUC = NaN;
end

try SD_AUC = trapz(waveform(SD_onset_index:SD_offset_index));
catch SD_AUC = NaN;
end

Parameters(y,:) = [p MCD SD MCD_onset_time MCD_offset_time SD_onset_time SD_offset_time MCD_AUC SD_AUC];

clearvars -except Parameters y set 
end



