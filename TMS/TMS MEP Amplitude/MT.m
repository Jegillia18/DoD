%% 
 

frames = TMS_Table(:,1);                                                   % Saves the frames column as a cell array (iso cell)
frames = frames(3:end);                                                    % Saves the frames from the 3rd row (where the values start)to the end
frames = cell2mat(frames);                                                 % Converts the cell array into a regular matrix

% frame_start = input('Input the starting frame number for this analysis, frame_start = ');                % Sets the starting frame number for the range you want to analyze
% frame_end = input('Input the ending frame number for for this analysis, frame_end = ');                  % Sets the end frame number for the range you want to analyze
% 
% for i=1:length(frames)                                                     % Matches the the start frame you want to analzye with their indexed location number and changes start frame accordingly
% if frames(i) == frame_start                                                % Checks to see if the value of frame_start equals frames current i. If so saves frame_start as i.
%     frame_start = i;
% end
% end
% for i=1:length(frames)                                                     % Matches the the end frame you want to analzye with their indexed location number and changes end frame accordingly
% if frames(i) == frame_end                                                  % Checks to see if the value of frame_end equals frames current i. If so saves frame_end as i.
%     frame_end = i;
% end
% end 
%% 

POST_BL_Wrist_ex = TMS_Table(:,37);                                         % Saves the MEP_Rt_wrist_ex column as a cell array (iso cell)
POST_BL_Wrist_ex = POST_BL_Wrist_ex(3:end);                                  % Saves the MEP_Rt_wrist_ex from the 3rd row (where the values start)to the end
POST_BL_Wrist_ex=  cell2mat(POST_BL_Wrist_ex);                               % Converts the cell array into a regular matrix
POST_BL_Wrist_ex = splitapply(@(x1){round(x1,6)},POST_BL_Wrist_ex(frame_start:frame_end),G);       % Sorts MEP_Rt_wrist_ex based in the mso groups found before

POST_BL_Thenar = TMS_Table(:,41);                                         % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
POST_BL_Thenar = POST_BL_Thenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
POST_BL_Thenar = cell2mat(POST_BL_Thenar);                             % Converts the cell array into a regular matrix
POST_BL_Thenar = splitapply(@(x1){round(x1,6)},POST_BL_Thenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

POST_BL_Hypothenar = TMS_Table(:,42);                                         % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
POST_BL_Hypothenar = POST_BL_Hypothenar(3:end);                                % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
POST_BL_Hypothenar = cell2mat(POST_BL_Hypothenar);                             % Converts the cell array into a regular matrix
POST_BL_Hypothenar = splitapply(@(x1){round(x1,6)},POST_BL_Hypothenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

%% 

%Wrist Extensor
PRE_BL_Wrist_ex = TMS_Table(:,45);                                        % Saves the MEP_Rt_wrist_ex column as a cell array (iso cell)
PRE_BL_Wrist_ex = PRE_BL_Wrist_ex(3:end);                                % Saves the MEP_Rt_wrist_ex from the 3rd row (where the values start)to the end
PRE_BL_Wrist_ex=  cell2mat(PRE_BL_Wrist_ex);                             % Converts the cell array into a regular matrix
PRE_BL_Wrist_ex = splitapply(@(x1){round(x1,6)},PRE_BL_Wrist_ex(frame_start:frame_end),G);       % Sorts MEP_Rt_wrist_ex based in the mso groups found before
 
%Thenar
PRE_BL_Thenar = TMS_Table(:,49);                                          % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
PRE_BL_Thenar = PRE_BL_Thenar(3:end);                                    % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
PRE_BL_Thenar = cell2mat(PRE_BL_Thenar);                                 % Converts the cell array into a regular matrix
PRE_BL_Thenar = splitapply(@(x1){round(x1,6)},PRE_BL_Thenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before

%Hypothenar
PRE_BL_Hypothenar = TMS_Table(:,50);                                      % Saves the MEP_Lft_wrist_ex column as a cell array (iso cell)
PRE_BL_Hypothenar = PRE_BL_Hypothenar(3:end);                            % Saves the MEP_Lft_wrist_ex from the 3rd row (where the values start)to the end
PRE_BL_Hypothenar = cell2mat(PRE_BL_Hypothenar);                         % Converts the cell array into a regular matrix
PRE_BL_Hypothenar = splitapply(@(x1){round(x1,6)},PRE_BL_Hypothenar(frame_start:frame_end),G);      % Sorts MEP_Lft_wrist_ex based in the mso groups found before
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Wrist Extensor
MT_MEP_Wrist_ex_avg = msogrps;
%Pre-allocating%%%%%%%%%%%%%%%%%%%%%%%%%%%  
MT_MEP_Wrist_ex_values = zeros(1,20);
MEP_BL_Wrist_ex_values_post = zeros(1,20);
MEP_BL_Wrist_ex_values_pre = zeros(1,20);

temp_test = zeros(1);

MEP_BL_Wrist_ex_avg_post = msogrps;
MEP_BL_Wrist_ex_avg_pre = msogrps;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:length(MEP_Wrist_ex)    %(5)
    temp = cell2mat(MEP_Wrist_ex(i));
    
    temp_BL_post = cell2mat(POST_BL_Wrist_ex(i));
    
    temp_BL_pre = cell2mat(PRE_BL_Wrist_ex(i));
    
    MT_MEP_Wrist_ex_values(i,:) = zeros(1,20);     %%%%%%%
    
    MEP_BL_Wrist_ex_values_post(i,:) = zeros(1,20);
    
    MEP_BL_Wrist_ex_values_pre(i,:) = zeros(1,20);
    
    for n = 1:length(temp)
      if RorA == 2
        if temp(n) > 200                  %Numeric 
            temp_test(n) = 1;
            
            MT_MEP_Wrist_ex_values(i,n) = temp(n);
            
            MEP_BL_Wrist_ex_values_post(i,n) = temp_BL_post(n);
            
            MEP_BL_Wrist_ex_values_pre(i,n) = temp_BL_pre(n);
        else
            temp_test(n) = 0;
           
            MT_MEP_Wrist_ex_values(i,n) = 0;
            
            MEP_BL_Wrist_ex_values_post(i,n) = 0;
            
            MEP_BL_Wrist_ex_values_pre(i,n) = 0;
        end
        
      elseif RorA == 1
                if temp(n) > 50                 %Numeric 
            temp_test(n) = 1;
            
            MT_MEP_Wrist_ex_values(i,n) = temp(n);
            
            MEP_BL_Wrist_ex_values_post(i,n) = temp_BL_post(n);
            
            MEP_BL_Wrist_ex_values_pre(i,n) = temp_BL_pre(n);
        else
            temp_test(n) = 0;
           
            MT_MEP_Wrist_ex_values(i,n) = 0;
            
            MEP_BL_Wrist_ex_values_post(i,n) = 0;
            
            MEP_BL_Wrist_ex_values_pre(i,n) = 0;
                end
      end
    end
        if sum(temp_test)/length(temp_test) >= 0.50
         

            
            MT_MEP_Wrist_ex_avg(i,2) = mean(nonzeros(MT_MEP_Wrist_ex_values(i,:)));
            
            MT_MEP_Wrist_ex_values(i,:) = MT_MEP_Wrist_ex_values(i,:);
            
            MEP_BL_Wrist_ex_values_post(i,:) = MEP_BL_Wrist_ex_values_post(i,:);
           
            MEP_BL_Wrist_ex_avg_post(i,2) = mean(nonzeros(MEP_BL_Wrist_ex_values_post(i,:)));
           
            MEP_BL_Wrist_ex_values_pre(i,:) = MEP_BL_Wrist_ex_values_pre(i,:);
           
            MEP_BL_Wrist_ex_avg_pre(i,2) = mean(nonzeros( MEP_BL_Wrist_ex_values_pre(i,:)));
           
        else

            
            MT_MEP_Wrist_ex_avg(i,2) = 0;
            
            MT_MEP_Wrist_ex_values(i,:) = zeros(1,length((MT_MEP_Wrist_ex_values(i,:))));    %%%%%
            
            MEP_BL_Wrist_ex_values_post(i,:) = zeros(1,length((MEP_BL_Wrist_ex_values_post(i,:))));
           
            MEP_BL_Wrist_ex_avg_post(i,2) = 0;
            
            MEP_BL_Wrist_ex_values_pre(i,:) = zeros(1,length((MEP_BL_Wrist_ex_values_pre(i,:))));
           
            MEP_BL_Wrist_ex_avg_pre(i,2) = 0;
            
 clear temp_test  
        end
end




 %% Thenar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 MT_MEP_Thenar_avg = msogrps;
 
%Pre-allocating%%%%%%%%%%%%%%%%%%%%%%%%%%%   
MT_MEP_Thenar_values = zeros(1,20);
MEP_BL_Thenar_values_post = zeros(1,20);
MEP_BL_Thenar_values_pre = zeros(1,20);

temp_test = zeros(1);

MEP_BL_Thenar_avg_post = msogrps;
MEP_BL_Thenar_avg_pre = msogrps;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

for i=1:length(MEP_Thenar)    %(5)
    temp = cell2mat(MEP_Thenar(i));
    
    temp_BL_post = cell2mat(POST_BL_Thenar(i));
    
    temp_BL_pre = cell2mat(PRE_BL_Thenar(i));
    
    MT_MEP_Thenar_values(i,:) = zeros(1,20);     %%%%%%%
    
    MEP_BL_Thenar_values_post(i,:) = zeros(1,20);
    
    MEP_BL_Thenar_values_pre(i,:) = zeros(1,20);
    
    for n = 1:length(temp)
      if RorA == 2
        if temp(n) > 200                  %Numeric 
            temp_test(n) = 1;
            
            MT_MEP_Thenar_values(i,n) = temp(n);
            
            MEP_BL_Thenar_values_post(i,n) = temp_BL_post(n);
            
            MEP_BL_Thenar_values_pre(i,n) = temp_BL_pre(n);
        else
            temp_test(n) = 0;
           
            MT_MEP_Thenar_values(i,n) = 0;
            
            MEP_BL_Thenar_values_post(i,n) = 0;
            
            MEP_BL_Thenar_values_pre(i,n) = 0;
        end
        
      elseif RorA == 1
                if temp(n) > 50                 %Numeric 
            temp_test(n) = 1;
            
            MT_MEP_Thenar_values(i,n) = temp(n);
            
            MEP_BL_Thenar_values_post(i,n) = temp_BL_post(n);
            
            MEP_BL_Thenar_values_pre(i,n) = temp_BL_pre(n);
        else
            temp_test(n) = 0;
           
            MT_MEP_Thenar_values(i,n) = 0;
            
            MEP_BL_Thenar_values_post(i,n) = 0;
            
            MEP_BL_Thenar_values_pre(i,n) = 0;
                end
      end
    end
        if sum(temp_test)/length(temp_test) >= 0.50
         

            
            MT_MEP_Thenar_avg(i,2) = mean(nonzeros(MT_MEP_Thenar_values(i,:)));
            
            MT_MEP_Thenar_values(i,:) = MT_MEP_Thenar_values(i,:);
            
            MEP_BL_Thenar_values_post(i,:) = MEP_BL_Thenar_values_post(i,:);
           
            MEP_BL_Thenar_avg_post(i,2) = mean(nonzeros(MEP_BL_Thenar_values_post(i,:)));
           
            MEP_BL_Thenar_values_pre(i,:) = MEP_BL_Thenar_values_pre(i,:);
           
            MEP_BL_Thenar_avg_pre(i,2) = mean(nonzeros(MEP_BL_Thenar_values_pre(i,:)));
           
        else

            
            MT_MEP_Thenar_avg(i,2) = 0;
            
            MT_MEP_Thenar_values(i,:) = zeros(1,length((MT_MEP_Thenar_values(i,:))));    %%%%%
            
            MEP_BL_Thenar_values_post(i,:) = zeros(1,length((MEP_BL_Thenar_values_post(i,:))));
           
            MEP_BL_Thenar_avg_post(i,2) = 0;
            
            MEP_BL_Thenar_values_pre(i,:) = zeros(1,length((MEP_BL_Thenar_values_pre(i,:))));
           
            MEP_BL_Thenar_avg_pre(i,2) = 0;
            
 clear temp_test  
        end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %% Hypothenar
 
MT_MEP_Hypothenar_avg = msogrps;
%Pre-allocating%%%%%%%%%%%%%%%%%%%%%%%%%%%  
MT_MEP_Hypothenar_values = zeros(1,20);
MEP_BL_Hypothenar_values_post = zeros(1,20);
MEP_BL_Hypothenar_values_pre = zeros(1,20);

temp_test = zeros(1);

MEP_BL_Hypothenar_avg_post = msogrps;
MEP_BL_Hypothenar_avg_pre = msogrps;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:length(MEP_Hypothenar)    %(5)
    temp = cell2mat(MEP_Hypothenar(i));
    
    temp_BL_post = cell2mat(POST_BL_Hypothenar(i));
    
    temp_BL_pre = cell2mat(PRE_BL_Hypothenar(i));
    
    MT_MEP_Hypothenar_values(i,:) = zeros(1,20);     %%%%%%%
    
    MEP_BL_Hypothenar_values_post(i,:) = zeros(1,20);
    
    MEP_BL_Hypothenar_values_pre(i,:) = zeros(1,20);
    
    for n = 1:length(temp)
      if RorA == 2
        if temp(n) > 200                  %Numeric 
            temp_test(n) = 1;
            
            MT_MEP_Hypothenar_values(i,n) = temp(n);
            
            MEP_BL_Hypothenar_values_post(i,n) = temp_BL_post(n);
            
            MEP_BL_Hypothenar_values_pre(i,n) = temp_BL_pre(n);
        else
            temp_test(n) = 0;
           
            MT_MEP_Hypothenar_values(i,n) = 0;
            
            MEP_BL_Hypothenar_values_post(i,n) = 0;
            
            MEP_BL_Hypothenar_values_pre(i,n) = 0;
        end
        
      elseif RorA == 1
                if temp(n) > 50                 %Numeric 
            temp_test(n) = 1;
            
            MT_MEP_Hypothenar_values(i,n) = temp(n);
            
            MEP_BL_Hypothenar_values_post(i,n) = temp_BL_post(n);
            
            MEP_BL_Hypothenar_values_pre(i,n) = temp_BL_pre(n);
        else
            temp_test(n) = 0;
           
            MT_MEP_Hypothenar_values(i,n) = 0;
            
            MEP_BL_Hypothenar_values_post(i,n) = 0;
            
            MEP_BL_Hypothenar_values_pre(i,n) = 0;
                end
      end
    end
        if sum(temp_test)/length(temp_test) >= 0.50
         

            
            MT_MEP_Hypothenar_avg(i,2) = mean(nonzeros(MT_MEP_Hypothenar_values(i,:)));
            
            MT_MEP_Hypothenar_values(i,:) = MT_MEP_Hypothenar_values(i,:);
            
            MEP_BL_Hypothenar_values_post(i,:) = MEP_BL_Hypothenar_values_post(i,:);
           
            MEP_BL_Hypothenar_avg_post(i,2) = mean(nonzeros(MEP_BL_Hypothenar_values_post(i,:)));
           
            MEP_BL_Hypothenar_values_pre(i,:) = MEP_BL_Hypothenar_values_pre(i,:);
           
            MEP_BL_Hypothenar_avg_pre(i,2) = mean(nonzeros(MEP_BL_Hypothenar_values_pre(i,:)));
           
        else

            
            MT_MEP_Hypothenar_avg(i,2) = 0;
            
            MT_MEP_Hypothenar_values(i,:) = zeros(1,length((MT_MEP_Hypothenar_values(i,:))));    %%%%%
            
            MEP_BL_Hypothenar_values_post(i,:) = zeros(1,length((MEP_BL_Hypothenar_values_post(i,:))));
           
            MEP_BL_Hypothenar_avg_post(i,2) = 0;
            
            MEP_BL_Hypothenar_values_pre(i,:) = zeros(1,length((MEP_BL_Hypothenar_values_pre(i,:))));
           
            MEP_BL_Hypothenar_avg_pre(i,2) = 0;
            
 clear temp_test  
        end
end

  
%% Wrist Extensor


MT_POST_SUB_Wrist_ex_avg = msogrps;
%Pre-allocating%%%%%%%%%%%%%%%%%%%%%%%%%%%  
MT_POST_SUB_Wrist_ex_values = zeros(1,20);
POST_BL_Wrist_ex_values = zeros(1,20);
POST_BL_Wrist_ex_avg = zeros(1);

temp_test = zeros(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:length(POST_SUB_Wrist_ex)
    temp = cell2mat(POST_SUB_Wrist_ex(i));   %%%%%%% problem
    
    temp_BL = cell2mat(POST_BL_Wrist_ex(i)); %%%%%%% problem
    
    MT_POST_SUB_Wrist_ex_values(i,:) = zeros(1,20);   %%%%%%%
    
    POST_BL_Wrist_ex_values(i,:) = zeros(1,20);

    for n = 1:length(temp)
        if temp(n) > 50
            
            temp_test(n) = 1;
            
            MT_POST_SUB_Wrist_ex_values(i,n) = temp(n);
            
            POST_BL_Wrist_ex_values(i,n) = temp_BL(n);
        else
            temp_test(n) = 0;
            
            MT_POST_SUB_Wrist_ex_values(i,n) = 0;
            
            POST_BL_Wrist_ex_values(i,n) = 0;
        end
    end
        if sum(temp_test)/length(temp_test) >= 0.50
          

            
           MT_POST_SUB_Wrist_ex_avg(i,2) = mean(nonzeros(MT_POST_SUB_Wrist_ex_values(i,:)));       
            
           MT_POST_SUB_Wrist_ex_values(i,:) = MT_POST_SUB_Wrist_ex_values(i,:);
           
           POST_BL_Wrist_ex_values(i,:) = POST_BL_Wrist_ex_values(i,:);
           
           POST_BL_Wrist_ex_avg(i,:) = mean(nonzeros(POST_BL_Wrist_ex_values(i,:)));
        
        else

          
           MT_POST_SUB_Wrist_ex_avg(i,2) = 0;
              
           MT_POST_SUB_Wrist_ex_values(i,:) = zeros(1,length((MT_POST_SUB_Wrist_ex_values(i,:))));  %%%%%%%
           
           POST_BL_Wrist_ex_values(i,:) = zeros(1,length((POST_BL_Wrist_ex_values(i,:))));
           
           POST_BL_Wrist_ex_avg(i,:) = 0;
        end
 clear temp_test
end 


 %% Thenar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

 MT_POST_SUB_Thenar_avg = msogrps;
%Pre-allocating%%%%%%%%%%%%%%%%%%%%%%%%%%%   
MT_POST_SUB_Thenar_values = zeros(1,20);
POST_BL_Thenar_values = zeros(1,20);
POST_BL_Thenar_avg = zeros(1);

temp_test = zeros(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
for i=1:length(POST_SUB_Thenar)
    temp = cell2mat(POST_SUB_Thenar(i));
    
    temp_BL = cell2mat(POST_BL_Thenar(i));
    
    MT_POST_SUB_Thenar_values(i,:) = zeros(1,20);  %%%%%%%%%
    
    POST_BL_Thenar_values(i,:) = zeros(1,20);

    for n = 1:length(temp)
        if temp(n) > 50
            
            temp_test(n) = 1;
            
            MT_POST_SUB_Thenar_values(i,n) = temp(n);
            
            POST_BL_Thenar_values(i,n) = temp_BL(n);
        else
            temp_test(n) = 0;
            
            MT_POST_SUB_Thenar_values(i,n) = 0;
            
            POST_BL_Thenar_values(i,n) = 0;
        end
    end
        if sum(temp_test)/length(temp_test) >= 0.50
          
        
            
           MT_POST_SUB_Thenar_avg(i,2) = mean(nonzeros(MT_POST_SUB_Thenar_values(i,:)));       
            
           MT_POST_SUB_Thenar_values(i,:) = MT_POST_SUB_Thenar_values(i,:);
           
           POST_BL_Thenar_values(i,:) = POST_BL_Thenar_values(i,:);
           
           POST_BL_Thenar_avg(i,:) = mean(nonzeros(POST_BL_Thenar_values(i,:)));
        
        else
       
          
           MT_POST_SUB_Thenar_avg(i,2) = 0;
            
           MT_POST_SUB_Thenar_values(i,:) = zeros(1,length((MT_POST_SUB_Thenar_values(i,:))));   %%%%%%%
           
           POST_BL_Thenar_values(i,:) = zeros(1,length((POST_BL_Thenar_values(i,:))));
           
           POST_BL_Thenar_avg(i,:) = 0;
        end
    clear temp_test
 end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %% Hypothenar
 

    MT_POST_SUB_Hypothenar_avg = msogrps;
%Pre-allocating%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    MT_POST_SUB_Hypothenar_values = zeros(1,20);
    POST_BL_Hypothenar_values = zeros(1,20);
    POST_BL_Hypothenar_avg = zeros(1);

    temp_test = zeros(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  
for i=1:length(POST_SUB_Hypothenar)
    temp = cell2mat(POST_SUB_Hypothenar(i));
    
    temp_BL = cell2mat(POST_BL_Hypothenar(i));
    
    MT_POST_SUB_Hypothenar_values(i,:) = zeros(1,20);   %%%%%%%%%%
    
    POST_BL_Hypothenar_values(i,:) = zeros(1,20);

    for n = 1:length(temp)
        if temp(n) > 50
            
            temp_test(n) = 1;
            
            MT_POST_SUB_Hypothenar_values(i,n) = temp(n);
            
            POST_BL_Hypothenar_values(i,n) = temp_BL(n);
        else
            temp_test(n) = 0;
            
            MT_POST_SUB_Hypothenar_values(i,n) = 0;
            
            POST_BL_Hypothenar_values(i,n) = 0;
        end
    end
        if sum(temp_test)/length(temp_test) >= 0.50
          
     
            
           MT_POST_SUB_Hypothenar_avg(i,2) = mean(nonzeros(MT_POST_SUB_Hypothenar_values(i,:)));       
            
           MT_POST_SUB_Hypothenar_values(i,:) = MT_POST_SUB_Hypothenar_values(i,:);
           
           POST_BL_Hypothenar_values(i,:) = POST_BL_Hypothenar_values(i,:);
           
           POST_BL_Hypothenar_avg(i,:) = mean(nonzeros(POST_BL_Hypothenar_values(i,:)));
           
        
        else
         
          
           MT_POST_SUB_Hypothenar_avg(i,2) = 0;
            
           MT_POST_SUB_Hypothenar_values(i,:) = zeros(1,length((MT_POST_SUB_Hypothenar_values(i,:))));
           
           POST_BL_Hypothenar_values(i,:) = zeros(1,length((POST_BL_Hypothenar_values(i,:))));
           
           POST_BL_Hypothenar_avg(i,:) = 0;
        end
    clear temp_test
 end



%% Wrist Extensor


MT_PRE_SUB_Wrist_ex_avg = msogrps;
%Pre-allocating%%%%%%%%%%%%%%%%%%%%%%%%%%%  
MT_PRE_SUB_Wrist_ex_values = zeros(1,20);
PRE_BL_Wrist_ex_values = zeros(1,20);
PRE_BL_Wrist_ex_avg = zeros(1);

temp_test = zeros(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:length(PRE_SUB_Wrist_ex)
    temp = cell2mat(PRE_SUB_Wrist_ex(i));
    
    temp_BL = cell2mat(PRE_BL_Wrist_ex(i));
    
    MT_PRE_SUB_Wrist_ex_values(i,:) = zeros(1,20);   %%%%%%%
    
     PRE_BL_Wrist_ex_values(i,:) = zeros(1,20);

    for n = 1:length(temp)
        if temp(n) > 50
            
            temp_test(n) = 1;
            
            MT_PRE_SUB_Wrist_ex_values(i,n) = temp(n);
            
            PRE_BL_Wrist_ex_values(i,n) = temp_BL(n);
        else
            temp_test(n) = 0;
            
            MT_PRE_SUB_Wrist_ex_values(i,n) = 0;
            
            PRE_BL_Wrist_ex_values(i,n) = 0;
        end
    end
        if sum(temp_test)/length(temp_test) >= 0.50
         
            
           MT_PRE_SUB_Wrist_ex_avg(i,2) = mean(nonzeros(MT_PRE_SUB_Wrist_ex_values(i,:)));       
            
           MT_PRE_SUB_Wrist_ex_values(i,:) = MT_PRE_SUB_Wrist_ex_values(i,:);
           
           PRE_BL_Wrist_ex_values(i,:) = PRE_BL_Wrist_ex_values(i,:);
           
           PRE_BL_Wrist_ex_avg(i,:) = mean(nonzeros(PRE_BL_Wrist_ex_values(i,:)));
        
        else
       
          
           MT_PRE_SUB_Wrist_ex_avg(i,2) = 0;
              
           MT_PRE_SUB_Wrist_ex_values(i,:) = zeros(1,length((MT_PRE_SUB_Wrist_ex_values(i,:))));  %%%%%%%
           
           PRE_BL_Wrist_ex_values(i,:) = zeros(1,length((PRE_BL_Wrist_ex_values(i,:))));
           
           PRE_BL_Wrist_ex_avg(i,:) = 0;
        end
 clear temp_test
end 

 %% Thenar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

 MT_PRE_SUB_Thenar_avg = msogrps;
%Pre-allocating%%%%%%%%%%%%%%%%%%%%%%%%%%%  
MT_PRE_SUB_Thenar_values = zeros(1,20);
PRE_BL_Thenar_values = zeros(1,20);
PRE_BL_Thenar_avg = zeros(1);

temp_test = zeros(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:length(PRE_SUB_Thenar)
    temp = cell2mat(PRE_SUB_Thenar(i));
    
    temp_BL = cell2mat(PRE_BL_Thenar(i));
    
    MT_PRE_SUB_Thenar_values(i,:) = zeros(1,20);  %%%%%%%%%
    
    PRE_BL_Thenar_values(i,:) = zeros(1,20);

    for n = 1:length(temp)
        if temp(n) > 50
            
            temp_test(n) = 1;
            
            MT_PRE_SUB_Thenar_values(i,n) = temp(n);
            
            PRE_BL_Thenar_values(i,n) = temp_BL(n);
        else
            temp_test(n) = 0;
            
            MT_PRE_SUB_Thenar_values(i,n) = 0;
            
            PRE_BL_Thenar_values(i,n) = 0;
        end
    end
        if sum(temp_test)/length(temp_test) >= 0.50
          
         
            
           MT_PRE_SUB_Thenar_avg(i,2) = mean(nonzeros(MT_PRE_SUB_Thenar_values(i,:)));       
            
           MT_PRE_SUB_Thenar_values(i,:) = MT_PRE_SUB_Thenar_values(i,:);
           
           PRE_BL_Thenar_values(i,:) = PRE_BL_Thenar_values(i,:);
           
           PRE_BL_Thenar_avg(i,:) = mean(nonzeros(PRE_BL_Thenar_values(i,:)));
        
        else

          
           MT_PRE_SUB_Thenar_avg(i,2) = 0;
            
           MT_PRE_SUB_Thenar_values(i,:) = zeros(1,length((MT_PRE_SUB_Thenar_values(i,:))));   %%%%%%%
           
           PRE_BL_Thenar_values(i,:) = zeros(1,length((PRE_BL_Thenar_values(i,:))));
           
           PRE_BL_Thenar_avg(i,:) = 0;
        end
    clear temp_test
 end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %% Hypothenar
 

  MT_PRE_SUB_Hypothenar_avg = msogrps;
%Pre-allocating%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    MT_PRE_SUB_Hypothenar_values = zeros(1,20);
    PRE_BL_Hypothenar_values = zeros(1,20);
    PRE_BL_Hypothenar_avg = zeros(1);

    temp_test = zeros(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
for i=1:length(PRE_SUB_Hypothenar)
    temp = cell2mat(PRE_SUB_Hypothenar(i));
    
    temp_BL = cell2mat(PRE_BL_Hypothenar(i));
    
    MT_PRE_SUB_Hypothenar_values(i,:) = zeros(1,20);   %%%%%%%%%%
    
    PRE_BL_Hypothenar_values(i,:) = zeros(1,20);


    for n = 1:length(temp)
        if temp(n) > 50
            
            temp_test(n) = 1;
            
            MT_PRE_SUB_Hypothenar_values(i,n) = temp(n);
            
            PRE_BL_Hypothenar_values(i,n) = temp_BL(n);
        else
            temp_test(n) = 0;
            
            MT_PRE_SUB_Hypothenar_values(i,n) = 0;
            
            PRE_BL_Hypothenar_values(i,n) = 0;
        end
    end
        if sum(temp_test)/length(temp_test) >= 0.50
          

            
           MT_PRE_SUB_Hypothenar_avg(i,2) = mean(nonzeros(MT_PRE_SUB_Hypothenar_values(i,:)));       
            
           MT_PRE_SUB_Hypothenar_values(i,:) = MT_PRE_SUB_Hypothenar_values(i,:);
           
           PRE_BL_Hypothenar_values(i,:) = PRE_BL_Hypothenar_values(i,:);
           
           PRE_BL_Hypothenar_avg(i,:) = mean(nonzeros(PRE_BL_Hypothenar_values(i,:)));
           
        
        else
      
          
           MT_PRE_SUB_Hypothenar_avg(i,2) = 0;
            
           MT_PRE_SUB_Hypothenar_values(i,:) = zeros(1,length((MT_PRE_SUB_Hypothenar_values(i,:))));
           
           PRE_BL_Hypothenar_values(i,:) = zeros(1,length((PRE_BL_Hypothenar_values(i,:))));
           
           PRE_BL_Hypothenar_avg(i,:) = 0;
        end
    clear temp_test
 end
 %% 


%% 
clear n
clear temp_test
