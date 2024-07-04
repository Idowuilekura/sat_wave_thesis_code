function [distances, elevation_profile] = read_data_compute_distance(file_name)
    profile_year = shaperead(file_name);
    latitude_x = vertcat(profile_year.X);
    longitude_y = vertcat(profile_year.Y);
    elevation_profile = vertcat(profile_year.elevation);
    
    distances = zeros(length(latitude_x),1);

    for i=2:(length(distances))
        long_1 = longitude_y(i-1);
        long_2 = longitude_y(i);

        lat_1 = latitude_x(i-1);
        lat_2 = latitude_x(i);

        distance_between = compute_distance_elevation(lat_1, lat_2, long_1, long_2);
        distances(i) = distances(i-1) + distance_between;
    end
end
