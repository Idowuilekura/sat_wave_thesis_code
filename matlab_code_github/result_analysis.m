% wave information plot 
% wave_direction = mergedwaveimageslopedetailscorrected(:,"DIR");
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
average_wet_water_2018_profile = mean([wet_sand_2018_profile, waterline_2018_profile], 2);

%wave parameters
wave_height = HS;
peak_period = TP;










Rose_Plot(wave_direction)

% Sample data: angles in radians
theta = rand(1, 100) * 2 * pi;

% Create the polar histogram (rose plot)
figure;
polarhistogram(wave_direction, 10);
saveas(gcf,fullfile(directory,'polar_chart_wave_dir.png'));
hist(wave_height,10)
saveas(gcf,fullfile(directory,'hist_wave_height.png'));
hist(wave_period,10)
saveas(gcf,fullfile(directory,'hist_wave_period.png'));
hist(tide_data,10)
saveas(gcf, fullfile(directory,'hist_tide_data.png'));
subplot(1,5,4)
boxplot(wet_sand)
subplot(1,5,5)
boxplot(waterline)

% 20 bins

% Add title
title('Polar Histogram (Rose Plot) Example');
subplot(1,3,1)
boxplot(wet_sand)
subplot(1,3,2)
boxplot(waterline)

plot(wet_sand)
datetick


[dates, sortIdx] = sort(datenum(image_date));
values = wet_sand(sortIdx);

plot(datenum(dates), values)
datetick('x','yyyy-mm-dd')
datetime(image_date)

disp(['Length of dates: ', num2str(length(dates))])
disp(['Length of values: ', num2str(length(values))])

disp(class(dates))

plot(1:length(values), values)

plot(waterline)

validIdx = ~isnan(values);
date = datenum(image_date)

% Use valid data for plotting
plot(date(validIdx), values(validIdx))
datetick('x', 'yyyy-mm-dd')


newDates = min(date):1:max(date)
value_interp = interp1(date, values, newDates, 'linear', 'extrap');

plot(newDates, value_interp)

plot(values)
xticks(date)
plot(waterline)
xticklabels(datestr(image_date))

% datetick('x', 'yyyy-mm-dd')
num_ticks = 10;

% Generate tick positions
chosen_xticks = round(linspace(1, length(date_values), num_ticks));

% Ensure the first and last dates are included
chosen_xticks(1) = 1;
chosen_xticks(end) = length(date_values);

% Display the chosen tick positions
disp(chosen_xticks)

num_ticks = 8;
sort(datenum(image_date),'descend')
[dates, sortIdx] = sort(datenum(image_date));
date_value = image_date(sortIdx);
values = wet_sand(sortIdx);
plot(values);
x_tick = (1:1:length(values));
xticks(x_tick)
xticklabels(datestr(date_value));
% chosen_xticks = 1:10:length(date_value);
chosen_xticks = round(linspace(1, length(date_value), num_ticks));
% Ensure the first and last dates are included
chosen_xticks(1) = 1;
chosen_xticks(end) = length(date_value);
box off
ax = gca;
currentTicks = ax.XTick;
currentLabels = ax.XTickLabel;
ax.XTick = chosen_xticks
ax.XTickLabel = currentLabels(chosen_xticks)
ax.XLabel.String = "Acquired Image Date";
ax.YLabel.String = "Waterline Elevation (m)";
saveas(gcf, fullfile(directory,'time_series_waterline.png'));

plot_timeseries_param(image_date, wet_sand, "Wet-sand Elevation (m)","time_series_wetsand",directory, "b")
plot_timeseries_param(image_date, waterline, "Waterline Elevation (m)","time_series_waterline_new",directory, "g")

vector_test = [ wet_sand, waterline, tide_data, wave_height, wave_period];
vector_test_waterline = [ waterline, tide_data, wave_height];
vector_wetsand_waterline = [ wet_sand, waterline];
color_vector = ['b','g','m','k','g'];
close all;
plot_timeseries_combined(image_date, vector_test_wetsand, "Elevation (m)","time_series_combined_new",directory, color_vector)

test_plot_combined(image_date, vector_test,["wet-sand","waterline", "Tide", "Wave Height"], "Elevation (m)","time_series_combined_new",directory, color_vector)
test_plot_combined(image_date, [wet_sand, waterline],["wet-sand","waterline"], "Elevation (m)","time_series_wet_water_combine_new",directory, color_vector)
test_plot_combined(image_date, [wet_sand, waterline, wave_height],["wet-sand","waterline","waveheight"], "Elevation (m)","time_series_wet_water_wave_height_combine",directory, color_vector)
test_plot_combined(image_date, [wet_sand, waterline, tide_data],["wet-sand","waterline","Tide"], "Elevation (m)","time_series_wet_water_tide_combine",directory, color_vector)
close all;
for i = 1:size(vector_test,2)
        values_to_plot = vector_test(:,i);
        % values = value_to_plot(sortIdx);
        plot(values_to_plot, "Color", 'm');
        hold on 
end
x_plot = (1:1:length(vector_test(:,1)));
plotyy(x_plot,vector_test(:,1), x_plot,vector_test(:,5))
plot(image_date, vector_test(:,1))
ylim[0,20]

plot(wave_period)

color_vector(2)

for i=1:5
    vector_test(:,i)
end





%% profile methodology 
plot(wet_sand_diff_profile)
hold on
plot(wet_sand_2018_profile)
legend("wet sand diff profile","wet sand same profile (2018 profile)")

wave_period



mean(abs(wet_sand_2018_profile - wet_sand_diff_profile))
















plot(values);
738279 > 737451

numericDates = datenum(image_date);
numericDates = numericDates(sortIdx);
startDate = min(numericDates);
endDate = max(numericDates);
numTicks = 6; % Adjust this number as needed
tickDates = linspace(startDate, endDate, numTicks);
box off;
ax = gca;
ax.XTick = tickDates;
dateFormat = 'dd-mmm-yyyy'; % Adjust format as needed
ax.XTickLabel = datestr(tickDates, dateFormat);
xtickangle(45);

% Adjust figure size if needed
set(gcf, 'Position', [100, 100, 1200, 600]);

% Refresh the plot
drawnow;











% Sort the data
