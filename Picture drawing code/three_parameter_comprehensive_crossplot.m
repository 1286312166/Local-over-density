% draw a three-parameter comprehensive cross-plot

data1 = readtable('input_file1.csv');
data2 = readtable('input_file2.csv');

x1 = data1{:,1}; y1 = data1{:,2}; v1 = data1{:,3}; % Long, Lat, Value
x2 = data2{:,9}; y2 = data2{:,7}; v2 = data2{:,16}; % self-sparsity, mutual sparsity, small-distance variability

figure;
set(gcf,'unit','centimeters','position',[10 5 27 13.5]);

subplot(1,2,1);
scatter(x1, y1,35, v1,'filled'); 
axis equal; 
xlim([-5.2 5.2]); 
ylim([-5.2 5.2]); 
v_values1 = [-3.5, -2, -0.5, 0.5, 2, 3.5]; 
colors1 = [0 0 0.5; 
          0 0 1; 
          0 0.9 1; 
          0 0.5 0; 
          1 1 0; 
          1 0 0]; 
cmap1 = interp1(v_values1, colors1, linspace(-3.5, 3.5, 256)); 
colormap(gca,cmap1); 
caxis([-3.5 3.5]); 
h = colorbar; 

set(h, 'LineWidth', 1);
set(h, 'TickDir', 'out');
xlabel('Lon(°)','FontSize', 18); 
ylabel('Lat(°)','FontSize', 18); 
text(mean(xlim), min(ylim)-2.35, '(A)', 'HorizontalAlignment', 'center', 'FontSize', 19);
set(gca, 'FontSize', 16); 
set(gca, 'XTick', -5:1:5, 'YTick', -5:1:5); 
title('Spatial Scatter Plot', 'FontSize', 20); 
set(gca, 'LineWidth', 1); 
set(gca, 'TickDir', 'out'); 


subplot(1,2,2);
scatter(x2, y2,35, v2,'filled', 'MarkerEdgeColor', 'k'); 
xlim([10^-3 10^-0.5]); 
ylim([10^-5 10^-2.5]); 
set(gca, 'XScale', 'log'); 
set(gca, 'YScale', 'log'); 
v_values2 = [0, 1, 3, 5, 8, 11.5]; 
colors2 = [0 0 0.5; 
          0 0 1; 
          0 0.9 1; 
          0 0.5 0; 
          1 1 0; 
          1 0 0]; 
cmap2 = interp1(v_values2, colors2, linspace(0, 11.5, 256)); 
colormap(gca,cmap2); 
caxis([0 11.5]); 
h = colorbar; 

set(h, 'LineWidth', 1);
set(h, 'TickDir', 'out');
xlabel('Self Sparsity','FontSize', 18); 
ylabel('Mutual Sparsity','FontSize', 18); 
text(mean(xlim)*0.1, min(ylim)/2*0.5, '(B)', 'HorizontalAlignment', 'center', 'FontSize', 19);
set(gca, 'FontSize', 16); 

xticks([10^-3 10^-2 10^-1 10^0]);
xticklabels({'10^{-3}', '10^{-2}', '10^{-1}', '10^{0}'});
set(gca, 'XMinorTick', 'off'); 

yticks([10^-5 10^-4 10^-3 10^-2 10^-1]);
yticklabels({'10^{-5}', '10^{-4}', '10^{-3}', '10^{-2}', '10^{-1}'});
set(gca, 'YMinorTick', 'off'); 
title('Comprehensive Cross-Plot', 'FontSize', 20); 
set(gca, 'LineWidth', 1); 
set(gca, 'TickDir', 'out'); 
pbaspect([1 1 1]); 

set(subplot(1,2,1), 'Position', [0.02, 0.21, 0.44, 0.72]); 
set(subplot(1,2,2), 'Position', [0.51, 0.21, 0.44, 0.72]);


