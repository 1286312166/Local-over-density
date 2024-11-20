% synthetic data generation (without noise)

numPoints = 100; % input number
latLong = zeros(numPoints, 2); % 初始化经纬度坐标数组

for i = 1:numPoints
    latLong(i, :) = -50 + (50-(-50)).*rand(1, 2);
end

Value = sqrt(latLong(:,1).^2 + latLong(:,2).^2)+1;
Name = cellstr(num2str((1:length(latLong))', 'name%d'));

T = table(latLong(:,1), latLong(:,2), Value,Name, 'VariableNames', {'Long', 'Lat', 'Value','Name'});

writetable(T, 'output_file.csv');

















































