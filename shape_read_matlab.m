profile_2018 = shaperead("profile_2018_12_27.shp");
latitude_x = profile_2018(:,:).X;
logitude_y = profile_2018.Y;
elevation_profile = profile_2018.elevation;

cell2mat(struct2cell(profile_2018))

vertcat(profile_2018.X)
vertcat(profile_2018.Y)
