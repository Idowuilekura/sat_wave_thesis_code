function [] = test_plot_combined(image_date, matrix_values, matrix_values_name, ylabel,file_name, directory,plot_color_vector)
    [dates, sortIdx] = sort(image_date);
    % close all;
    date_value = image_date(sortIdx);
    % values = value_to_plot(sortIdx);
    plot_label_vector = [];
    vector_combined = [];
    legend_entries = cell(1, size(matrix_values,2));
    for i = 1:size(matrix_values,2)
        value_to_plot = matrix_values(:,i);
        legend_entries{i} = matrix_values_name(i);
        values = value_to_plot(sortIdx);
        vector_combined = [vector_combined, values];
        plot_label = plot(values, plot_color_vector(i), "LineWidth", 2);
        plot_label_vector = [plot_label_vector, plot_label];
        hold on
    end
    hold off;
    % h1 = plot(vector_combined(:,1), "Color", plot_color_vector(1));
    % hold on
    % h2 = plot(vector_combined(:,2),"Color", plot_color_vector(2));
    % hold on;
    % h3 = plot(vector_combined(:,3),"Color", plot_color_vector(3));
    % hold off
    % h4 = plot(vector_combined(:,4),"Color" , plot_color_vector(4));
    % hold off
    % legend(h1, "Wetsand");
    % legend(h2, "Waterline");
    % legend(h3, "Tide");
    % legend(h4, "Wave Height");
    leg = legend(plot_label_vector,legend_entries);
    % leg = legend([h1(1),h2(1), h3(1)],"Wetsand", "Waterline", "Tide", "Wave Height");
    set(leg, 'FontSize', 18, 'Location', 'best', 'Orientation', 'horizontal');
    % legend(plot_label_vector,{"Wetsand", "Waterline", "Tide", "Wave Height"});
   
    x_tick = (1:1:length(matrix_values(:,1)));
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
    % ax.XTickLabelFontSize = 16;
    % ax.XLabel.FontWeight = 'bold';
    % ax.YLabel.FontWeight = 'bold';
    ax.XLabel.FontSize = 20;
    ax.YLabel.FontSize = 20;
    ax.XLabel.String = "Acquired Image Date";
    ax.YLabel.String = ylabel;
    ax.FontSize = 16;
    % ax.TickLabel.FontSize = 16;
    % set(gca, 'XTickLabel', get(gca, 'XTickLabel'), 'fontsize', 16);
    % max_value = 0;
    % for i = 1:size(matrix_values,2)
    %     value_to_plot = matrix_values(:,i);
    %     % values = value_to_plot(sortIdx);
    %     max_value_i = max(value_to_plot);
    %     if max_value_i > max_value
    %         max_value = max_value_i;
    %     end
    %     % plot(values, "Color", plot_color_vector(i));
    %     % hold on 
    % end

    % min_value = 0;
    % for i = 1:size(matrix_values,2)
    %     value_to_plot = matrix_values(:,i);
    %     values = value_to_plot(sortIdx);
    %     min_value_i = min(values);
    %     if min_value_i < min_value
    %         min_value = min(values);
    %     end
    %     % plot(values, "Color", plot_color_vector(i));
    %     % hold on 
    % end

    % ax.YLim = [0 max_value];

    % ax.Position = [0.1 0.1 0.7 0.8];
    % set(gcf, 'Position', [388.2000 106.6000 969.6000 547.2000]);
    set(gca, 'XTickLabelRotation', 45);
    % set(gca, 'XTickLabel', get(gca, 'XTickLabel'), 'fontsize', 14);
    % saveas(gcf, fullfile(directory,file_name + ".png"));

end