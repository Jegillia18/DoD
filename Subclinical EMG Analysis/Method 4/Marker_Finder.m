%% Marker Finder

%[TF,S1,S2] = ischange(Marker_y,'linear');

Marker_Baseline = Marker_y(1:2000);
Marker_mean = mean(Marker_Baseline);
Marker_SD = std(Marker_Baseline);
Marker_SD = Marker_SD*2.5;



for i=1:length(Marker_y)-1
    if Marker_y(i) > (Marker_mean + Marker_SD) && Marker_y(i+1) > (Marker_mean + Marker_SD) && Marker_y(i+2) > (Marker_mean + Marker_SD) && Marker_y(i+3) > (Marker_mean + Marker_SD)&& Marker_y(i+4) > (Marker_mean + Marker_SD)                                               %Variable x will be saved at current i.
            TF_x = Marker_x(i); 
            TF_y = Marker_y(i);                                                          %Loop will break when the conditions have been met.
            ind = i;
            break
    else
            TF_x = 0;                                                       %Variable x will remain blank if conditions are not met.
            TF_y = 0;
    end
    
end




for i=ind:length(Marker_y)-1
    if Marker_y(i) < (Marker_mean + Marker_SD) && Marker_y(i+1) < (Marker_mean + Marker_SD) && Marker_y(i+2) < (Marker_mean + Marker_SD) && Marker_y(i+3) < (Marker_mean + Marker_SD) && Marker_y(i+4) < (Marker_mean + Marker_SD)                                                %Variable x will be saved at current i.
            TF_x_end = Marker_x(i); 
            TF_y_end = Marker_y(i);                                                          %Loop will break when the conditions have been met.
            ind_end = i;
            break
    else
            TF_x_end = 0;                                                       %Variable x will remain blank if conditions are not met.
            TF_y_end = 0;
            
    end
    
end





TF_y(TF_y==0)=[];
TF_x(TF_x==0)=[];

ind(ind==0)=[];
%ind_end = ind+10000;

dur = ind_end - ind;

ind_post = ind_end + dur;
ind_pre = ind - dur;

Marker_start_time = TF_x;
Marker_end_time = TF_x_end;

% TFy_end = Marker_y(ind_end);
% TFx_end = Marker_x(ind_end);

post_check = length(Marker_y) - ind_end;

    if post_check < dur
        TFy_post = Marker_y(end);
        TFx_post = Marker_x(end);
    else
        TFy_post = Marker_y(ind_post);
        TFx_post = Marker_x(ind_post);
    end
    
    
    if ind < dur
        TFy_pre = Marker_y(2);
        TFx_pre = Marker_x(2);
    else
        TFy_pre = Marker_y(ind_pre);
        TFx_pre = Marker_x(ind_pre);
    end  
    



% 
% plot(Marker_x, Marker_y)
% hold on
% plot(TF_x,TF_y,'o')
% hold on
% plot(TF_x_end,TF_y_end,'o')
% hold on
% plot(TFx_post,TFy_post,'o')
% hold on
% plot(TFx_pre,TFy_pre,'o')
