

p=30

filename = sprintf('P%d_SUB_MEP_ACTIVE_RC',p);
PRE_SUB = xlsread(filename,1);

PRE_MSO = PRE_SUB(:,1);
PRE_MEANS = PRE_SUB(:,2);

try
POST_MSO = PRE_SUB(:,3);
POST_MEANS = PRE_SUB(:,4);

while POST_MSO(end) == 0
if POST_MSO(end) == 0
    POST_MSO(end) = [];
    POST_MEANS(end) = [];
end
end

catch
    POST_AUC = 0;  %when no post or follow up was performed
end

try
FOLLOW_UP_MSO = PRE_SUB(:,5);
FOLLOW_UP_MEANS = PRE_SUB(:,6);
while FOLLOW_UP_MSO(end) == 0
if FOLLOW_UP_MSO(end) == 0
    FOLLOW_UP_MSO(end) = [];
    FOLLOW_UP_MEANS(end) = [];
end
end

catch
    FOLLOW_UP_AUC = 0; %when no post or follow up was performed
end





while PRE_MSO(end) == 0
if PRE_MSO(end) == 0
    PRE_MSO(end) = [];
    PRE_MEANS(end) = [];
end
end

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
 
PRE_WRIST_AUC = trapz(PRE_MSO_WRIST,PRE_MEANS_WRIST);
PRE_THENAR_AUC = trapz(PRE_MSO_THENAR,PRE_MEANS_THENAR);
PRE_HYPO_AUC = trapz(PRE_MSO_HYPO,PRE_MEANS_HYPO);

PRE_UNMATCHED = [PRE_WRIST_AUC PRE_THENAR_AUC PRE_HYPO_AUC];

PP_MATCHED = intersect(PRE_MSO,POST_MSO);

for i=1:length(PRE_MSO)
    t=1;
    while t == 1
        if PRE_MSO(i) ~= PP_MATCHED(i)
            PRE_MSO(i) = [];
            PRE_MEANS(i) = [];
            t=1;
        elseif PRE_MSO(i) == PP_MATCHED(i)
            t=2;
        end
    end
    
end

for i=1:length(POST_MSO)
    t=1;
    while t == 1
        if POST_MSO(i) ~= PP_MATCHED(i)
            POST_MSO(i) = [];
            POST_MEANS(i) = [];
            t=1;
        elseif POST_MSO(i) == PP_MATCHED(i)
            t=2;
        end
    end
    
end

PRE_PP_MATCHED_AUC = trapz(PRE_MSO,PRE_MEANS);

POST_PP_MATCHED_AUC = trapz(POST_MSO,POST_MEANS);

PPF_MATCHED = intersect(PP_MATCHED,FOLLOW_UP_MSO);




