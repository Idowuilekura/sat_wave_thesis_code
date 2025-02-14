Tp = table2array(mergedwaveimageslopedetailscorrected(:,7));
Tide = table2array(mergedwaveimageslopedetailscorrected(:,9));
Hs = table2array(mergedwaveimageslopedetailscorrected(:,6));
slope_data = table2array(mergedwaveimageslopedetailscorrected(:,"slope"));
wave_length = compute_wave_length(Tp);
%  beta is the slope of the profiles
Beta = slope_data;
wet_sand_line = table2array(mergedwaveimageslopedetailscorrected(:,"wetsand"));
water_line = table2array(mergedwaveimageslopedetailscorrected(:,"waterline"));
runup_minus_tide =  wet_sand_line - Tide;
ws = wet_sand_line;
wl = water_line;
runup_sat = ws;
hs_wave_length_sqr = (Hs .* wave_length) .^ (1/2);
surf_similarity = slope_data .* (hs_wave_length_sqr);
% Beta = 0.1;
[R_slope_data, setup_slope_data] = Runup_Stockdon(Hs, Tp, slope_data);
[R_holman, setup_holman] = holman_compute(slope_data,Hs,Tp);
% stockfdon runp + tide
R2 = R_slope_data + Tide;
% R2 holman 
R2_holman = R_holman + Tide;
% set up computed with stockdon
Setup_stockdon = setup_slope_data + Tide;
Setup_holman = setup_holman + Tide;
plot(wl,'r')
hold on
plot(ws,'g')
plot(R2,'k')
legend('waterline','wetsandline','R2')
title("waterline vs wetsandline vs R2")
% #average wet dry(ws) and waterline(wl) can be seen as setup
A = [wl ws];
%  B is the mean of waterline and wetsand
B = mean(A,2);
% # plot
plot(B,'b')
hold on
plot(R2,'g')
plot(Setup,'r')
legend('average waterline/Wetsand','R2','Setup')
title("Avg Water/WetSand vs R2 vs Setup")
% subplot(1,3,1);plot(wl,'b');hold on;plot(Setup,'r');title('waterline');plot(R2,'g')
% subplot(1,3,2);plot(ws,'b');hold on;plot(Setup,'r');title('Wet/Dry');plot(R2,'g')
% subplot(1,3,3);plot(B,'b');hold on;plot(Setup,'r');title('Average');plot(R2,'g')
% subplot(2,2,2);plot(ws,'r')
% hold on;plot(R2,'k');title('Wet/Dry')
% subplot(2,2,4);plot(ws,R2,'o');hold on;plot(0:1:5,0:1:5,'r')
%% Line Plot Stockdon
corr_wl_r2_stock = corrcoef(R2,wl);
subplot(1,3,1);plot(wl,'b');hold on;title("Waterline vs R2. Correlation = " + num2str(corr_wl_r2_stock(1,2)));plot(R2,'g')
legend("waterline","R2");
corr_ws_r2_stock = corrcoef(R2,ws);
subplot(1,3,2);plot(ws,'k');hold on;title("Wet/Dry vs R2. Correlation = " + num2str(corr_ws_r2_stock(1,2)));plot(R2,'g')
legend("wetsand","R2");
corr_average_r2_stock = corrcoef(R2,B);
subplot(1,3,3);plot(B,'m');hold on;title("Average Wet/Waterline vs R2. Correlation = " + num2str(corr_average_r2_stock(1,2)));plot(R2,'g')
legend("Average Wetsand/Waterline","R2")
% corr_setup_r2_stock = corrcoef(Setup, R2);
% subplot(1,4,4);plot(Setup,'r'); hold on; title("Setup vs R2. Correlation = "+ num2str(corr_setup_r2_stock(1,2))); plot(R2,'g')
% legend("setup","R2");
set(gcf,'Position',[ 0.1146 *1000   0.2314 *1000   1.3352*1000    0.4632*1000])
sgtitle("Runup Proxy Comparison for stockdon")

plot(B,Setup,'o')
hold on;plot(0:1:5,0:1:5,'r')

subplot(2,2,1);plot(wl,'r')
hold on;plot(R2,'k');title('Waterline vs R2')
subplot(2,2,3);plot(wl,R2,'o');hold on;plot(0:1:5,0:1:5,'r')
title("Comparison between waterline and R2 ")

subplot(2,2,2);plot(ws,'r')
hold on;plot(R2,'k');title('Wet/Dry vs R2')
subplot(2,2,4);plot(ws,R2,'o');hold on;plot(0:1:5,0:1:5,'r')
title("Comparison between wetsand and R2 ")


scatter(runup_minus_tide, R_slope_data)
title("Runup computed with stockdon vs satellite runup minus tide")
ylabel("Runup computed")
xlabel("satelite wetsand runup minus tide")
stock_runup_coeff = corrcoef(runup_minus_tide, R_slope_data);
title("Runup computed with stockdon vs satellite runup minus tide. R^2=" + num2str(stock_runup_coeff(1,2).^2))

scatter(ws, R2,'blue')
hold on;plot(0:1:7,0:1:7,'r')
stock_r2_coeff = corrcoef(ws, R2);
mean(abs(ws - R2))
title("R2 computed with stockdon vs satellite runup with Tide. R^2 is="+ num2str(stock_r2_coeff(1,2).^2))
ylabel("R2 computed")
xlabel("satelite runup")
% corrcoef(wl, R_slope_data)
scatter(wl, R_slope_data,'blue')
hold on;plot(0:1:7,0:1:7,'r')
stock_r2_coeff = corrcoef(wl, R_slope_data);
title("R computed with stockdon vs satellite runup without Tide. R^2 is="+ num2str(stock_r2_coeff(1,2).^2))
ylabel("R2 computed")
xlabel("satelite runup")
%% Scatter Plot Stockdon
corr_wl_r2_stock = corrcoef(R2,wl);
subplot(1,3,1);plot(wl,'b');hold on;title("Waterline vs R2. Correlation = " + num2str(corr_wl_r2_stock(1,2)));plot(R2,'g')
scatter(wl,R2)
"Waterline vs R2. Correlation = " + "R2"
scatter_plot_equation(wl,ws,B,R2,"Runup Proxy comparison for stockdon","R2")
%% Setup Stockdon
corr_wl_setup_stock = corrcoef(Setup_stockdon,wl);
subplot(1,3,1);plot(wl,'b');hold on;title("Waterline vs Setup. Correlation = " + num2str(corr_wl_setup_stock(1,2)));plot(Setup_stockdon,'g')
legend("waterline","Setup");
corr_ws_setup_stock = corrcoef(Setup_stockdon,ws);
subplot(1,3,2);plot(ws,'k');hold on;title("Wet/Dry vs R2. Correlation = " + num2str(corr_ws_setup_stock(1,2)));plot(Setup_stockdon,'g')
legend("wetsand","Setup");
corr_average_setup_stock = corrcoef(Setup_stockdon,B);
subplot(1,3,3);plot(B,'m');hold on;title("Average Wet/Waterline vs R2. Correlation = " + num2str(corr_average_setup_stock(1,2)));plot(Setup_stockdon,'g')
legend("Average Wetsand/Waterline","Setup");
set(gcf,'Position',[ 0.1146 *1000   0.2314 *1000   1.3352*1000    0.4632*1000])
sgtitle("Setup Proxy Comparison for stockdon")
% offset setup stockdon
mean(abs(Setup_stockdon - wl))
mean(abs(Setup_stockdon - ws))
mean(abs(Setup_stockdon - B))
scatter_plot_equation(wl,ws,B,Setup_stockdon,"Setup Proxy comparison for stockdon","Setup")
% %holman 
scatter(R_holman, runup_minus_tide);
cor_holman = corrcoef(R_holman, runup_minus_tide);
title("Runup computed with Holman vs satellite runup minus tide. R^2 is="+ num2str(cor_holman(1,2).^2))
ylabel("Runup computed")
xlabel("satelite runup minus tide")
cor_holman(1,2).^2;
R2_holman = R_holman + Tide;
R2_holman_corrected = R2_holman - 2.3539;
plot(wl); hold on; plot(R2_holman_corrected)
legend("wl","R2 corrected")
% R2 holman
scatter(R2_holman, wl);
hold on
plot(1:1:4, 1:1:4)

cor_holman_r2 = corrcoef(R2_holman, ws);
title("R2 computed with Holman vs satellite runup with tide. R^2 is="+ num2str(cor_holman_r2(1,2).^2))
ylabel("R2 computed (Runup computed + Tide)")
xlabel("satelite runup")

subplot(1,3,1);plot(wl,'b'); hold on; plot(R2_holman,'g')
legend("waterline","R2");
subplot(1,3,2);plot(ws,'b');hold on;plot(R2_holman,'g')
legend("wetsand","R2");
subplot(1,3,3);plot(B,'b');hold on;plot(R2_holman,'g')
legend("setup","R2");
% suptitle("Holman ")
set(gcf,'Position',[ 0.1146 *1000   0.2314 *1000   1.3352*1000    0.4632*1000])
corrcoef(ws,R2_holman)
plot_proxies(R2_holman,wl,ws,B,'Holman')
% correct for the offset 
mean(abs(B - R2_holman))
%% Setup Holman 
corr_wl_setup_stock = corrcoef(Setup_holman,wl);
subplot(1,3,1);plot(wl,'b');hold on;title("Waterline vs Setup. Correlation = " + num2str(corr_wl_setup_stock(1,2)));plot(Setup_holman,'g')
legend("waterline","Setup");
corr_ws_setup_stock = corrcoef(Setup_holman,ws);
subplot(1,3,2);plot(ws,'k');hold on;title("Wet/Dry vs R2. Correlation = " + num2str(corr_ws_setup_stock(1,2)));plot(Setup_holman,'g')
legend("wetsand","Setup");
corr_average_setup_stock = corrcoef(Setup_holman,B);
subplot(1,3,3);plot(B,'m');hold on;title("Average Wet/Waterline vs R2. Correlation = " + num2str(corr_average_setup_stock(1,2)));plot(Setup_holman,'g')
legend("Average Wetsand/Waterline","Setup");
set(gcf,'Position',[ 0.1146 *1000   0.2314 *1000   1.3352*1000    0.4632*1000])
sgtitle("Setup Proxy Comparison for Holman")
%% Scatter Plot Holman
scatter_plot_equation(wl,ws,B,R2_holman,"Runup Proxy comparison for Holman","R2")

%% Voudeske
% voudesk without tide 
[R_with_tide_vousdou, R_no_tide_vousdou ]= vousdoukasetal_compute(slope_data,Hs,Tp,Tide);
R2_with_tide_vousdou = R_with_tide_vousdou;
R2_no_tide_vousdou = R_no_tide_vousdou + Tide;

plot_proxies(R2_no_tide_vousdou, wl, ws, B,'vousdoukasetal with no tide')
plot_proxies(R2_with_tide_vousdou, wl, ws, B,'vousdoukasetal with tide')

mean(R2_holman - wl)

subplot(1,2,1)
scatter(R_no_tide_vousdou, runup_minus_tide);
cor_vousdou_no_tide_1 = corrcoef(R_no_tide_vousdou, runup_minus_tide);
title("Runup computed with vousdoukasetal vs satellite runup minus tide. R^2 is="+ num2str(cor_vousdou_no_tide_1(1,2).^2))
ylabel("Runup computed")
xlabel("satelite runup minus tide")
subplot(1,2,2)
scatter(R_no_tide_vousdou, runup_sat);
cor_vousdou_no_tide_2 = corrcoef(R_no_tide_vousdou, runup_sat);
title("Runup computed with vousdoukasetal vs satellite runup with tide. R^2 is="+ num2str(cor_vousdou_no_tide_2(1,2).^2))
ylabel("Runup computed")
xlabel("satelite runup with tide")

set(gcf,'Position',[ 0.1146 *1000   0.2314 *1000   1.3352*1000    0.4632*1000])

set(gcf,'Position',[2.0274    0.0314    1.6584    0.4640])
%% Scatter Voudos
scatter_plot_equation(wl,ws,B,R_with_tide_vousdou,"Runup Proxy comparison for vousdou with tide","R2")
scatter_plot_equation(wl,ws,B,R_no_tide_vousdou,"Runup Proxy comparison for vousdou with no tide","R2")



%% Research paper comparison
% runup vs wave height
scatter(Hs,runup_minus_tide)
coerf_hs_wl = corrcoef(Hs, runup_minus_tide);
% hold on 
% plot(-2.5:1:5,-2.5:1:5)
% coerf_hs_wl(1,2)^2
title("Wave Height vs Runup. R^2 = " + num2str(coerf_hs_wl(1,2)^2))
ylabel("Runup (m)")
xlabel("Wave Height (m)")
% mdl = fitlm(Hs,wl)
% runup vs Ho/Lo
scatter(Hs./wave_length, runup_minus_tide)
ho_div_lo_corr = corrcoef(Hs./wave_length, runup_minus_tide);
title("Wave Steepness VS runup. R^2 = " +num2str(ho_div_lo_corr(1,2).^(2)))
ylabel("Runup")
xlabel("Ho/Lo")
% runup vs Hs*Lo * ^1/2
scatter(hs_wave_length_sqr,runup_minus_tide)
coerf_hs_l_wl = corrcoef(hs_wave_length_sqr,runup_minus_tide);
title("Run up vs (Hs*Lo)^1/2. R^2 = " + num2str(coerf_hs_l_wl(1,2)^2))
ylabel("Runup (m)")
xlabel("(Hs*Lo)^1/2 (m)")
% mdl.Rsquared.Ordinary
%runup vs surf similarity 
scatter(surf_similarity, runup_minus_tide)
coerf_surf_wl = corrcoef(surf_similarity,runup_minus_tide);
title("Runup vs Surf Similarity  = " + num2str(coerf_surf_wl(1,2)^2))
ylabel("Runup (m)")
xlabel("Slope*(Hs*Lo)^1/2 (m)")
coerf_hs_wl = corrcoef(surf_similarity, wl);
% corrcoef(R_slope_data, wet_sand_line)
% corrcoef(hs_wave_length_sqr,wl)


%  same profile 2018
Tp_prof_2018 = table2array(combinedwavesatinfo2018profilenew(:,7));
Tide_prof_2018 = table2array(combinedwavesatinfo2018profilenew(:,9));
Hs_prof_2018 = table2array(combinedwavesatinfo2018profilenew(:,6));
% slope_data = table2array(mergedwaveimageslopedetailscorrected(:,"slope"));
wet_sand_line_prof_2018 = table2array(combinedwavesatinfo2018profilenew(:,"wetsand"));
water_line_prof_2018 = table2array(combinedwavesatinfo2018profilenew(:,"waterline"));
ws_prof_2018 = wet_sand_line_prof_2018;
wl_prof_2018 = water_line_prof_2018;
slope_prof_2018 = repelem(0.03291850662384604, length(wl_prof_2018));
[R_slope_data_prof_2018, setup_slope_data_prof_2018] = Runup_Stockdon(Hs, Tp, slope_prof_2018);
% stockfdon runp + tide
R2_prof_2018 = R_slope_data_prof_2018 + Tide;
% plot ws, wl and average for same and differnt profiles

plot(ws)
hold on
plot(ws_prof_2018)
legend("wet sand diff profile","wet sand same profile")
% metrics
mean(ws_prof_2018-ws)
rmse(ws_prof_2018, ws)

mean(wl_prof_2018-wl)

(mean(ws)-mean(ws_prof_2018))./mean(ws) * 100


coef = linspace(-10,10,100);

for i = 1:1:100
    [R,Setup] = Runup_Stockdon(Hs,Tp,Beta);
    corr1 = corrcoef(R+Tide,B);
    corr2 = corrcoef(Setup+Tide,B);
    R(i) = corr(1,2);
    plot(wet_sand_line,'Linewidth',3,'color','k')
    hold on
    plot(A,'r')
end

plot(R)



% %  Statistical table 
% mean error is the bias
mean_error_stockdon_runup_wl = mean(abs(water_line - R2));
normalised_bias = mean_error_stockdon_runup_wl / sum(water_line)
rmse_stockdon_runup_wl = rmse(water_line, R2);
normalized_rmse = NRMSE(B, R2);

nrmse_new_up =  sum((water_line - R2).^2)
nrmse_new_down = sum((water_line).^2)
sqrt(nrmse_new_up/nrmse_new_down)
scatter_index(water_line, R2) * 100

T = table(...
    "Metric", {'Mean Error'; 'Normalized Bias'; 'RMSE','NRMSE'},...
    "Value", [mean_error_stockdon_runup_wl; normalised_bias; rmse_stockdon_runup_wl,normalized_rmse]);

% Display the table
disp(T)

T = table(...
    "Mean Error", mean_error_stockdon_runup_wl,...
    "Normalized Bias", normalised_bias,...
    "RMSE", rmse_stockdon_runup_wl);

proxy_name = "waterline"
equation_name = "stockdon"

T1 = table(equation_name,proxy_name, ...
    mean_error_stockdon_runup_wl, ...  % First value is for 'Mean Error' column
    normalised_bias, ...              % Second value is for 'Normalized Bias' column
    rmse_stockdon_runup_wl);
T1.Properties.VariableNames = {'Equation','Proxy Name','Mean Error' 'Normalized Bias' 'RMSE'};
% Display the table
disp(T1)

T2 = table(equation_name,proxy_name, ...
    mean_error_stockdon_runup_wl, ...  % First value is for 'Mean Error' column
    normalised_bias, ...              % Second value is for 'Normalized Bias' column
    rmse_stockdon_runup_wl);
T2.Properties.VariableNames = {'Equation','Proxy Name','Mean Error' 'Normalized Bias' 'RMSE'};
% Display the table
disp(T1)


metrics_table(wl, R2)
metrics_table(ws, R2)
metrics_table(B,R2)
metrics_table(wl, Setup_stockdon)
metrics_table(ws, Setup_stockdon)
metrics_table(B,Setup_stockdon)


combined_table = vertcat(T1, T2)

runup_stockdon_metric = metrics_table(wl,ws,B,R2,"Stockdon","R2");
setup_stockdon_metric = metrics_table(wl,ws,B,Setup_stockdon,"Stockdon","Setup");
runup_holman_metric = metrics_table(wl,ws,B,R2_holman,"Holman","R2");
runup_voundous_tide_metric = metrics_table(wl,ws,B,R_with_tide_vousdou,"vousdou","R2");
runup_voundous_no_tide_metric = metrics_table(wl,ws,B,R_no_tide_vousdou,"vousdou","R2");

concat_all_metrics = vertcat(runup_stockdon_metric,setup_stockdon_metric,runup_holman_metric,runup_voundous_tide_metric,runup_voundous_no_tide_metric)

writetable(concat_all_metrics, "proxy_metrics.xlsx")



