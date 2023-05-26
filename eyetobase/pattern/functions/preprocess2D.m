function [Ri,ti,ppi,pattern] = preprocess2D(filename,num)
choose_list=1:1:num;

a1=load([filename,'/pointUndistort/','1_undistort.txt']);
seris=a1(:,1);%默认第一个量测是正确序号

M_max=24;
N_max=length(choose_list);

ppi=zeros(2,N_max,M_max);

for N_i=1:N_max
    a=load([filename,'/pointUndistort/',num2str(choose_list(N_i)),'_undistort.txt']);
    
    if a(:,1)==seris
        ppi(:,N_i,:)=a(2:2:48,2:3)';
    else
        disp('Error Seris');
        disp([num2str(choose_list(N_i)),'.txt']);
    end    
end


b=load([filename,'/robot/','tcpEx.txt']);% 前三为坐标，后三维欧拉角

Ri=zeros(3,3,N_max);
ti=zeros(3,N_max);
%
for N_i=1:N_max
    ti(:,N_i)=[b(choose_list(N_i),1);b(choose_list(N_i),2);b(choose_list(N_i),3)];
    Ri(:,:,N_i)=eular2dcm(b(choose_list(N_i),4),b(choose_list(N_i),5),b(choose_list(N_i),6));
end

pattern_T=...
    [0,0,0;
    30,0,0;
    60,0,0;
    90,0,0;
    120,0,0;
    150,0,0;
    0,30,0;
    30,30,0;
    60,30,0;
    90,30,0;
    120,30,0;
    150,30,0;
    0,60,0;
    30,60,0;
    60,60,0;
    90,60,0;
    120,60,0;
    150,60,0;
    0,90,0;
    30,90,0;
    60,90,0;
    90,90,0;
    120,90,0;
    150,90,0;];
pattern=pattern_T';

end
