function [T] = func_metrics_runup_equation_table(runup_equation_r2_cell, proxies_cell, proxies_name_cell, equation_name_cell,date_value)
    [date, sortIdx] = sort(date_value);
    index_vector = 1;
    for i = 1:length(runup_equation_r2_cell)
        runup_equation_r2 = runup_equation_r2_cell{i};
        runup_equation_r2_sorted = runup_equation_r2(sortIdx);
        for j = 1:length(proxies_cell)
            proxy = proxies_cell{j};
            proxy_sorted = proxy(sortIdx);
            errors = runup_equation_r2_sorted - proxy_sorted;
            mean_errors = mean(errors);
            corr_coef_eq = corrcoef(runup_equation_r2_sorted, proxy_sorted);
            rsquared_ = corr_coef_eq(1,2).^2;
            rmse_ = sqrt(mean(errors.^2));
            std_dev_errors = std(errors);
            std_dev_errors_vect(index_vector) = std_dev_errors;
            mean_errors_vect(index_vector) = mean_errors;
            rsquared_vect(index_vector) = rsquared_;
            rmse_vect(index_vector) = rmse_;
            equation_name_vect(index_vector) = equation_name_cell{i};
            proxy_name_vect(index_vector) = proxies_name_cell{j};
            disp(equation_name_cell{i})
            index_vector = index_vector + 1;
        end
    end

    T = table(std_dev_errors_vect', mean_errors_vect', rsquared_vect', rmse_vect', equation_name_vect', proxy_name_vect', ...
    'VariableNames', {'StdDevErrors', 'MeanErrors', 'RSquared', 'RMSE', 'EquationName', 'ProxyName'});

    disp(T)


end