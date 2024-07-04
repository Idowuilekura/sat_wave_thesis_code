directory = 'C:\Users\HP\Desktop\thesis_work\costacaprica_all\result_plots';
wave_direction = get_parameters(mergedwaveimageslopedetailscorrected, "DIR");
wave_height = get_parameters(mergedwaveimageslopedetailscorrected, "HS");
tide_data = get_parameters(mergedwaveimageslopedetailscorrected, "Tide");
tide_data = tide_data -2;
wet_sand_diff_profile = get_parameters(mergedwaveimageslopedetailscorrected, "wetsand");
waterline_diff_profile = get_parameters(mergedwaveimageslopedetailscorrected,"waterline");
average_wet_water_diff_profile = mean([wet_sand_diff_profile, waterline_diff_profile],2);
wave_period = get_parameters(mergedwaveimageslopedetailscorrected, "TP");
image_date = get_parameters(mergedwaveimageslopedetailscorrected,"date");
date_julian = get_parameters(mergedwaveimageslopedetailscorrected,"matlab_julian_date");
% rose(double(wave_direction),24)
wet_sand_2018_profile = get_parameters(combinedwavesatinfo2018profilenew,"wetsand");
waterline_2018_profile = get_parameters(combinedwavesatinfo2018profilenew, "waterline");

