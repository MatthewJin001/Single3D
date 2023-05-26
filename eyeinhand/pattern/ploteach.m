clc;clear;
filename='eyeinhand_rs_grid_1';
currentFolder = pwd;
addpath ([currentFolder,'\functions\'])

for i=1:1e8
end
%%
num=50;
[Ri,ti,ppi,pattern] = preprocess(filename,num);

for j=1:size(ti,2)
    Ri(:,:,j)=Ri(:,:,j)';
    ti(:,j)=-Ri(:,:,j)*ti(:,j) ;  
end
allit=0;
allcf=0;
rmseit=zeros(24,1);
rmsecf=zeros(24,1);
for i=1:24
qi=squeeze(ppi(:,:,i));
[Rcf,tcf,pcf,Rit,tit,pit,rnti] = Alg(Ri,ti,qi);
[cost,rmseit(i)] = RMSE(Rit,tit,pit,Ri,ti,qi);
[cost,rmsecf(i)] = RMSE(Rcf,tcf,pcf,Ri,ti,qi);
allit=allit+rmseit(i)^2;
allcf=allcf+rmsecf(i)^2;
end

figure;
% 680,505,560,373
% bar([1:1:24],rmseit)
plot([1:1:24],rmsecf,'-','Color',[1 0 0],'LineWidth',1)
hold on
% plot([0,25],[sqrt(allcf/24),sqrt(allcf/24)],'--','Color',[0.00,0.45,0.74])
plot([0,25],[sqrt(allcf/24),sqrt(allcf/24)],'--','Color',[1 0 0],'LineWidth',1)
plot([1:1:24],rmseit,'-','Color',[0 1 0],'LineWidth',1)
plot([0,25],[sqrt(allit/24),sqrt(allit/24)],'--','Color',[0 1 0],'LineWidth',1)
% ylim([1.5,2.3])

legend('RMSE for each point in pattern-Cf','Overall RMSE-Cf: 2.0438mm'...
    ,'RMSE for each point in pattern-It','Overall RMSE-It: 2.0098mm')
xlabel('Point sequence in pattern')
ylabel('RMSE/mm')
grid on;