

h=figure
set(h,'position',[310.3333,522.3333,724.6667,250.6667])

x=1;
y = [5.2 10.4 2.3 17.9 1.2 2.7 3.2;];

% Grouped
t=tiledlayout(2,1);
t.TileSpacing = 'compact';
t.Padding = 'compact';
ax1 = nexttile;
barh(ax1,x,y,0.5,'stacked')
lgd1=legend('Connector design','Connector manufacture','Connector load','Measurement',...
    'Calculation','Connector unload','Gripper assembly')
lgd1.NumColumns = 4;
ylim([0.5 2.5])
xlim([0,45])
title('pose-based HEC (Tabb''s method for 50 frames of data)')
xticklabels('')
yticklabels('')
for i=1:length(y)
    text(sum(y(1:i-1))+y(i)/2-0.5,1,num2str(y(i)))
end
y_all=sum(y);
text(y_all,1,['Total:',num2str(y_all),'min']);

y=[3.2 13.1 1.1];
% Stacked
ax2 = nexttile;
barh(ax2,x,y,0.5,'stacked')
lgd2=legend('Marker-attached Gripper assembly','Measurement',...
    'Calculation')
lgd2.NumColumns = 3;
xlim([0,45])
ylim([0.5 2.5])
title('point-based HEC (Proposed iterative method for 50 frames of data)')
xlabel('Operation Time Consumption(min)')
yticklabels('')
for i=1:length(y)
    text(sum(y(1:i-1))+y(i)/2-0.5,1,num2str(y(i)))
end
y_all=sum(y);
text(y_all,1,['Total:',num2str(y_all),'min']);

