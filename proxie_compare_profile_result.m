directory = 'C:\Users\HP\Desktop\thesis_work\costacaprica_all\result_plots';
Tp = table2array(mergedwaveimageslopedetailscorrected(:,7));
Tide = table2array(mergedwaveimageslopedetailscorrected(:,9));
Tide_norm = Tide -2;
Hs = table2array(mergedwaveimageslopedetailscorrected(:,6));
slope_data = table2array(mergedwaveimageslopedetailscorrected(:,"slope"));
wave_length = compute_wave_length(Tp);
Beta = slope_data;
wet_sand_line_diff_profile = table2array(mergedwaveimageslopedetailscorrected(:,"wetsand"));
water_line_diff_profile = table2array(mergedwaveimageslopedetailscorrected(:,"waterline"));
wet_sand_line_2018_profile = table2array(combinedwavesatinfo2018profilenew(:,"wetsand"));
water_line_2018_profile = table2array(combinedwavesatinfo2018profilenew(:,"waterline"));
date_value = table2array(mergedwaveimageslopedetailscorrected(:,"matlab_julian_date"));
% ws = wet_sand_line;
% wl = water_line;

close all;
plot(wet_sand_line_diff_profile, 'Color','b', LineWidth=0.9)
hold on
plot(wet_sand_line_2018_profile,'Color','g',LineWidth=0.9)
lgd = legend("Different Profile","Same Profile");
fontsize(lgd,14, "points")
ylabel("Elevation","FontSize",16)
xlabel("Acquired Image Date")
close all;
subplot(2,2,1)
func_compare_proxy_profile_effect(wet_sand_line_diff_profile,wet_sand_line_2018_profile,'b','g',date_value)
subplot(2,2,2)
h3=histogram(wet_sand_line_2018_profile, 15, 'FaceColor', 'b', 'EdgeColor', 'w');
hold on
h4=histogram(wet_sand_line_diff_profile, 15, 'FaceColor', 'r', 'EdgeColor', 'w');
% legend([h1, h2], 'Same Profile', 'Different Profile')
hold off
lgd = legend([h3,h4],'Same Profile ', 'Different Profile');
fontsize(lgd,14, "points")
ylabel("Counts")
xlabel("Elevation (m)")
ax = gca;
ax.FontSize = 16;
subplot(2,2,3)
func_compare_proxy_profile_effect(water_line_diff_profile,water_line_2018_profile,'b','g',date_value)
subplot(2,2,4)
h3=histogram(water_line_2018_profile, 15, 'FaceColor', 'b', 'EdgeColor', 'w');
hold on
h4=histogram(water_line_diff_profile, 15, 'FaceColor', 'r', 'EdgeColor', 'w');
% legend([h1, h2], 'Same Profile', 'Different Profile')
hold off
lgd = legend([h3,h4],'Same Profile ', 'Different Profile');
fontsize(lgd,14, "points")
ylabel("Counts")
xlabel("Elevation (m)")
ax = gca;
ax.FontSize = 16;
file_name = "proxy_compare_profile_effect"
set(gcf, 'Position', [1 1 1536 788.8000]);
saveas(gcf, fullfile(directory,file_name + ".png"));


calculate_water_stats(water_line_2018_profile, water_line_diff_profile)

calculate_water_stats(wet_sand_line_2018_profile, wet_sand_line_diff_profile)

[mean_error_wet_sand, rmse_wet_sand]=func_compute_stats_proxy_compare(wet_sand_line_diff_profile, wet_sand_line_2018_profile, date_value)

[mean_error_water_line, rmse_water_line]=func_compute_stats_proxy_compare(water_line_diff_profile, water_line_2018_profile, date_value)


length(date_value)

date_, sortIdx = sort(date_value);
[B,I] = sort(A)