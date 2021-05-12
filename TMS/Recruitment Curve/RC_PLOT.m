set = [10,12,13,16,18:22,25:31,35:37,41:45,48:56,59:64,67,68,72,75]; %removed 34
 
 for i = 1:length(set)
    
for p = set(i) 
    run('MID_RC_PLOT.m')
    run('NUMERIC_RC_PLOT.m')
end
clearvars -except p set i

end
