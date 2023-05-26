clc;clear;

filename='eyeinhand_rs_grid_1';

currentFolder = pwd;
addpath ([currentFolder,'\functions\'])

for i=1:1e9
end
%%
num=30;
[Ri,ti,ppi,pattern] = preprocess(filename,num);
[R,t,RZ,tZ,rnti] = Shah_p(Ri,ti,ppi,pattern,3);

for i=1:size(ti,2)
    Ri(:,:,i)=Ri(:,:,i)';
    ti(:,i)=-Ri(:,:,i)*ti(:,i) ;
end
sum=0;
for i=1:size(ppi,2)
    for j=1:size(ppi,3)
        sum=sum+norm(R*ppi(:,i,j)+t-Ri(:,:,i)*(RZ*pattern(:,j)+tZ)-ti(:,i))^2;
    end
end
rmse=sqrt(sum/size(ppi,2)/size(ppi,3));

disp(['Tabb',num2str(num)])
disp(['RESULT',':RMSE:',num2str(rmse),',RNTI:',num2str(rnti)])
disp('R:'),disp(rotm2eul(R)*180/pi);
disp('t:'),disp(t);
%%

num=50;
[Ri,ti,ppi,pattern] = preprocess(filename,num);
[R,t,RZ,tZ,rnti] = Shah_p(Ri,ti,ppi,pattern,3);

for j=1:size(ti,2)
    Ri(:,:,j)=Ri(:,:,j)';
    ti(:,j)=-Ri(:,:,j)*ti(:,j) ;
end
sum=0;
for i=1:size(ppi,2)
    for j=1:size(ppi,3)
        sum=sum+norm(R*ppi(:,i,j)+t-Ri(:,:,i)*(RZ*pattern(:,j)+tZ)-ti(:,i))^2;
    end
end
rmse=sqrt(sum/size(ppi,2)/size(ppi,3));

disp(['Tabb',num2str(num)])
disp(['RESULT',':RMSE:',num2str(rmse),',RNTI:',num2str(rnti)])
disp('R:'),disp(rotm2eul(R)*180/pi);
disp('t:'),disp(t);

%%
num=70;
[Ri,ti,ppi,pattern] = preprocess(filename,num);
[R,t,RZ,tZ,rnti] = Shah_p(Ri,ti,ppi,pattern,3);

for j=1:size(ti,2)
    Ri(:,:,j)=Ri(:,:,j)';
    ti(:,j)=-Ri(:,:,j)*ti(:,j) ;
end
sum=0;
for i=1:size(ppi,2)
    for j=1:size(ppi,3)
        sum=sum+norm(R*ppi(:,i,j)+t-Ri(:,:,i)*(RZ*pattern(:,j)+tZ)-ti(:,i))^2;
    end
end
rmse=sqrt(sum/size(ppi,2)/size(ppi,3));

disp(['Tabb',num2str(num)])
disp(['RESULT',':RMSE:',num2str(rmse),',RNTI:',num2str(rnti)])
disp('R:'),disp(rotm2eul(R)*180/pi);
disp('t:'),disp(t);



