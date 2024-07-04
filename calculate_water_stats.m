function [stats] = calculate_water_stats(water_line_2018_profile, water_line_diff_profile)
    % Calculate statistics for water_line_2018_profile
    mean_2018 = mean(water_line_2018_profile, 'omitnan');
    max_2018 = max(water_line_2018_profile, [], 'omitnan');
    min_2018 = min(water_line_2018_profile, [], 'omitnan');
    std_2018 = std(water_line_2018_profile, 'omitnan');
    median_2018 = median(water_line_2018_profile, 'omitnan');

    % Calculate statistics for water_line_diff_profile
    mean_diff = mean(water_line_diff_profile, 'omitnan');
    max_diff = max(water_line_diff_profile, [], 'omitnan');
    min_diff = min(water_line_diff_profile, [], 'omitnan');
    std_diff = std(water_line_diff_profile, 'omitnan');
    median_diff = median(water_line_diff_profile, 'omitnan');

    % Combine the results into a table
    stats = table([mean_2018; max_2018; min_2018; std_2018;median_2018], ...
                  [mean_diff; max_diff; min_diff; std_diff; mean_diff], ...
                  'VariableNames', {'Waterline_same', 'Waterline_Diff'}, ...
                  'RowNames', {'Mean', 'Max', 'Min', 'StdDev','Median'});
end