% calculate self-sparsity (use neighbor points)

data = readtable('input_file.csv'); 

lat = data{:, 2}; 
lon = data{:, 1}; 

num_points = length(lat);
distances = zeros(num_points, num_points);
for i = 1:num_points
    for j = 1:num_points
        if i ~= j
            distances(i, j) = sqrt((lat(j) - lat(i))^2 + (lon(j) - lon(i))^2);
        else
            distances(i, j) = NaN; 
        end
    end
end

overall_min_distance = min(distances, [], 2, 'omitnan');

n = 25; % input the number of neighbor points
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
distance_self_density = overall_min_distance ./ self_mean_distance;

data.overall_min_distance = overall_min_distance;
data.neighbors_distance = neighbors_distance;
data.self_mean_distance = self_mean_distance;
data.self_density = distance_self_density;

writetable(data, 'output_file.csv');



