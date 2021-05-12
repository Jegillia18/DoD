%%POST SUB TEST P55

set = [10,12,13,16,18:22,25:31,35:37,41:45,48:56,59:64,67,68,72,75]; %removed 34
 
 for i = 1:length(set)
    
for p = set(i) 
  
filename = sprintf('P%d_SUB_MEP_ACTIVE',p); 
%filewrite = sprintf('P%d_SUB_MEP_ACTIVE_100.xlsx',p);


%% POST_SUB
    
POST_SUB = xlsread(filename,1);

PRE = POST_SUB(1:end,1:3);
idx = (PRE(:,1) == 100);
PRE(~idx,:) = [];

POST = POST_SUB(1:end,7:9);
idx = (POST(:,1) == 100);
POST(~idx,:) = [];

FOLLOW_UP = POST_SUB(1:end,13:15);
idx = (FOLLOW_UP(:,1) == 100);
FOLLOW_UP(~idx,:) = [];

POST_SUB_100 = [PRE POST FOLLOW_UP];

clear idx PRE POST FOLLOW_UP

%% PRE_SUB 

PRE_SUB = xlsread(filename,2);

PRE = [PRE_SUB(1:end,1) PRE_SUB(1:end,3)];
idx = (PRE(:,1) == 100);
PRE(~idx,:) = [];

try
POST = [PRE_SUB(1:end,7) PRE_SUB(1:end,9)];
idx = (POST(:,1) == 100);
POST(~idx,:) = [];
catch
POST = [100 0; 100 0; 100 0];
end    

try 
FOLLOW_UP = [PRE_SUB(1:end,13) PRE_SUB(1:end,15)];
idx = (FOLLOW_UP(:,1) == 100);
FOLLOW_UP(~idx,:) = [];
catch 
FOLLOW_UP = [100 0; 100 0; 100 0];
end
    
PRE_SUB_100 = [PRE; POST; FOLLOW_UP];

clear idx PRE POST FOLLOW_UP

%% MT_POST_SUB

MT_POST_SUB = xlsread(filename,3);

PRE = MT_POST_SUB(1:end,1:2);
idx = (PRE(:,1) == 100);
PRE(~idx,:) = [];

POST = MT_POST_SUB(1:end,45:46);
idx = (POST(:,1) == 100);
POST(~idx,:) = [];

FOLLOW_UP = MT_POST_SUB(1:end,89:90);
idx = (FOLLOW_UP(:,1) == 100);
FOLLOW_UP(~idx,:) = [];

MT_POST_SUB_100 = [PRE POST FOLLOW_UP];

clear idx PRE POST FOLLOW_UP


%% MT_PRE_SUB

MT_PRE_SUB = xlsread(filename,4);

PRE = MT_PRE_SUB(1:end,1:2);
idx = (PRE(:,1) == 100);
PRE(~idx,:) = [];

try
POST = MT_PRE_SUB(1:end,45:46);
idx = (POST(:,1) == 100);
POST(~idx,:) = [];
catch
POST = [100 0; 100 0; 100 0];
end

try
FOLLOW_UP = MT_PRE_SUB(1:end,89:90);
idx = (FOLLOW_UP(:,1) == 100);
FOLLOW_UP(~idx,:) = [];
catch
FOLLOW_UP = [100 0; 100 0; 100 0];
end  
    
MT_PRE_SUB_100 = [PRE; POST; FOLLOW_UP];

%clearvars -except p filename filewrite POST_SUB_100 PRE_SUB_100 MT_POST_SUB_100 MT_PRE_SUB_100



Participant = [PRE_SUB_100 MT_PRE_SUB_100(1:end,2)];

assignin('base',sprintf('P%d_SUB_MEP_ACTIVE',p),Participant);
%% Table write 

% cd 'C:\Users\cs201470\Desktop\DOD (Git)\TMS Secondary Analysis\OUTPUT'
% 
%xlswrite(filewrite,POST_SUB_100,1,'B4');
%xlswrite(filewrite,PRE_SUB_100,1,'B4');
%xlswrite(filewrite,MT_POST_SUB_100,3,'B4');
%xlswrite(filewrite,MT_PRE_SUB_100,2,'B4');
 
% cd 'C:\Users\cs201470\Desktop\DOD (Git)\TMS Secondary Analysis'



end
end
