function [R2] = medellin_runup(beach_slope, wave_height, wave_length)
    brack_eq = (beach_slope .* wave_height .* wave_length).^0.5;
    R2 = brack_eq .* 0.189;
end