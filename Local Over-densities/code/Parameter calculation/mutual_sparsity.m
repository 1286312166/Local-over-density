% calculate mutual sparsity

data = readtable('input_file.csv');

lon = data{:, 1};
lat = data{:, 2};

num_points = length(lat);
distances = zeros(num_points, num_points);
for i = 1:num_points
    for j = 1:num_points
        if i ~= j
            distances(i, j) = sqrt((lat(j) - lat(i))^2 + (lon(j) - lon(i))^2);
        else
            distances(i, j) = inf;
        end
    end
end

min_distances = min(distances, [], 2);
sum_min_distances= sum(min_distances);
normalization_mutual_sparseness = min_distances / sum_min_distances;

data.min_distance = min_distances;
data.sum_min_distance = repmat(sum_min_distances, num_points, 1);
data.normalization_mutual_sparseness = normalization_mutual_sparseness;

writetable(data, 'output_file.csv');




