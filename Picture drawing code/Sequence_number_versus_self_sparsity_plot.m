% sequence number versus self-sparsity plot

data = readtable('input_file.csv'); 
x_data = data{:, 1}; % sequence number
y_data = data{:, 2}; % self-sparsity

figure;
set(gcf, 'Units', 'centimeters', 'Position', [10, 5, 20, 12.9]);
scatter(x_data, y_data, 'filled', 'SizeData', 20);
xlim([-2, 1100]);
ylim([10^-3.5, 10^-0.5]);
set(gca, 'YScale', 'log'); 
set(gca, 'FontSize', 16);

set(gca, 'Units', 'centimeters');
fixedAxesPos = [2.6, 2.6, 16, 9.5];  
set(gca, 'Position', fixedAxesPos);

xlabel('Serial Number', 'FontSize', 18);
ylabel('Self Sparsity', 'FontSize', 18);
title('Serial Number - Self Sparsity Graph', 'FontSize', 20);
set(gca, 'LineWidth', 1);
set(gca, 'TickDir', 'out');
yticks([10^-4 10^-3 10^-2 10^-1 10^0]);
yticklabels({'10^{-4}', '10^{-3}', '10^{-2}', '10^{-1}', '10^{0}'});
set(gca, 'YMinorTick', 'off');
