

clc;clear;
filename='eyeinhand_rs_single_1';

currentFolder = pwd;
addpath ([currentFolder,'\functions\'])
%%
for i=1:1e10
end

num=30;
[Ri,ti,ppi]=preprocess(filename,num); 
[~,~,~,~,~,~,~,~,resultlist,it_k] = Algtime(Ri,ti,ppi);

data1=[];
for k_ind=1:it_k
    [~,lossLog] =lossLogFunc(resultlist(:,1:3,k_ind),resultlist(:,4,k_ind),resultlist(:,5,k_ind),Ri,ti,ppi);
    data1=[data1;resultlist(1,6,k_ind) lossLog;];
end

%%
num=50;
[Ri,ti,ppi]=preprocess(filename,num); 
[~,~,~,~,~,~,~,~,resultlist,it_k] = Algtime(Ri,ti,ppi);

data2=[];
for k_ind=1:it_k
    [~,lossLog] =lossLogFunc(resultlist(:,1:3,k_ind),resultlist(:,4,k_ind),resultlist(:,5,k_ind),Ri,ti,ppi);
    data2=[data2;resultlist(1,6,k_ind) lossLog;];
end
%%
num=70;
[Ri,ti,ppi]=preprocess(filename,num); 
[~,~,~,~,~,~,~,~,resultlist,it_k] = Algtime(Ri,ti,ppi);

data3=[];
for k_ind=1:it_k
    [~,lossLog] =lossLogFunc(resultlist(:,1:3,k_ind),resultlist(:,4,k_ind),resultlist(:,5,k_ind),Ri,ti,ppi);
    data3=[data3;resultlist(1,6,k_ind) lossLog;];
end


figure;
plot([0 data1(1,1)],[data1(1,2) data1(1,2)],'--','Color',[0.00,0.45,0.74],'LineWidth',1.3)
hold on;
plot(data1(:,1),data1(:,2),'s-','Color',[0.00,0.45,0.74],'LineWidth',1.3)
plot([0 data2(1,1)],[data2(1,2) data2(1,2)],'--','Color',[0.85,0.33,0.10],'LineWidth',1.3)
plot(data2(:,1),data2(:,2),'s-','Color',[0.85,0.33,0.10],'LineWidth',1.3)
plot([0 data3(1,1)],[data3(1,2) data3(1,2)],'--','Color',[0.93,0.69,0.13],'LineWidth',1.3)
plot(data3(:,1),data3(:,2),'s-','Color',[0.93,0.69,0.13],'LineWidth',1.3)
% xlim([0 10e-4])
% ylim([1.65 2.05])
legend('Pre. of Frame30','Comp. of Frame30','Pre. of Frame50','Comp. of Frame50','Pre. of Frame70','Comp. of Frame70');
xlabel('Runtime/s')
ylabel('Cost/log(-)')


i=1;
text(data1(i,1),data1(i,2)+0.05,'Pre.','Color',[0.00,0.45,0.74],'FontSize',10)
i=2;
text(data1(i,1),data1(i,2)-0.05,'CF','Color',[0.00,0.45,0.74],'FontSize',10)
i=3;
text(data1(i,1),data1(i,2)-0.05,'It-1','Color',[0.00,0.45,0.74],'FontSize',10)
i=4;
text(data1(i,1),data1(i,2)-0.05,'It-2','Color',[0.00,0.45,0.74],'FontSize',10)

i=1;
text(data2(i,1),data2(i,2)+0.05,'Pre.','Color',[0.85,0.33,0.10],'FontSize',10)
i=2;
text(data2(i,1),data2(i,2)-0.05,'CF','Color',[0.85,0.33,0.10],'FontSize',10)
i=3;
text(data2(i,1),data2(i,2)-0.05,'It-1','Color',[0.85,0.33,0.10],'FontSize',10)
i=4;
text(data2(i,1),data2(i,2)-0.05,'It-2','Color',[0.85,0.33,0.10],'FontSize',10)

i=1;
text(data3(i,1),data3(i,2)+0.05,'Pre.','Color',[0.93,0.69,0.13],'FontSize',10)
i=2;
text(data3(i,1),data3(i,2)-0.05,'CF','Color',[0.93,0.69,0.13],'FontSize',10)
i=3;
text(data3(i,1),data3(i,2)-0.05,'It-1','Color',[0.93,0.69,0.13],'FontSize',10)
i=4;
text(data3(i,1),data3(i,2)-0.05,'It-2','Color',[0.93,0.69,0.13],'FontSize',10)


