mergedwaveimageslopedetailscorrected{:,1}
directory = 'C:\Users\HP\Desktop\thesis_work\costacaprica_all\result_plots';
wet_sand_sat_array = mergedwaveimageslopedetailscorrected{:,12};
water_line_sat_array = mergedwaveimageslopedetailscorrected{:,13};
year_month_day = mergedwaveimageslopedetailscorrected{:,2};

% first_day = day(1)
% first_day(1)
% spl_str = strsplit(first_day,'-')
% spl_str(1)
% strcat(spl_str(1),'-',spl_str(2),'-',spl_str(3))
% year_month_only_array = zeros(length(year_month_day),1);
for i=1:length(year_month_day)
    year_month_only_val = get_year_month_only(year_month_day(i));
    disp(year_month_only_val)
    year_month_only_array(i) = year_month_only_val;
end
find(year_month_only_array == '2021-05')
compare_year_month(year_month_only_array,'2021-05')

strcmp(year_month_only_val(1),'2021-05')
base_dir = 'C:\\Users\\HP\\Desktop\\thesis_work\\costacaprica_all\\costa_caparica_profile_data\\';
strcat(base_dir,'profile_2018_12_27.shp')
[distance_computed_1_2018_dec, elevation_1_2018_dec] = read_data_compute_distance('C:\\Users\\HP\\Desktop\\thesis_work\\costacaprica_all\\costa_caparica_profile_data\\profile_2018_12_27.shp');
[distance_computed_1_2019_dec, elevation_1_2019_dec] = read_data_compute_distance(strcat(base_dir,'profile_2029_12_30.shp'));
[distance_computed_2_2021_jan, elevation_2_2021_jan] = read_data_compute_distance(strcat(base_dir,'profile_2021_01_07.shp'));
[distance_computed_3_2021_may, elevation_3_2021_may] = read_data_compute_distance(strcat(base_dir,'profile_2021_05_06.shp'));
% plot(distance_computed, elevation)

figure(1)
plot(distance_computed_1_2018_dec, elevation_1_2018_dec, 'g', "LineWidth",3)
hold on
plot(distance_computed_1_2019_dec, elevation_1_2019_dec, 'r',"LineWidth",3)
hold on
plot(distance_computed_2_2021_jan, elevation_2_2021_jan , 'b',"LineWidth",3)
hold on
plot(distance_computed_3_2021_may, elevation_3_2021_may, 'k', "LineWidth",3)
lgd=legend('profile-2018-dec','profile-2019-dec','profile-2021-jan','profile-2021-may')
fontsize(lgd,20, "points")
xlim([0,150])
ylim([0,11])
% yline(2.5,'--');
% title('Profiles for each year at Coasta Caparica')
ylabel('Elevation (m)')
xlabel('Distance (m)')
ax = gca;
ax.XLabel.FontSize = 20;
ax.YLabel.FontSize = 20;
ax.FontSize = 18;
ylim([1,10.5])
saveas(gcf,fullfile(directory,"profile_plot_extracted.png"))

% get_year_month_only(first_day)

% planet source
source = mergedwaveimageslopedetailscorrected(:,"source");


G1 = groupcounts(mergedwaveimageslopedetailscorrected,"source")

plot(distance_computed_1_2018_dec, elevation_1_2018_dec, 'g')
ylabel('Profile Elevation (m)')
xlabel('Distance (m)')
yline(-9.92,'--')
xline(3082.61,'--')