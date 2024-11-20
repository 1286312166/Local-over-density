% calculate self-sparsity, mutual sprasity and small-distance variability (for self-sparsity, neighbor points are used)

data = readtable('input_file.csv');

Long = data{:, 1};
Lat = data{:, 2};
Value = data{:, 3};
Name = data{:, 4};

num_points = length(Lat);
distances = zeros(num_points, num_points);
for i = 1:num_points
    for j = 1:num_points
        if i ~= j
            distances(i, j) = sqrt((Lat(j) - Lat(i))^2 + (Long(j) - Long(i))^2);
        else
            distances(i, j) = NaN;
        end
    end
end

min_distances = min(distances, [], 2);
sum_min_distances= sum(min_distances);
normalization_mutual_sparseness = min_distances / sum_min_distances;

data.min_distance = min_distances;
data.sum_min_distance = repmat(sum_min_distances, num_points, 1);
data.normalization_mutual_sparseness = normalization_mutual_sparseness;

n = 199; 
neighbors_distance = zeros(num_points, 1);

for i = 1:num_points
    [sorted_distances, sorted_indices] = sort(distances(i, :), 'ascend');
    valid_distances = sorted_distances(~isnan(sorted_distances));
    if length(valid_distances) >= n
        neighbors_distance(i) = sum(valid_distances(1:n));
    else
        neighbors_distance(i) = sum(valid_distances);
    end
end

self_mean_distance = neighbors_distance / n;
distance_self_density = min_distances ./ self_mean_distance;

data.self_mean_distance = self_mean_distance;
data.self_density = distance_self_density;

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

data.log10_nor_mutual_sp = log10(data.normalization_mutual_sparseness);
data.log10_self_sp = log10(data.self_density);

writetable(data, 'output_file.csv');
















