hs = mergedwaveimagedetails{:,"HS"};
tp = mergedwaveimagedetails{:,"TP"};
slope = mergedwaveimagedetails{:,"slope"};
tide = mergedwaveimagedetails{:,"Tide"};
source_image = mergedwaveimagedetails{:,"source"};
wet_sand_height = mergedwaveimagedetails{:,"wetsand"};
wave_length = (9.8 * (tp').^2)/(2 * pi);
wave_steepness = hs./wave_length';
surf_similarity = slope .* ((wave_steepness).^0.5);
% removal of tide from runup
wet_sand_runup_tide = wet_sand_height - tide;
slope_for = repelem(0.1,length(wet_sand_runup_tide));
[run_up_stockdon_computed, setup] = Runup_Stockdon(hs,tp, slope_for');
subplot(4,1,1)
scatter(wet_sand_runup_tide, run_up_stockdon_computed);
title("runup satellite vs stockdon runup computed")
xlabel("runup observed")
ylabel("runup computed with stockdon")
subplot(4,1,2)
histogram(run_up_stockdon_computed,'FaceAlpha',1, NumBins=30)
hold on
histogram(wet_sand_runup_tide, NumBins=30)
legend("stockdon","observed")
title("stockdon computed runup histogram vs satellite runup")
subplot(4,1,3)
scatter(wave_steepness, wet_sand_runup_tide)
title("wave steepness vs wave runup observed")
subplot(4,1,4)
scatter(surf_similarity, wet_sand_runup_tide)
title("surf similarity vs wave runup observed")
%  rmse
rmse(run_up_stockdon_computed, wet_sand_runup_tide)

scatter(run_up_stockdon_computed, wet_sand_runup_tide)
legend(['planet_scope','sentinel'])

index_sentinel = find(source_image=='Sentinel (GEE)');
index_planet_scope = find(source_image == 'planetscope');
scatter(run_up_stockdon_computed(index_sentinel),wet_sand_runup_tide(index_sentinel),'o','MarkerFaceColor','r')
hold on;
scatter(run_up_stockdon_computed(index_planet_scope), wet_sand_runup_tide(index_planet_scope), 'MarkerFaceColor','b')
legend(unique(source_image));
title("runup computed vs runup observed")

slope_values_demo = linspace(0.1,0.6558,4);
for i=1:length(slope_values_demo)
    subplot(4,1,i)
    slope_for = repelem(slope_values_demo(i),length(wet_sand_runup_tide));
    slope_vector(i) = slope_values_demo(i);
    [run_up_stockdon_computed_demo, setup_demo] = Runup_Stockdon(hs,tp, slope_for');
    histogram(run_up_stockdon_computed_demo,'FaceAlpha',1, NumBins=30)
    hold on
    histogram(wet_sand_runup_tide, NumBins=30)
    % rmse(run_up_stockdon_computed_demo, wet_sand_runup_tide)
    rmse_vector(i) = rmse(run_up_stockdon_computed_demo, wet_sand_runup_tide)
    variance_vector_stockdon(i) = var(run_up_stockdon_computed_demo)
    variance_vector_satellite = var(wet_sand_runup_tide)
    title(sprintf('Runup computed vs Observed with slope value %d',slope_values_demo(i)))
    legend("stockdon","observed")

end



    


    
save('satellite_and_wave_tide_data.mat','mergedwaveimagedetails','-mat')




