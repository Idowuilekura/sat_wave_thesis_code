function [] = func_compare_proxy_profile_effect(first_param_interest_diff_profile, second_param_interest_diff_profile, first_param_color, second_param_color, date_value)
    [dates, sortIdx] = sort(date_value);
    date_value_sorted = date_value(sortIdx);
    first_param_interest_diff_profile_sorted = first_param_interest_diff_profile(sortIdx);
    second_param_interest_diff_profile_sorted = second_param_interest_diff_profile(sortIdx);
    plot(first_param_interest_diff_profile_sorted,'Color',first_param_color,LineWidth=0.9)
    hold on
    plot(second_param_interest_diff_profile_sorted,'Color',second_param_color,LineWidth=0.9)
    lgd = legend("Different Profile","Same Profile", "Location","best");
    fontsize(lgd,14, "points")
    % ylabel("Elevation","FontSize",16)
    % xlabel("Acquired Image Date")
    hold off
    x_tick = (1:1:length(first_param_interest_diff_profile));
    xticks(x_tick);
    xticklabels(datestr(date_value_sorted));
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
    ax.XLabel.FontSize = 18;
    ax.YLabel.FontSize = 18;
    ax.YLabel.String = "Elevation (m)";
    ax.FontSize = 16;
    % ax.BBox = 'off';
    max_value_ylim = 0;
    if max(first_param_interest_diff_profile_sorted) > max(second_param_interest_diff_profile_sorted)
        max_value_ylim = max(first_param_interest_diff_profile_sorted);
    else
        max_value_ylim = max(second_param_interest_diff_profile_sorted);
    end
    min_value_ylim = 0;
    if min(first_param_interest_diff_profile_sorted) < min(second_param_interest_diff_profile_sorted)
        min_value_ylim = min(first_param_interest_diff_profile_sorted);
    else    
        min_value_ylim = min(second_param_interest_diff_profile_sorted);
    end
    ax.YLim = [min_value_ylim max_value_ylim+2];
