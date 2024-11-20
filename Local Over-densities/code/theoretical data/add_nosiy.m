% noise was added to the synthetic data

% Gaussian random noise with a standard deviation of 5% was added to both synthetic models
data = readtable('input_file.csv');

num_rows = size(data, 1);

gaussian_error = zeros(num_rows, 1);
for i = 1:num_rows
    std_value = 0.05 * data.Value(i); 
    gaussian_error(i) = std_value * randn; 
end

data.Value = data.Value + gaussian_error;
data.Properties.VariableNames{'Value'} = 'Value';

writetable(data, 'output_file.csv', 'WriteVariableNames', true);

