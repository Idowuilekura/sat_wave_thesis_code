function [year_month_only] = get_year_month_only(date_string)
    spl_str = strsplit(date_string,'-');
    % disp(spl_str)
    year_month_only = strcat(spl_str(1),'-',spl_str(2));