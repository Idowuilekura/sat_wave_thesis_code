directory = 'C:\Users\HP\Desktop\thesis_work\costacaprica_all\result_plots';
wave_direction = get_parameters(mergedwaveimageslopedetailscorrected, "DIR");
wave_height = get_parameters(mergedwaveimageslopedetailscorrected, "HS");
tide_data = get_parameters(mergedwaveimageslopedetailscorrected, "Tide");
tide_data = tide_data -2;
wet_sand_diff_profile = get_parameters(mergedwaveimageslopedetailscorrected, "wetsand");
waterline_diff_profile = get_parameters(mergedwaveimageslopedetailscorrected,"waterline");
average_wet_water_diff_profile = mean([wet_sand_diff_profile, waterline_diff_profile],2);
wave_period = get_parameters(mergedwaveimageslopedetailscorrected, "TP");
image_date = get_parameters(mergedwaveimageslopedetailscorrected,"date");
date_julian = get_parameters(mergedwaveimageslopedetailscorrected,"matlab_julian_date");
% rose(double(wave_direction),24)
wet_sand_2018_profile = get_parameters(combinedwavesatinfo2018profilenew,"wetsand");
waterline_2018_profile = get_parameters(combinedwavesatinfo2018profilenew, "waterline");
x_ticks = 1:length(waterline_2018_profile);

matrix_values = [wet_sand_diff_profile,water_line_diff_profile, wave_height];
matrix_values_name = ["Wetsand","Waterline","HS",];
figure(2)
subplot(2,2,1)
test_plot_combined(date_julian,matrix_values,matrix_values_name,"Elevation(m)","wave_height_water_wet_new", directory, ["b","g","r"] )
subplot(2,2,2)
test_plot_combined(date_julian,matrix_values,matrix_values_name,"Elevation(m)","wave_height_water_wet_new", directory, ["b","g","r"] )
tightfig;

figure(1)
tiledlayout(2,2, 'TileSpacing','compact', 'Padding','compact');
nexttile
test_plot_combined(date_julian,matrix_values,matrix_values_name,"Elevation(m)","wave_height_water_wet_new", directory, ["b","g","r"] )
nexttile
test_plot_combined_yy(wet_sand_line_diff_profile,waterline_diff_profile,wave_period,date_julian,["Wetsand","Waterline","TP",],["b","g","k"],"TP")
nexttile
test_plot_combined_yy(wet_sand_line_diff_profile,waterline_diff_profile,tide_data,date_julian,["Wetsand","Waterline","Tide",],["b","g","#D95319"],"Tide (m)")
nexttile
test_plot_combined_yy(wet_sand_line_diff_profile,waterline_diff_profile,wave_direction,date_julian,["Wetsand","Waterline","Dir",],["b","g","m"],"DIR")
set(gcf, "Position",[1921 -215 1920 1.0048e+03])
file_name = "wet_dry_hs_tp_tide_compare"
saveas(gcf, fullfile(directory,file_name + ".png"));

plotyy(x_ticks, wave_height, x_ticks, wave_period)
legend('wave_height', 'wave_period')


