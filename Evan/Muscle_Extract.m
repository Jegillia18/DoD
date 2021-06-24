%% |DoD|
% *Cazmon & Jessica*
%
% _06/24/2021_
%
% _Code Description:_
% Muscle Extraction
%% Important Naming Acronyms
% MOI - Muscle of Interest
%
%% 
clear;clc;
warning('off','all')

set = [11:31,35:45,48:56,59:65,67,68,72,75,77,78,79,80];
filename = 'DoD_moi_100.xlsx';
% moi_100 = []; %space allocation

prompt = 'What is the muscle of interest? ';
m_1 = input(prompt,'s'); 
m = str2double(m_1);


for y = 1:length(set)
    p = set(y) ;
    
    data = struct2array(load(sprintf('691_P%d_pre.mat',p)));
    muscles = data.values;
%% frames

opts = spreadsheetImportOptions("NumVariables", 5);

% Specify sheet and range
opts.Sheet = "TMS-pre";
opts.DataRange = "A:E";

% Specify column names and types
opts.VariableNames = ["ParticipantID", "FrameStart", "FrameEnd", "FrameStart2", "FrameEnd2"];
opts.VariableTypes = ["double", "double", "double", "double", "double"];

% Import the data

ttable = readtable("C:\Users\Jessica S. Gilliam\Documents\MATLAB\ShepherdCenter\DoD_Evan\DoDUE_TMS_data_frames.xlsx", opts, "UseExcel", false);
ttable(1,:) = [];


%% Exract

moi = muscles(:,m,:);

L = size(moi,3);

% for i = 1:height(ttable)
    
    PID = (table2array(ttable(y,1)));
    FS1 = (table2array(ttable(y,2)));
    FE1 = (table2array(ttable(y,3)));
    FS2 = (table2array(ttable(y,4)));
    FE2 = (table2array(ttable(y,5)));
    
    if isnan(FS2)
        x = (FS1:FE1);
        for t = 1:length(x)
            x = FS1:FE1;
            moi_100(:,t) = [x(t); moi(:,1,x(t))];
        end
    else
                   x = [FS1:FE1,FS2:FE2];
        for t = 1:length(x)
            moi_100(:,t) = [x(t); moi(:,1,x(t))];
        end
    end
% end

moi_100 = abs(moi_100);

%% Sheet rename

SN = readmatrix('Sheetnames.xlsx');
SN = string(SN);
sheets = SN;
writematrix(moi_100,filename,'Sheet',y);

clear moi_100
end







