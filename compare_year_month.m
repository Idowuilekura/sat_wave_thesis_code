function [same_year_month_index] = compare_year_month(year_month, string_compare)
    for i = 1:length(year_month)
        compare_str = strcmp(year_month(i),string_compare);
        same_year_month_index(i) = compare_str;
    end
