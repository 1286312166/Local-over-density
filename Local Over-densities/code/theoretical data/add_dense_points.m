% generate dense points

% dense points are added based on the existing model
old_data = readtable('input_file.csv');

numPoints = 100; % input number
Long = zeros(numPoints, 1); 
Lat = zeros(numPoints, 1);

for i = 1:numPoints
    Long(i) = 28.95 + (25.1 - 25)*rand(1);
    Lat(i) = 28.95 + (25.1 - 25)*rand(1);
end

Value = sqrt(Long.^2 + Lat.^2)+1;    % add dense points

start_index = size(old_data, 1) + 1;
Name = cellstr(num2str((start_index:start_index+numPoints-1)', 'name%d'));
new_data = table(Long(:), Lat(:), Value(:),Name(:), 'VariableNames', {'Long', 'Lat', 'Value','Name'});
combined_data = [old_data; new_data];

writetable(combined_data, 'output_file.csv');