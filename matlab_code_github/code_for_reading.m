% cd 'C:\Users\HP\Downloads'
% load('waves_tides_and_sea_level_Lisbon.mat')
AT = reshape(AT, [1,240046]);
AT = AT +2;
SLA = reshape(SLA, [1,240046]);
SS = reshape(SS, [1,240046]);
% date_julian = combineddatadetailsnewnew{:,"matlab_julian_date"};
date_julian = newmergeddetails{:,"matlab_julian_date"};
date_julian = reshape(date_julian,[1,61]);
% zeros(1,3)
for i = 1:length(date_julian)
    A = zeros(1,length(TIME));
    for j = 1:length(TIME)
        subtract_time = abs(date_julian(i) - TIME(j));
        A(j) = subtract_time;
    end
    closet_to_i = min(A);
    find_index = find(A==closet_to_i);
    B(i) = find_index;
end
time_selected = TIME(B);
hs_selected = HS(B);
tp_selected = TP(B);
dir_selected = DIR(B);
sla_selected = SLA(B);
ss_selected = SS(B);
at_selected = AT(B);
wave_length_selected = (9.8 * (tp_selected).^2)/(2 * pi);
wave_steepness = hs_selected./wave_length_selected;
surf = wave_steepness.*0.1;
tide_selected = sla_selected + ss_selected + at_selected;
run_up = combineddatadetailsnewnew{:,'wetsand'};
runup_minus_tide = run_up - tide';
subplot(4,1,1);scatter(time_selected,hs_selected)
subplot(4,1,2);scatter(time_selected,tp_selected)
subplot(4,1,3);scatter(time_selected,tide)
subplot(4,1,4);scatter(time_selected,combineddatadetailsnewnew{:,'wetsand'})
subplot(4,1,1)
plot()
scatter(hs_selected, runup_minus_tide)
scatter(wave_steepness', runup_minus_tide);
scatter(surf', runup_minus_tide);
[R, setup] = Runup_Stockdon(hs_selected, tp_selected,0.1);
[R_new, setup_new] = Runup_Stockdon(hs_selected, tp_selected,0.05);
plot(time_selected,runup_minus_tide);
hold on
plot(time_selected,R);
hold on 
plot(time_selected, R_new)
stockdon_mean = mean(R);
runup_minus_tide_mean = mean(runup_minus_tide);
figure(1)
histogram(R_new,'FaceAlpha',1, NumBins=30)
hold on
histogram(runup_minus_tide, NumBins=30)
legend("stockdon","observed")
plot(TIME, AT + 2);

% table_selected = table(time_selected', hs_selected', tp_selected', dir_selected', date_julian');
file_name = 'selected_wave_details_new.xlsx';
% table_selected = table(time_selected', hs_selected', tp_selected', dir_selected', date_julian', ...
%     'VariableNames',{'date_time_wave','HS','TP','DIR','datetime_original'});
table_selected = table(time_selected', hs_selected', tp_selected', dir_selected', ...
tide_selected',date_julian','VariableNames',{'date_time_wave','HS','TP','DIR','Tide','date_time_image'});
writetable(table_selected, file_name)
% 1072