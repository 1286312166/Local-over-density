% sequence number versus small-distance variability plot

data = readtable('input_file.csv'); 

x_data = data{:, 1}; % sequence number
y_data = data{:, 2}; % small-distance variability

figure;
set(gcf,'unit','centimeters','position',[10 5 16.2 14.2]);
scatter(x_data, y_data,'filled','SizeData',20);
xlim([-2 600]); 
ylim([0.01 56]); 

set(gca, 'FontSize', 16); 
set(gca, 'Position', [0.13, 0.19, 0.74, 0.74]);
xlabel('Serial Number','FontSize', 18); 
ylabel('Small-Distance Variability','FontSize', 18); 

title('Serial Number - Small-Distance Variability Graph', 'FontSize', 20); 
set(gca, 'LineWidth', 1); 
set(gca, 'TickDir', 'out'); 
text(mean(xlim), min(ylim)*0.1 - 11.5, '(A)', 'HorizontalAlignment', 'center', 'FontSize', 19);