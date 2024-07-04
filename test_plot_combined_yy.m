function [] = test_plot_combined_yy(first_param, second_param, third_param, date_value, legend_entries_vector,color_vector ,ylabel_yy)
    % [dates, sortIdx] = sort(date_value);
    % Sort the data
    [dates, sortIdx] = sort(date_value);
    x_ticks = 1:length(first_param);
    first_param = first_param(sortIdx);
    second_param = second_param(sortIdx);
    third_param = third_param(sortIdx);
    date_value = date_value(sortIdx);

    % Create the plot with two y-axes

    % Plot the first parameter on the left y-axis
    yyaxis left;
    hLine1 = plot(x_ticks, first_param, 'LineWidth', 2, 'Color',color_vector(1),'Linestyle' ,'-', 'DisplayName', legend_entries_vector{1});
    hold on;
    hLine2 = plot(x_ticks, second_param, 'LineWidth', 2, 'Color', color_vector(2),'Linestyle' ,'-', 'DisplayName', legend_entries_vector{2});
    ylabel('Elevation (m)');

    y_lim_left_max  = 0;
    if max(first_param) > y_lim_left_max
        y_lim_left_max = max(first_param);
    else 
        y_lim_left_max = max(second_param);
    end
    y_lim_left_min = 0;
    if min(first_param) < y_lim_left_min
        y_lim_left_min = min(first_param);
    else
        y_lim_left_min = min(second_param);
    end
    y_lim_left = [y_lim_left_min, y_lim_left_max * 1.2];
    ylim(y_lim_left);

    ax = gca;
    ax.YColor = 'k';

    % Plot the third parameter on the right y-axis
    yyaxis right;
    hLine3 = plot(x_ticks, third_param, 'LineWidth', 2, 'Color', color_vector(3), 'Linestyle' ,'-','DisplayName', legend_entries_vector{3});
    ylabel(ylabel_yy);

    y_lim_right_max  = 0;
    y_lim_right_max = max(third_param) * 1.2;
    y_lim_right_min = min(third_param);
    y_lim_right = [y_lim_right_min, y_lim_right_max];
    ylim(y_lim_right);

    

    % Set x-ticks and labels
    xticks(x_ticks);
    xticklabels(datestr(date_value));

    % Select x-ticks to display
    num_ticks = 8;
    chosen_xticks = round(linspace(1, length(date_value), num_ticks));
    chosen_xticks(1) = 1; % Ensure the first date is included
    chosen_xticks(end) = length(date_value); % Ensure the last date is included
    set(gca, 'XTick', chosen_xticks);

    % Get current tick labels and apply them to chosen ticks
    currentLabels = datestr(date_value(chosen_xticks));
    set(gca, 'XTickLabel', currentLabels);

    % Set font sizes for axes
    ax = gca;
    ax.XLabel.FontSize = 20;
    ax.XLabel.String = 'Acquired Image Date';
    ax.YLabel.FontSize = 20;
    ax.FontSize = 16; % Adjust font size for the axes

    % Create legend
    legend('Location', 'best', 'FontSize', 16, 'Orientation', 'horizontal');

    % Optionally adjust other properties
    box off;

        