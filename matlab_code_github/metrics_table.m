function [T] = metrics_table(sat_value_wl, sat_value_ws, sat_value_avg_wl_ws, predicted_value, equation_name, target)
    mean_error_stockdon_runup_wl = mean(abs(sat_value_wl - predicted_value));
    normalised_bias_wl = mean_error_stockdon_runup_wl / sum(sat_value_wl);
    rmse_stockdon_runup_wl = rmse(sat_value_wl, predicted_value);
    normalized_rmse_wl = NRMSE(sat_value_wl, predicted_value);

    mean_error_stockdon_runup_ws = mean(abs(sat_value_ws - predicted_value));
    normalised_bias_ws = mean_error_stockdon_runup_wl / sum(sat_value_ws);
    rmse_stockdon_runup_ws = rmse(sat_value_ws, predicted_value);
    normalized_rmse_ws = NRMSE(sat_value_ws, predicted_value);

    mean_error_stockdon_runup_avg_wl_ws = mean(abs(sat_value_avg_wl_ws - predicted_value));
    normalised_bias_avg_wl_ws = mean_error_stockdon_runup_avg_wl_ws / sum(sat_value_avg_wl_ws);
    rmse_stockdon_runup_avg_wl_ws = rmse(sat_value_avg_wl_ws, predicted_value);
    normalized_rmse_avg_wl_ws = NRMSE(sat_value_avg_wl_ws, predicted_value);

    % T = table(...
    % mean_error_stockdon_runup_wl, ...  % First value is for 'Mean Error' column
    % normalised_bias, ...              % Second value is for 'Normalized Bias' column
    % rmse_stockdon_runup_wl, ...
    % normalized_rmse);
    % T.Properties.VariableNames = {'Mean Error' 'Normalized Bias' 'RMSE','NRMSE'};


    T1 = table(equation_name,"Waterline", ...
        target,mean_error_stockdon_runup_wl, ...  % First value is for 'Mean Error' column
        normalised_bias_wl, ...              % Second value is for 'Normalized Bias' column
        rmse_stockdon_runup_wl, ...
        normalized_rmse_wl);
    T1.Properties.VariableNames = {'Equation','Proxy Name','target','Mean Error' 'Normalized Bias' 'RMSE','NRMSE'};

    T2 = table(equation_name,"Wetsand", ...
        target,mean_error_stockdon_runup_ws, ...  % First value is for 'Mean Error' column
        normalised_bias_ws, ...              % Second value is for 'Normalized Bias' column
        rmse_stockdon_runup_ws, ...
        normalized_rmse_ws);
    T2.Properties.VariableNames = {'Equation','Proxy Name','target','Mean Error' 'Normalized Bias' 'RMSE','NRMSE'};
    
    T3 = table(equation_name,"Average Wet/Waterline", ...
        target,mean_error_stockdon_runup_avg_wl_ws, ...  % First value is for 'Mean Error' column
        normalised_bias_avg_wl_ws, ...              % Second value is for 'Normalized Bias' column
        rmse_stockdon_runup_avg_wl_ws, ...
        normalized_rmse_avg_wl_ws);
    T3.Properties.VariableNames = {'Equation','Proxy Name','target','Mean Error' 'Normalized Bias' 'RMSE','NRMSE'};

    T =  vertcat(T1,T2,T3);
end
