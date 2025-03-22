% sequence number versus mutual sparsity plot

data = readtable('input_file.csv'); 
x_data = data{:, 1}; % sequence number
y_data = data{:, 2}; % mutual sparsity

figure;
set(gcf, 'Units', 'centimeters', 'Position', [10, 5, 20, 13.5]);
scatter(x_data, y_data, 'filled', 'SizeData', 20);
xlim([-2 1100]); 
ylim([10^-5 10^-2]);
set(gca, 'YScale', 'log');
set(gca, 'FontSize', 16);

set(gca, 'Units', 'centimeters');
fixedAxesPos = [2.6, 3, 16, 9.5];  
set(gca, 'Position', fixedAxesPos);

xlabel('Serial Number', 'FontSize', 18);
ylabel('Mutual Sparsity', 'FontSize', 18);
title('Serial Number - Mutual Sparsity Graph', 'FontSize', 20);
set(gca, 'LineWidth', 1);
set(gca, 'TickDir', 'out');
yticks([10^-6 10^-5 10^-4 10^-3 10^-2 10^-1 10^0]);
yticklabels({'10^{-6}', '10^{-5}', '10^{-4}', '10^{-3}', '10^{-2}', '10^{-1}', '10^{0}'});
set(gca, 'YMinorTick', 'off');


