function [errorNorm,lossLog] = lossLogFunc(R,t,p,Ri,ti,ppi)
n=size(ti,2);
errorNorm=zeros(n,1);

loss=0;
for i=1:n
     errorNorm(i)=norm(R*ppi( :,i)+t-ti( :,i)-Ri( :,:,i)*p);   
     loss=loss+errorNorm(i)^2;
end
% lossLog=log(loss);
lossLog=sqrt(loss/n);
end

