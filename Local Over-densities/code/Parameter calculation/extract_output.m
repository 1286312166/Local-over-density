% extract small values of self-sparsity and mutual sparsity
% and extract anomalously high values of small-distance variability
 
data = readtable('input_file.csv');

con1 = data.normalization_mutual_sparseness <= 10^(-3.6); % mutual sparsity
con2 = data.self_density <= 10^(-2.2); % self-sparsity
con3 = data.dV_dDist >= 50;  % small-distance variability
filtered_data = data((con1 & con2) | con3 , :);

writetable(filtered_data, 'output_file.csv', 'WriteVariableNames', true);





















