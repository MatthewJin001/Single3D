function [Ri,ti,ppi]=preprocess(filename,num)
listChoose=1:1:num;

a1=load([filename,'/pointUndistort/','1_undistort.txt']);
seris=a1(1,1);% The serial number of the first measurement is the correct serial number by default

nMax=length(listChoose);
ppi=zeros(3,nMax);

for nIdx=1:nMax
    a=load([filename,'/pointUndistort/',num2str(listChoose(nIdx)),'_undistort.txt']);
    if a(1,1)==seris
        ppi(:,nIdx)=[a(1,2);a(1,3);a(1,4)];
    else
        disp('Error Seris');
        disp([num2str(listChoose(nIdx)),'.txt']);
    end
end

b=load([filename,'/robot/','tcpEx.txt']);%

Ri=zeros(3,3,nMax);
ti=zeros(3,nMax);

for nIdx=1:nMax
    ti(:,nIdx)=[b(listChoose(nIdx),1);b(listChoose(nIdx),2);b(listChoose(nIdx),3)];
    Ri(:,:,nIdx)=eular2dcm(b(listChoose(nIdx),4),b(listChoose(nIdx),5),b(listChoose(nIdx),6));
    % Ri(:,:,nIdx)=Ri(:,:,nIdx)';
    % ti(:,nIdx)=-Ri(:,:,nIdx)*ti(:,nIdx);
end
end

function [dcm] = eular2dcm(roll,pitch,yaw)

dcm=[cos(yaw)*cos(pitch), cos(yaw)*sin(pitch)*sin(roll) - sin(yaw)*cos(roll), cos(yaw)*sin(pitch)*cos(roll) + sin(yaw)*sin(roll);
    sin(yaw)*cos(pitch), sin(yaw)*sin(pitch)*sin(roll) + cos(yaw)*cos(roll), sin(yaw)*sin(pitch)*cos(roll) - cos(yaw)*sin(roll);
    -sin(pitch), cos(pitch)*sin(roll), cos(pitch)*cos(roll)];
end
