% set = [10,12,13,16,18:22,25:31,35:37,41:45,48:56,59:64,67,68,72,75]; %removed 34
%  
%  for i = 1:length(set)
%     
% for p = set(i) 

% cd 'C:\Users\cs201470\Desktop\DOD (Git)\Completed RC' 

filename = sprintf('P%d_SUB_MEP_RESTING_RC',p); 
%filewrite = sprintf('P%d_SUB_MEP_ACTIVE_RC.xlsx',p);

%wrist
%thenar
%hypo
%PRE_SUB = mid
%MT = numeric

%% PRE_SUB 


PRE_SUB = xlsread(filename,1);
% s = size(PRE_SUB);
% s = s(1);
%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PRE_MSO = PRE_SUB(:,1);
PRE_MEANS = PRE_SUB(:,2);

zero1 = PRE_MSO == 0;

PRE_MSO(zero1) = [];
PRE_MEANS(zero1) = [];

plot_length = length(PRE_MSO) / 3;

pthenar_start = plot_length+1;
pthenar_end = plot_length*2;

phypo_start = (plot_length*2)+1;


PRE_MSO_WRIST = PRE_MSO(1:plot_length);
PRE_MEANS_WRIST = PRE_MEANS(1:plot_length);

PRE_MSO_THENAR = PRE_MSO(pthenar_start:pthenar_end);
PRE_MEANS_THENAR = PRE_MEANS(pthenar_start:pthenar_end);

PRE_MSO_HYPO = PRE_MSO(phypo_start:end);
PRE_MEANS_HYPO = PRE_MEANS(phypo_start:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PLOT%
T = sprintf('P%d MID PRE Wrist Extensor',p);
fig = plot(PRE_MSO_WRIST,PRE_MEANS_WRIST,'-o','MarkerFaceColor', 'b');
title(T)
saveas(fig,T,'meta')

T = sprintf('P%d MID PRE Thenar',p);

fig = plot(PRE_MSO_THENAR,PRE_MEANS_THENAR,'-o','MarkerFaceColor', 'b');
title(T)
saveas(fig,T,'meta')

T = sprintf('P%d MID PRE Hypothenar',p);
fig = plot(PRE_MSO_HYPO,PRE_MEANS_HYPO,'-o','MarkerFaceColor', 'b');
title(T)
saveas(fig,T,'meta')

%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
try
POST_MSO = PRE_SUB(:,3);
POST_MEANS = PRE_SUB(:,4);

zero2 = POST_MSO == 0;

POST_MSO(zero2) = [];
POST_MEANS(zero2) = [];

plot_length = length(POST_MSO) / 3;

pthenar_start = plot_length+1;
pthenar_end = plot_length*2;

phypo_start = (plot_length*2)+1;

POST_MSO_WRIST = POST_MSO(1:plot_length);
POST_MEANS_WRIST = POST_MEANS(1:plot_length);

POST_MSO_THENAR = POST_MSO(pthenar_start:pthenar_end);
POST_MEANS_THENAR = POST_MEANS(pthenar_start:pthenar_end);

POST_MSO_HYPO = POST_MSO(phypo_start:end);
POST_MEANS_HYPO = POST_MEANS(phypo_start:end);

errorget=POST_MSO(2);
catch
POST_MSO_WRIST = 0;
POST_MEANS_WRIST = 0;

POST_MSO_THENAR = 0;
POST_MEANS_THENAR = 0;

POST_MSO_HYPO = 0;
POST_MEANS_HYPO = 0;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PLOT%
T = sprintf('P%d MID POST Wrist Extensor',p);
fig = plot(POST_MSO_WRIST,POST_MEANS_WRIST,'-o','MarkerFaceColor', 'b');
title(T)
saveas(fig,T,'meta')

T = sprintf('P%d MID POST Thenar',p);

fig = plot(POST_MSO_THENAR,POST_MEANS_THENAR,'-o','MarkerFaceColor', 'b');
title(T)
saveas(fig,T,'meta')

T = sprintf('P%d MID POST Hypothenar',p);
fig = plot(POST_MSO_HYPO,POST_MEANS_HYPO,'-o','MarkerFaceColor', 'b');
title(T)
saveas(fig,T,'meta')


%% 
try
FOLLOW_UP_MSO = PRE_SUB(:,5);
FOLLOW_UP_MEANS = PRE_SUB(:,6);

zero3 = FOLLOW_UP_MSO == 0;

FOLLOW_UP_MSO(zero3) = [];
FOLLOW_UP_MEANS(zero3) = [];

plot_length = length(FOLLOW_UP_MSO) / 3;

pthenar_start = plot_length+1;
pthenar_end = plot_length*2;

phypo_start = (plot_length*2)+1;

FOLLOW_UP_MSO_WRIST = FOLLOW_UP_MSO(1:plot_length);
FOLLOW_UP_MEANS_WRIST = FOLLOW_UP_MEANS(1:plot_length);

FOLLOW_UP_MSO_THENAR = FOLLOW_UP_MSO(pthenar_start:pthenar_end);
FOLLOW_UP_MEANS_THENAR = FOLLOW_UP_MEANS(pthenar_start:pthenar_end);

FOLLOW_UP_MSO_HYPO = FOLLOW_UP_MSO(phypo_start:end);
FOLLOW_UP_MEANS_HYPO = FOLLOW_UP_MEANS(phypo_start:end);

errorget=FOLLOW_UP_MSO(2);
catch
FOLLOW_UP_MSO_WRIST = 0;
FOLLOW_UP_MEANS_WRIST = 0;

FOLLOW_UP_MSO_THENAR = 0;
FOLLOW_UP_MEANS_THENAR = 0;

FOLLOW_UP_MSO_HYPO = 0;
FOLLOW_UP_MEANS_HYPO = 0;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PLOT%
T = sprintf('P%d MID FOLLOW_UP Wrist Extensor',p);
fig = plot(FOLLOW_UP_MSO_WRIST,FOLLOW_UP_MEANS_WRIST,'-o','MarkerFaceColor', 'b');
title(T)
saveas(fig,T,'meta')

T = sprintf('P%d MID FOLLOW_UP Thenar',p);

fig = plot(FOLLOW_UP_MSO_THENAR,FOLLOW_UP_MEANS_THENAR,'-o','MarkerFaceColor', 'b');
title(T)
saveas(fig,T,'meta')

T = sprintf('P%d MID FOLLOW_UP Hypothenar',p);
fig = plot(FOLLOW_UP_MSO_HYPO,FOLLOW_UP_MEANS_HYPO,'-o','MarkerFaceColor', 'b');
title(T)
saveas(fig,T,'meta')

% cd 'C:\Users\cs201470\Desktop\DOD (Git)'

% end
%  end
 
