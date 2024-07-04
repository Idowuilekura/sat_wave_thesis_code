function [mean_error, rmse] = func_compute_stats_proxy_compare(first_param, second_param, date_value);

    [date, sortIdx] = sort(date_value);
    first_param = first_param(sortIdx);
    second_param = second_param(sortIdx);
    mean_error = mean(abs(first_param - second_param));
    rmse = sqrt(mean((first_param - second_param).^2));
end