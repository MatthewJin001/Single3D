clc;clear;
currentFolder = pwd;
addpath ([currentFolder,'\functions\'])

filename='D:\sp-exp2\eyeInHand\单点\eyeinhand_rs_single';
num=50;
[Ri,ti,ppi]=preprocess2(filename,num); 

[Rcf,tcf,pcf,Rit,tit,pit,rnti1,rnti2] = Alg(Ri,ti,ppi);

n=size(ti,2);
reproject_cf=zeros(3,n);
reproject_it=zeros(3,n);

for i=1:n
     reproject_cf(:,i)=Ri( :,:,i)'*(Rcf*ppi(:,i)+tcf-ti( :,i));
     reproject_it(:,i)=Ri( :,:,i)'*(Rit*ppi(:,i)+tit-ti( :,i));
end

figure(1) 
% set(figure(1),'Position',[251.6,385,740,219.3]);


subplot(3,3,1)
plot(pcf(1),pcf(2),'o','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'MarkerSize',4)
hold on
data=[reproject_cf(1,:)' reproject_cf(2,:)'];
plot(data(:, 1),data(:, 2),'x','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data);
plot(ellipse_X, ellipse_Y,'--','Color',[1 0 0]);

plot(pit(1),pit(2),'o','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0],'MarkerSize',4)
hold on
data=[reproject_it(1,:)' reproject_it(2,:)'];
plot(data(:, 1),data(:, 2),'x','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data);
plot(ellipse_X, ellipse_Y,'--','Color',[0 1 0]);

xlabel('X/mm')
ylabel('Y/mm')
% xlim([pit(1)-3.5,pit(1)+3])
% ylim([pit(2)-2.5,pit(2)+2.5])


%%
subplot(3,3,2)
plot(pcf(2),pcf(3),'o','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'MarkerSize',4)
hold on
data=[reproject_cf(2,:)' reproject_cf(3,:)'];
plot(data(:, 1),data(:, 2),'x','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data);
plot(ellipse_X, ellipse_Y,'--','Color',[1 0 0]);

plot(pit(2),pit(3),'o','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0],'MarkerSize',4)
hold on
data=[reproject_it(2,:)' reproject_it(3,:)'];
plot(data(:, 1),data(:, 2),'x','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data);
plot(ellipse_X, ellipse_Y,'--','Color',[0 1 0]);

xlabel('Y/mm')
ylabel('Z/mm')
title('The eye-in-hand case')
% xlim([pcf(2)-2.4,pcf(2)+2.5])
% ylim([pcf(3)-4.3,pcf(3)+4.3])


%%

subplot(3,3,3)
plot(pcf(1),pcf(3),'o','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'MarkerSize',4)
hold on
data=[reproject_cf(1,:)' reproject_cf(3,:)'];
plot(data(:, 1),data(:, 2),'x','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data);
plot(ellipse_X, ellipse_Y,'--','Color',[1 0 0]);

plot(pit(1),pit(3),'o','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0],'MarkerSize',4)
hold on
data=[reproject_it(1,:)' reproject_it(3,:)'];
plot(data(:, 1),data(:, 2),'x','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data);
plot(ellipse_X, ellipse_Y,'--','Color',[0 1 0]);

xlabel('X/mm')
ylabel('Z/mm')
% xlim([pcf(1)-4,pcf(1)+3.6])
% ylim([pcf(3)-4.1,pcf(3)+4.1])

% legend('Est.Pos.-IT','Proj. Seq.-IT','Conf. Elli.-IT')



clc;clear;
currentFolder = pwd;
addpath ([currentFolder,'\functions\'])

filename='eyetobase_rvc_single';
num=50;
[Ri,ti,ppi]=preprocess(filename,num); 

[Rcf,tcf,pcf,Rit,tit,pit,rnti1,rnti2] = Alg(Ri,ti,ppi);

n=size(ti,2);
reproject_cf=zeros(3,n);
reproject_it=zeros(3,n);

for i=1:n
     reproject_cf(:,i)=Ri( :,:,i)'*(Rcf*ppi(:,i)+tcf-ti( :,i));
     reproject_it(:,i)=Ri( :,:,i)'*(Rit*ppi(:,i)+tit-ti( :,i));
end

figure(1) 
set(figure(1),'Position',[680,458,560,420]);


subplot(3,3,4)
plot(pcf(1),pcf(2),'o','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'MarkerSize',4)
hold on
data=[reproject_cf(1,:)' reproject_cf(2,:)'];
plot(data(:, 1),data(:, 2),'x','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data);
plot(ellipse_X, ellipse_Y,'--','Color',[1 0 0]);

plot(pit(1),pit(2),'o','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0],'MarkerSize',4)
hold on
data=[reproject_it(1,:)' reproject_it(2,:)'];
plot(data(:, 1),data(:, 2),'x','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data);
plot(ellipse_X, ellipse_Y,'--','Color',[0 1 0]);
xlabel('X/mm')
ylabel('Y/mm')
% xlim([pit(1)-3.5,pit(1)+3])
% ylim([pit(2)-2.5,pit(2)+2.5])


%%
subplot(3,3,5)
plot(pcf(2),pcf(3),'o','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'MarkerSize',4)
hold on
data=[reproject_cf(2,:)' reproject_cf(3,:)'];
plot(data(:, 1),data(:, 2),'x','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data);
plot(ellipse_X, ellipse_Y,'--','Color',[1 0 0]);

plot(pit(2),pit(3),'o','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0],'MarkerSize',4)
hold on
data=[reproject_it(2,:)' reproject_it(3,:)'];
plot(data(:, 1),data(:, 2),'x','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data);
plot(ellipse_X, ellipse_Y,'--','Color',[0 1 0]);

xlabel('Y/mm')
ylabel('Z/mm')
title('The eye-to-hand case')
% xlim([pcf(2)-2.4,pcf(2)+2.5])
% ylim([pcf(3)-4.3,pcf(3)+4.3])


%%

subplot(3,3,6)
plot(pcf(1),pcf(3),'o','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'MarkerSize',4)
hold on
plot(pit(1),pit(3),'o','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0],'MarkerSize',4)

data1=[reproject_cf(1,:)' reproject_cf(3,:)'];
plot(data1(:, 1),data1(:, 2),'x','MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0]);
data2=[reproject_it(1,:)' reproject_it(3,:)'];
plot(data2(:, 1),data2(:, 2),'x','MarkerFaceColor',[0 1 0],'MarkerEdgeColor',[0 1 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data1);
plot(ellipse_X, ellipse_Y,'--','Color',[1 0 0]);
[ellipse_X,ellipse_Y] = CompEclipse(data2);
plot(ellipse_X, ellipse_Y,'--','Color',[0 1 0]);

xlabel('X/mm')
ylabel('Z/mm')
% xlim([pcf(1)-4,pcf(1)+3.6])
% ylim([pcf(3)-4.1,pcf(3)+4.1])

% lgd=legend('Est.-Cf','Est.It','Pro.-Cf','Pro.-It','Con.-Cf','Con.-It');
lgd=legend('Estimated-Cf','Estimated-It','Projected-Cf','Projected-It','Confident-Cf','Confident-It');

lgd.NumColumns=3;
function [ellipse_X,ellipse_Y] = CompEclipse(data)

center = mean(data);

%% PCA
[coeff, ~, latent, ~, ~] = pca(data);

% r1 r2 为自定义的向量大小参数(模)
r1 = 6;
r2 = 3;
% p1 p2 为第一主轴和第二主轴上的点
p1 = r1*coeff(:, 1)'+center;
p2 = r2*coeff(:, 2)'+center;

% 主轴方向与X轴之间的夹角
angle = cart2pol(coeff(1, :), coeff(2, :))*180/pi;
beta = angle(1, 1);
% 置信椭圆坐标（以 95% 为例）
semimajor = sqrt(latent(1, 1)); % 长轴长度（一半）
semiminor = sqrt(latent(2, 1)); % 短轴长度（一半）
alpha = linspace(0, 360, 2000)';
% 卡方分布表
 level = 4.605;  % 90%
%level = 5.991;  % 95%
% level = 9.210;  % 99%
% 椭圆坐标点
ellipse_X = center(1, 1)+sqrt(level)*(semimajor*cosd(alpha)*cosd(beta)-...
    semiminor*sind(alpha)*sind(beta));
ellipse_Y = center(1, 2)+sqrt(level)*(semimajor*cosd(alpha)*sind(beta)+...
    semiminor*sind(alpha)*cosd(beta));
end
