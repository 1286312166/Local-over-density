% calculate small-distance variability

data = readtable('input_file.csv');

Long = data{:, 1};
Lat = data{:, 2};
Value = data{:, 3};
Name = data{:, 4};

min_distance = zeros(height(data), 1);
min_point = cell(height(data), 4); 

for i = 1:height(data)
    distances1 = sqrt((Long(i) - Long).^2 + (Lat(i) - Lat).^2);
    distances1(i) = inf; 
    [min_distance1(i), idx] = min(distances1);
    min_point(i, :) = {Long(idx), Lat(idx),Value(idx),Name(idx)};
end

Long1 = cell2mat(min_point(:, 1));
Lat1 = cell2mat(min_point(:, 2));
Value1 = cell2mat(min_point(:,3));
Name1 = min_point(:,4);

data.Long1 = Long1;
data.Lat1 = Lat1;
data.Value1 = Value1;
data.Name1 = Name1;

dDist = abs(sqrt((Long - Long1).^2 + (Lat - Lat1).^2));
dV = abs(Value - Value1);
dV_dDist = dV./dDist;

data.dDist = dDist;
data.dV = dV;
data.dV_dDist = dV_dDist;

writetable(data, 'output_file.csv');
















