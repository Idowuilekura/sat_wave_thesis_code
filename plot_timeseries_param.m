function [] = plot_timeseries_param(image_date, value_to_plot, ylabel,file_name, directory,plot_color)
    [dates, sortIdx] = sort(datenum(image_date));
    date_value = image_date(sortIdx);
    values = value_to_plot(sortIdx);
    plot(values, "Color", plot_color);
    x_tick = (1:1:length(values));
    xticks(x_tick);
    xticklabels(datestr(date_value));
    % chosen_xticks = 1:10:length(date_value);
    num_ticks = 8;
    chosen_xticks = round(linspace(1, length(date_value), num_ticks));
    % Ensure the first and last dates are included
    chosen_xticks(1) = 1;
    chosen_xticks(end) = length(date_value);
    box off
    ax = gca;
    currentTicks = ax.XTick;
    currentLabels = ax.XTickLabel;
    ax.XTick = chosen_xticks;
    ax.XTickLabel = currentLabels(chosen_xticks);
    ax.XLabel.String = "Acquired Image Date";
    % ax.XLabel.FontWeight = 'bold';
    % ax.YLabel.FontWeight = 'bold';
    ax.XLabel.FontSize = 16;
    ax.YLabel.FontSize = 16;
    ax.YLabel.String = ylabel;
    saveas(gcf, fullfile(directory,file_name + ".png"));
