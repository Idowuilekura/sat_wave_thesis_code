function [] = plot_proxies(R2,wl,ws,mean_wl_ws, title_name)
    B_ = mean_wl_ws;
    corr_wl_r2_stock = corrcoef(R2,wl);
    subplot(1,3,1);plot(wl,'b');hold on;title("Waterline vs R2. Correlation = " + num2str(corr_wl_r2_stock(1,2)));plot(R2,'g')
    legend("waterline","R2");
    corr_ws_r2_stock = corrcoef(R2,ws);
    subplot(1,3,2);plot(ws,'k');hold on;title("Wet/Dry vs R2. Correlation = " + num2str(corr_ws_r2_stock(1,2)));plot(R2,'g')
    legend("wetsand","R2");
    corr_average_r2_stock = corrcoef(R2,B_);
    subplot(1,3,3);plot(B_,'m');hold on;title("Average Wet/Waterline vs R2. Correlation = " + num2str(corr_average_r2_stock(1,2)));plot(R2,'g')
    legend("Average Wetsand/Waterline","R2")
    % corr_setup_r2_stock = corrcoef(Setup, R2);
    % subplot(1,4,4);plot(Setup,'r'); hold on; title("Setup vs R2. Correlation = "+ num2str(corr_setup_r2_stock(1,2))); plot(R2,'g')
    % legend("setup","R2");
    set(gcf,'Position',[ 0.1146 *1000   0.2314 *1000   1.3352*1000    0.4632*1000])
    sgtitle("Runup Proxy Comparison for " + title_name)
end