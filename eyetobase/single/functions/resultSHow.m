function resultSHow(methodStr,R,t,p,rmse,rnti)
disp(' ')
disp(['Calibration results of the ',methodStr,' solution:'])

eularR=rotm2eul(R)*180/pi;
vecRstr=[];
for i=1:3
   vecRstr=[vecRstr,num2str(eularR(i)),','];
end
vecRstr=vecRstr(1:end-1);


% vecRstr=[];
% vecR=reshape(R',9,1)';
% for i=1:9
%    vecRstr=[vecRstr,num2str(vecR(i)),','];
% end
% vecRstr=vecRstr(1:end-1);

tstr=[];
for i=1:3
   tstr=[tstr,num2str(t(i)),','];
end
tstr=tstr(1:end-1);

pstr=[];
for i=1:3
   pstr=[pstr,num2str(p(i)),','];
end
pstr=pstr(1:end-1);

disp(['Eular(R):',vecRstr]);
disp(['t(mm):',tstr]);
disp(['p(mm):',pstr]);

disp(['RMSE(mm):',num2str(rmse)]);
disp(['Runtime(s):',num2str(rnti)]);
disp('--------------------------------------------------------------------')
end