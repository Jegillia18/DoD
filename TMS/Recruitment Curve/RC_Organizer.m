%%POST SUB TEST P55

set = [10,12,13,16,18:22,25:31,35:37,41:45,48:56,59:64,67,68,72,75]; %removed 34
 
 for i = 1:length(set)
    
for p = set(i) 
cd 'C:\Users\cs201470\Desktop\DOD (Git)\TMS Analysis\Completed' 

filename = sprintf('P%d_SUB_MEP_RESTING',p); 
filewrite = sprintf('P%d_SUB_MEP_RESTING_RC.xlsx',p);


%% PRE_SUB 

PRE_SUB = xlsread(filename,2);
s = size(PRE_SUB);
s = s(1);


PRE = [PRE_SUB(1:end,1) PRE_SUB(1:end,3)];
idx = isnan(PRE);
PRE(idx) = 0;


try
POST = [PRE_SUB(1:end,7) PRE_SUB(1:end,9)];
idx = isnan(POST);
POST(idx) = 0;

catch
POST = [zeros(s,1) zeros(s,1)];
end    

try 
FOLLOW_UP = [PRE_SUB(1:end,13) PRE_SUB(1:end,15)];
idx = isnan(FOLLOW_UP);
FOLLOW_UP(idx) = 0;

catch 
FOLLOW_UP = [zeros(s,1) zeros(s,1)];
end
    
PRE_SUB_RC = [PRE POST FOLLOW_UP];

clear idx PRE POST FOLLOW_UP


%% MT_PRE_SUB

MT_PRE_SUB = xlsread(filename,4);

s = size(MT_PRE_SUB);
s=s(1);


PRE = MT_PRE_SUB(1:end,1:2);
idx = isnan(PRE);
PRE(idx) = 0;

try
POST = MT_PRE_SUB(1:end,45:46);
idx = isnan(POST);
POST(idx) = 0;
catch
POST = [zeros(s,1) zeros(s,1)];
end

try
FOLLOW_UP = MT_PRE_SUB(1:end,89:90);
idx = isnan(FOLLOW_UP);
FOLLOW_UP(idx) = 0;
catch
FOLLOW_UP = [zeros(s,1) zeros(s,1)];
end  
    


MT_PRE_SUB_RC = [PRE POST FOLLOW_UP];

%clearvars -except p filename filewrite POST_SUB_100 PRE_SUB_100 MT_POST_SUB_100 MT_PRE_SUB_100



% Participant = [PRE_SUB_100 MT_PRE_SUB_100(1:end,2)];
% 
% assignin('base',sprintf('P%d_SUB_MEP_ACTIVE',p),Participant);
%% Table write 

cd 'C:\Users\cs201470\Desktop\DOD (Git)'
% 

xlswrite(filewrite,PRE_SUB_RC,1,'B4');
xlswrite(filewrite,MT_PRE_SUB_RC,2,'B4');
 
end
end
