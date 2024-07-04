function [scatter_index_value] = scatter_index(sat_value, predicted_value)
 scatter_index_value = rmse(sat_value, predicted_value)/ mean(sat_value);
end