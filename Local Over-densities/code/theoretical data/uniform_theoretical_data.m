% 2D uniform mesh synthetic data (without noise)

long_range = -50:1:50; % input range
lat_range = -50:1:50; % input range

[Long, Lat] = meshgrid(long_range, lat_range);

Value = sqrt(Long.^2 + Lat.^2) + 1;

Name = cellstr(num2str((1:numel(Long))', 'name%d'));

T = table(Long(:), Lat(:), Value(:),Name(:), 'VariableNames', {'Long', 'Lat', 'Value','Name'});

writetable(T, 'output_file.csv');