function [wave_length] = compute_wave_length(period)
    wave_length = (9.81 * (period).^2) ./ (2*pi);

end