function [] = func_runup_equation_proxy_compare(runup_equation_r2_vector, proxy_of_interest, equation_name_vector, date_value, proxy_interest_name,xlabel_)
tiledlayout(2,3,"TileSpacing","loose","Padding","loose")
[dates, sortIdx] = sort(date_value);
date_value = date_value(sortIdx);
for i = 1:size(runup_equation_r2_vector,2)
    runup_equation_interest = runup_equation_r2_vector(:,i);
    sort_runup_equation_interest = runup_equation_interest(sortIdx);
    sort_proxy_of_interest = proxy_of_interest(sortIdx);
    min_val = 0;
    max_val = 6;
    equation_name = equation_name_vector(i);
    nexttile
    plot(sort_runup_equation_interest, 'Linewidth', 3, 'Color', 'k')
    hold on
    plot(sort_proxy_of_interest, 'Linewidth', 3, 'Color', 'g')
    title(equation_name)
    ylim([min_val max_val]);
    legend("Predicted R2", proxy_interest_name, "Orientation", "horizontal","fontsize", 16, "Location", "best")
    ax = gca;
    % ax.FontSize = 12;
    x_tick = (1:1:length(sort_proxy_of_interest));
    xticks(x_tick);
    xticklabels(datestr(date_value));
    num_ticks = 6;
    chosen_xticks = round(linspace(1, length(date_value), num_ticks));
    % Ensure the first and last dates are included
    chosen_xticks(1) = 1;
    chosen_xticks(end) = length(date_value);
    ax = gca;
    currentTicks = ax.XTick;
    currentLabels = ax.XTickLabel;
    ax.XTick = chosen_xticks;
    ax.XTickLabel = currentLabels(chosen_xticks);
    ax.XLabel.String = "Acquired Image Date";
    ax.FontSize = 14;
    ax.XLabel.FontSize = 16;
    ax.YLabel.FontSize = 16;
    ax.YLabel.String = "Elevation (m)";
    
    
end
for i = 1:size(runup_equation_r2_vector,2)
    runup_equation_interest = runup_equation_r2_vector(:,i);
    equation_name = equation_name_vector(i);
    sort_runup_equation_interest = runup_equation_interest(sortIdx);
    sort_proxy_of_interest = proxy_of_interest(sortIdx);
    nexttile
    % min_val = min(min(sort_runup_equation_interest),min(sort_proxy_of_interest));
    % max_val = max(max(sort_runup_equation_interest),max(sort_proxy_of_interest));
    min_val = 0;
    max_val = 7;
    % disp(max_val)
    scatter(sort_proxy_of_interest,sort_runup_equation_interest, 'Linewidth', 1.5, 'Color', 'k')
    hold on
    plot([min_val max_val], [min_val max_val], 'Linewidth', 1.5, 'Color', 'r', 'LineStyle', '--')
    xlim([min_val max_val]);
    ylim([min_val max_val]);
    % ylim([min_val max_val])
    ylabel("Predicted R2")
    xlabel(xlabel_)
    title(equation_name)
    ax = gca;
    ax.FontSize = 14;
    % ax.FontSize = 12;
    box on;
    ax.XLabel.FontSize = 18;
    ax.YLabel.FontSize = 18;
    % ax.YLabel.String = "Elevation (m)";
    
end
end


% x_tick = (1:1:length(first_param_interest_diff_profile));
% xticks(x_tick);
% xticklabels(datestr(date_value_sorted));
% % chosen_xticks = 1:10:length(date_value);
% num_ticks = 8;
% chosen_xticks = round(linspace(1, length(date_value), num_ticks));
% % Ensure the first and last dates are included
% chosen_xticks(1) = 1;
% chosen_xticks(end) = length(date_value);
% box off
% ax = gca;
% currentTicks = ax.XTick;
% currentLabels = ax.XTickLabel;
% ax.XTick = chosen_xticks;
% ax.XTickLabel = currentLabels(chosen_xticks);
% ax.XLabel.String = "Acquired Image Date";
% % ax.XLabel.FontWeight = 'bold';
% % ax.YLabel.FontWeight = 'bold';
% ax.XLabel.FontSize = 18;
% ax.YLabel.FontSize = 18;
% ax.YLabel.String = "Elevation (m)";
% ax.FontSize = 16;