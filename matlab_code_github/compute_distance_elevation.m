function [distance_sqrt] = compute_distance_elevation(lat_1, lat_2, long_1, long_2)
    distance = (((lat_1 - lat_2 )^2) + ((long_1 - long_2)^2));
    distance_sqrt = sqrt(distance);
end
