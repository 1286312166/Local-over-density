% calculate self-sparsity (use all points)

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
self_mean_distance = sum(distances, 2, 'omitnan') ./ (num_points - 1);
distance_self_density = overall_min_distance ./ self_mean_distance;

data.self_mean_distance = self_mean_distance;
data.self_density = distance_self_density;

writetable(data, 'output_file.csv');







