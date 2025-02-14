directory = 'C:\Users\HP\Desktop\thesis_work\costacaprica_all\result_plots';
wave_direction = get_parameters(mergedwaveimageslopedetailscorrected, "DIR");
wave_height_image = get_parameters(mergedwaveimageslopedetailscorrected, "HS");
tide_data_image = get_parameters(mergedwaveimageslopedetailscorrected, "Tide");
tide_data_image = tide_data_image -2;

waterline_diff_profile = get_parameters(mergedwaveimageslopedetailscorrected,"waterline");

wave_period_image  = get_parameters(mergedwaveimageslopedetailscorrected, "TP");
image_date = get_parameters(mergedwaveimageslopedetailscorrected,"date");
date_julian = get_parameters(mergedwaveimageslopedetailscorrected,"matlab_julian_date");
[dates_julian_image, sortIdx_julian_image] = sort(date_julian);
wave_height_image_sorted = wave_height_image(sortIdx_julian_image);
dates_julian_image_sorted = date_julian(sortIdx_julian_image);

wave_height = HS;
peak_period = TP;
wave_direction = DIR;
wave_tide_param_time = TIME;


[sorted_hs_tp_dir] = sort_wave_tide_data([HS; TP; DIR], wave_tide_param_time);

HS_sorted = sorted_hs_tp_dir(:,1);
TP_sorted = sorted_hs_tp_dir(:,2); 
Dir_sorted = sorted_hs_tp_dir(:,3);
wave_tide_param_time_sorted = sorted_hs_tp_dir(:,4);


max_image_date = max(date_julian);
min_image_date = min(date_julian);

max_image_date_add = max_image_date + 20;
min_image_date_add = min_image_date - 20;

subset_time_values = min_image_date_add:1:max_image_date_add;
subset_time_values = reshape(subset_time_values,[length(subset_time_values),1]);

subset_index_values = [];
for i=1:length(wave_tide_param_time_sorted)
    for j=1:length(subset_time_values)
        if wave_tide_param_time_sorted(i) == subset_time_values(j)
            subset_index_values(j) = i;
        end
    end
end

datevec(wave_tide_param_time_sorted(subset_index_values))

hs_subset_sorted = HS_sorted(subset_index_values);
% image date index is the index of satellite image time from the 
% whole wave, tide data
image_date_index = [];
image_grand_position = [];
for i=1:length(subset_index_values)
    for j=1:length(dates_julian_image_sorted)
        if wave_tide_param_time_sorted(subset_index_values(i)) == dates_julian_image_sorted(j)
            image_date_index(j) = subset_index_values(i);
            image_grand_position(j) = i;
        end
    end
end

find(hs_subset_sorted == 2.9500)






% date_image_subset = wave_tide_param_time_sorted(subset_index_values);
% max_wave_height_image = max(wave_height_image)
% find(HS_sorted == 4.69)

close all
subplot(3,1,1)
plot(HS_sorted(subset_index_values))
hold on 
plot([1,1],[0,4.61],'--')

subplot(3,1,2)
plot(TP_sorted(subset_index_values))
subplot(3,1,3)
plot(Dir_sorted(subset_index_values))

close all;
ylabel= "Wave Height (m)";
hs_sorted_test = HS_sorted(subset_index_values);
xticks_ = 1:1:length(hs_sorted_test);
plot(HS_sorted(subset_index_values), 'DisplayName' ,'',LineWidth=0.8)
hold on
for i = 1:length(image_date_index)
    h_lim = HS_sorted(image_date_index(i));
    x_position = image_grand_position(i);
    green_line = plot([x_position,x_position],[0,h_lim],'--g', 'DisplayName','Acquired Images')
    hold on
end
xticks(xticks_);
xticklabels(datestr(wave_tide_param_time_sorted(subset_index_values)));
num_ticks = 8;
chosen_xticks = round(linspace(1, length(wave_tide_param_time_sorted(subset_index_values)), num_ticks));
% Ensure the first and last dates are included
chosen_xticks(1) = 1;
chosen_xticks(end) = length(wave_tide_param_time_sorted(subset_index_values));
box off
ax = gca;
currentTicks = ax.XTick;
currentLabels = ax.XTickLabel;
ax.XTick = chosen_xticks;
ax.XTickLabel = currentLabels(chosen_xticks);
ax.XLabel.FontSize = 20;
ax.YLabel.FontSize = 20;
ax.XLabel.String = "Acquired Image Date";
ax.YLabel.String = ylabel;
ax.FontSize = 14;
legend(green_line)

0:1:length(HS_sorted(subset_index_values))

close all;
subplot(3,1,1)
plot_wave_tide_param_func(image_date_index, subset_index_values,image_grand_position,HS_sorted, wave_tide_param_time_sorted,'b',"Wave Height (m)","Acquired Image Date")
subplot(3,1,2)
plot_wave_tide_param_func(image_date_index, subset_index_values,image_grand_position,TP_sorted, wave_tide_param_time_sorted,'b',"Wave Period (s)","Acquired Image Date")    
subplot(3,1,3)
plot_wave_tide_param_func(image_date_index, subset_index_values,image_grand_position,Dir_sorted, wave_tide_param_time_sorted,'b',"Wave Direction (degree)","Acquired Image Date")
file_name = "wave_param_tide_timeseries";
set(gcf, 'Position', [1 1 1536 788.8000]);
saveas(gcf, fullfile(directory,file_name + ".png"));

