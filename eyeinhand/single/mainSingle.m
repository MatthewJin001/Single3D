

clc;clear;
filename='eyeinhand_rs_single';

currentFolder = pwd;
addpath ([currentFolder,'\functions\'])

for i=1:1e9
end

for num=[30,50,70]
    [Ri,ti,ppi]=preprocess(filename,num);
    [Rcf,tcf,pcf,Rit,tit,pit,rnticf,rntiit] = Alg(Ri,ti,ppi);
    [~,rmsecf] = RMSEfunc(Rcf,tcf,pcf,Ri,ti,ppi);
    [~,rmseit] = RMSEfunc(Rit,tit,pit,Ri,ti,ppi);

    disp(['Measurement number:',num2str(num)])
    resultSHow('closed-form',Rcf,tcf,pcf,rmsecf,rnticf);
    resultSHow('iterative',Rit,tit,pit,rmseit,rntiit);
end









