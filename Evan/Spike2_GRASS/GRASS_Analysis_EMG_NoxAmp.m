% Created on 02/09/2022 By Jessica Gilliam
% This code is for the single pulse analysis 
% [NoxAmp]


%% Import daHam from Spike2
cd 'C:\Users\jg300416\Documents\MATLAB\DoD\Evan\Spike2_GRASS\DaHam_02_15'
set = 1 ;%[]; %participant number set (46 total)
for y = 1:length(set)
    p = set(y);
        
    for s = 1:3 %session number (1, 2, 3)
        
        ParticipantData.(['Participant_',num2str(p),]).(['Session_', num2str(s),]) = table();
        
        for t = 1:6 % t = 1,2,3 (Pre)  if t = 4,5,6 (Post)
                        
            data = load(sprintf('P%d_S%d_T%d_NoxAmp',p,s,t));
            
            
            
            
        end
    end
end

