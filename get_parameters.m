function [data_val] = get_parameters(data_, param_interest)
% get_parameters get column of interest from a matlab table
% wave_height = get_parameters(table_data, "HS") wil return HS as a vector
data_val = data_(:,param_interest);
    data_val = data_val{:,:};
end