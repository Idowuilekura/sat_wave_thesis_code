function [nrmse] = NRMSE(sat_value, predicted_value)
    rmse_value = rmse(sat_value, predicted_value);
    nrmse = rmse_value / (max(sat_value) - min(sat_value));

end