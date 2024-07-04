function [] = plot_wave_tide_param_func(image_date_index, subset_index_values, image_grand_position,param_of_interest_sorted,wave_tide_param_time_sorted,plot_color, ylabel, xlabel)
    % this function is fo plotting wave, tide params 
    % image_date_index is the index of image date from the whole wave
    % param_of_interest_sorted is the sorted param of interest
    % plot_color is the color of the plot
    param_of_interest_sorted_subset = param_of_interest_sorted(subset_index_values);
    wave_tide_param_time_sorted_subset = wave_tide_param_time_sorted(subset_index_values);
    xticks_ = 1:1:length(param_of_interest_sorted_subset);
    plot(param_of_interest_sorted_subset, 'DisplayName' ,'','Color',plot_color,LineWidth=0.9)
    hold on
    for i = 1:length(image_date_index)
        y_lim_each = param_of_interest_sorted(image_date_index(i));
        x_position = image_grand_position(i);
        green_line = plot([x_position,x_position],[0,y_lim_each],'--g','DisplayName','Acquired Image Dates');
        hold on
    end
    hold off
    % ylabel(ylabel,"FontSize",12)
    xticks(xticks_);
    xticklabels(datestr(wave_tide_param_time_sorted_subset));
    num_ticks = 8;
    chosen_xticks = round(linspace(1, length(wave_tide_param_time_sorted_subset), num_ticks));
    % Ensure the first and last dates are included
    chosen_xticks(1) = 1;
    chosen_xticks(end) = length(wave_tide_param_time_sorted_subset);
    box off
    ax = gca;
    currentTicks = ax.XTick;
    currentLabels = ax.XTickLabel;
    ax.XTick = chosen_xticks;
    ax.XTickLabel = currentLabels(chosen_xticks);
    ax.XLabel.FontSize = 20;
    ax.YLabel.FontSize = 20;
    ax.XLabel.String = "Date";
    ax.YLabel.String = ylabel;
    % ax.XLabel.String = xlabel;
    ax.FontSize = 14;
    legend(green_line)

end