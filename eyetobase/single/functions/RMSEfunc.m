function [cost,rmse] = RMSEfunc(R,t,p,Ri,ti,ppi)
n=size(ti,2);
cost=zeros(n,1);

rmse=0;
for i=1:n
     cost(i)=norm(R*ppi( :,i)+t-ti( :,i)-Ri( :,:,i)*p);   
     rmse=rmse+cost(i)^2;
end
rmse=sqrt(rmse/n);

end
