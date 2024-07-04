directory = 'C:\Users\HP\Desktop\thesis_work\costacaprica_all\result_plots';
wave_direction = get_parameters(mergedwaveimageslopedetailscorrected, "DIR");
wave_height_image = get_parameters(mergedwaveimageslopedetailscorrected, "HS");
tide_data_image = get_parameters(mergedwaveimageslopedetailscorrected, "Tide");
wave_period = get_parameters(mergedwaveimageslopedetailscorrected,"TP");
tide_data_image = tide_data_image -2;
slope_data = table2array(mergedwaveimageslopedetailscorrected(:,"slope"));
waterline = get_parameters(mergedwaveimageslopedetailscorrected,"waterline");
wet_sand = get_parameters(mergedwaveimageslopedetailscorrected,"wetsand");
date_julian = table2array(mergedwaveimageslopedetailscorrected(:,"matlab_julian_date"));
% runup equation computation
[R_stockdon, setup_stockdon] = Runup_Stockdon(wave_height_image,wave_period, slope_data);
R2_stockdon = R_stockdon + tide_data_image;
[R_holman, setup_holman] = holman_compute(slope_data,wave_height_image,wave_period);
R2_holman = R_holman + tide_data_image ;
[R_with_tide_vousdou, R_no_tide_vousdou ]= vousdoukasetal_compute(slope_data,wave_height_image,wave_period,tide_data_image);
R2_no_tide_vousdou = R_no_tide_vousdou + tide_data_image;
% R2 holman 

runup_equation_r2_vector =[R2_stockdon,R2_holman, R2_no_tide_vousdou];

equation_name_vector = ["Stockdon et al. (2006)","Holman (1986)","Vousdoukas et al. (2012)"];

func_runup_equation_proxy_compare(runup_equation_r2_vector,wet_sand,equation_name_vector,date_julian,"wetsand","Wetsand Elevation (m)")
set(gcf, "Position",[1 1 1536 788.8000])
saveas(gcf, fullfile(directory, "runup_equation_proxy_compare_wetsand.png"))



func_runup_equation_proxy_compare(runup_equation_r2_vector,waterline,equation_name_vector,date_julian,"waterline","Waterline Elevation (m)")
set(gcf, "Position",[1 1 1536 788.8000])
saveas(gcf, fullfile(directory, "runup_equation_proxy_compare_waterline.png"))

max(wet_sand)

% func_runup_equation_proxy_compare(runup_equation_r2_vector,wet_sand,equation_name_vector,date_julian,"wetsand","Wetsand Elevation (m)")
% set(gcf, "Position",[1 1 1536 788.8000])
% saveas(gcf, fullfile(directory, "runup_equation_proxy_compare_wetsand.png"))

[date_value, sortIDx] = sort(date_julian);
R2_stockdon_sorted = R2_stockdon(sortIDx);
R2_holman_sorted = R2_holman(sortIDx);
R2_no_tide_vousdou_sorted = R2_no_tide_vousdou(sortIDx);

runup_equations = {R2_stockdon_sorted, R2_holman_sorted, R2_no_tide_vousdou_sorted};
equation_names = {'R2_stockdon', 'R2_holman', 'R2_no_tide_vousdou'};

waterline_sorted = waterline(sortIDx);
wet_sand_sorted = wet_sand(sortIDx);
% Variables to be analyzed
variables = {waterline_sorted, wet_sand_sorted};
variable_names = {'waterline', 'wetdry'};

% Initialize arrays to store metrics
mean_errors = zeros(3,2);
rsquared = zeros(3,2);
rmse = zeros(3,2);
std_dev_errors = zeros(3,2);


% Loop through each combination of runup equation and variable
for i = 1:length(runup_equations)
    for j = 1:length(variables)
        % Calculate the errors
        errors = runup_equations{i} - variables{j};
        
        % Mean error
        mean_errors(i,j) = mean(errors);
        
        % R-squared
        % SS_tot = sum((variables{j} - mean(variables{j})).^2);
        % SS_res = sum(errors.^2);
        % rsquared(i,j) = 1 - (SS_res / SS_tot);
        corr_coef_eq = corrcoef(runup_equations{i}, variables{j});
        rsquared_ = corr_coef_eq(1,2).^2;
        rsquared(i,j) = rsquared_;

        
        % RMSE
        rmse(i,j) = sqrt(mean(errors.^2));
        
        % Standard deviation of error
        std_dev_errors(i,j) = std(errors);
    end
end

% Create a table to display the results
metrics_table = table;
metrics_table.Formulation = repmat(equation_names', 2, 1);
metrics_table.Variable = repmat(variable_names', 3, 1);
metrics_table.Mean_Error = mean_errors(:);
metrics_table.R_squared = rsquared(:);
metrics_table.RMSE = rmse(:);
metrics_table.Std_Dev_Error = std_dev_errors(:);

% Display the table
disp(metrics_table);

corr_coef_eq = corrcoef(R2_stockdon_sorted, wet_sand_sorted);
rsquared_ = corr_coef_eq(1,2).^2

corr_coef_eq = corrcoef(R2_holman_sorted, waterline_sorted);
rsquared_ = corr_coef_eq(1,2).^2

runup_equations = {R2_stockdon_sorted, R2_holman_sorted, R2_no_tide_vousdou_sorted};
equation_names = {"R2_stockdon", "R2_holman", "R2_no_tide_vousdou"};

corr_coef_eq = corrcoef(runup_equations{2}, waterline_sorted);
rsquared_ = corr_coef_eq(1,2).^2

length(runup_equations)

variables = {waterline_sorted, wet_sand_sorted};
variable_names = {"waterline", "wetdry"};

[T_metrics] = func_metrics_runup_equation_table(runup_equations,variables,variable_names,equation_names,date_julian);

writetable(T_metrics, fullfile(directory,"runup_proxy_eqn_compare_metrics.xlsx"))