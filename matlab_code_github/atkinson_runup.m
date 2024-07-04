function [R2] = atkinson_runup(beach_slope, wave_height, wave_length)
    left_hand_side = 0.92 .* beach_slope .* ((wave_height .* wave_length) .^(0.5));
    right_hand_side = 0.16 .* wave_height;
    R2 = left_hand_side + right_hand_side;
end