function [] = scatter_plot_equation(wl_plot, ws_plot, average_wet_dry_plot, proxy_to_plot, title_plot, parameter_name)
close all;
corr_wl_proxy = corrcoef(wl_plot, proxy_to_plot);
corr_ws_proxy = corrcoef(ws_plot, proxy_to_plot);
corr_wet_dry_proxy = corrcoef(average_wet_dry_plot, proxy_to_plot);
% corr_wl_proxy(1,2)
% disp(parameter_name)
% subplot(3,1,1)
% scatter(wl_plot, proxy_to_plot)
% title(title + " vs " + parameter_name + "Correlation = " + num2str(corr_wl_proxy(1,2)))

figure(1)
subplot(1,3,1)
scatter(wl_plot, proxy_to_plot)
title("Waterline")
title("Waterline vs " + parameter_name + " Correlation = " + num2str(corr_wl_proxy(1,2)))
subplot(1,3,2)
scatter(ws_plot, proxy_to_plot)
title("Wet/Dry vs " + " vs " + parameter_name + " Correlation = " + num2str(corr_ws_proxy(1,2)))
subplot(1,3,3)
scatter(average_wet_dry_plot, proxy_to_plot)
title("Average Wet/Dry "+ " vs " + parameter_name + " Correlation = " + num2str(corr_wet_dry_proxy(1,2)))
sgtitle(title_plot)
set(gcf,'Position',[ 0.1146 *1000   0.2314 *1000   1.3352*1000    0.4632*1000])

end