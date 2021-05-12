 warning( 'off', 'MATLAB:xlswrite:AddSheet' ) ;
filename1 = sprintf('P%d_BASELINE_RESTING.xlsx',p);
filename2 = sprintf('P%d_SUB_MEP_RESTING.xlsx',p);

filename3 = sprintf('P%d_BASELINE_ACTIVE.xlsx',p);
filename4 = sprintf('P%d_SUB_MEP_ACTIVE.xlsx',p);

if RorA == 1

 if Session == 1

xlswrite(filename1,POST_BASELINE_VALUES,1,'B4')
xlswrite(filename1,PRE_BASELINE_VALUES,2,'B4')
    

xlswrite(filename1,MEP_BL_POST,3,'B4')
xlswrite(filename1,MEP_BL_PRE,4,'B4')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


xlswrite(filename2,POST_SUB,1,'B4')
xlswrite(filename2,PRE_SUB,2,'B4')

xlswrite(filename2,MT_POST_SUB,3,'B4')
xlswrite(filename2,MT_PRE_SUB,4,'B4')


elseif Session == 2

xlswrite(filename1,POST_BASELINE_VALUES,1,'F4')
xlswrite(filename1,PRE_BASELINE_VALUES,2,'F4')

     
xlswrite(filename1,MEP_BL_POST,3,'Y4')
xlswrite(filename1,MEP_BL_PRE,4,'Y4')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


xlswrite(filename2,POST_SUB,1,'H4')
xlswrite(filename2,PRE_SUB,2,'H4')

xlswrite(filename2,MT_POST_SUB,3,'AT4')
xlswrite(filename2,MT_PRE_SUB,4,'AT4')

elseif Session == 3

xlswrite(filename1,POST_BASELINE_VALUES,1,'J4')
xlswrite(filename1,PRE_BASELINE_VALUES,2,'J4')
     

xlswrite(filename1,MEP_BL_POST,3,'AV4')
xlswrite(filename1,MEP_BL_PRE,4,'AV4')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


xlswrite(filename2,POST_SUB,1,'N4')
xlswrite(filename2,PRE_SUB,2,'N4')

xlswrite(filename2,MT_POST_SUB,3,'CL4')
xlswrite(filename2,MT_PRE_SUB,4,'CL4')

 end   
 
elseif RorA == 2
    

  if Session == 1

xlswrite(filename3,POST_BASELINE_VALUES,1,'B4')
xlswrite(filename3,PRE_BASELINE_VALUES,2,'B4')
    

xlswrite(filename3,MEP_BL_POST,3,'B4')
xlswrite(filename3,MEP_BL_PRE,4,'B4')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


xlswrite(filename4,POST_SUB,1,'B4')
xlswrite(filename4,PRE_SUB,2,'B4')

xlswrite(filename4,MT_POST_SUB,3,'B4')
xlswrite(filename4,MT_PRE_SUB,4,'B4')


elseif Session == 2

xlswrite(filename3,POST_BASELINE_VALUES,1,'F4')
xlswrite(filename3,PRE_BASELINE_VALUES,2,'F4')

     
xlswrite(filename3,MEP_BL_POST,3,'Y4')
xlswrite(filename3,MEP_BL_PRE,4,'Y4')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


xlswrite(filename4,POST_SUB,1,'H4')
xlswrite(filename4,PRE_SUB,2,'H4')

xlswrite(filename4,MT_POST_SUB,3,'AT4')
xlswrite(filename4,MT_PRE_SUB,4,'AT4')

elseif Session == 3

xlswrite(filename3,POST_BASELINE_VALUES,1,'J4')
xlswrite(filename3,PRE_BASELINE_VALUES,2,'J4')
     

xlswrite(filename3,MEP_BL_POST,3,'AV4')
xlswrite(filename3,MEP_BL_PRE,4,'AV4')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


xlswrite(filename4,POST_SUB,1,'N4')
xlswrite(filename4,PRE_SUB,2,'N4')

xlswrite(filename4,MT_POST_SUB,3,'CL4')
xlswrite(filename4,MT_PRE_SUB,4,'CL4')

 end   
end
