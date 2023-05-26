function [cost,sum] = RMSE(R,t,p,Ri,ti,ppi)
n=size(ti,2);
cost=zeros(n,1);

sum=0;
for i=1:n
     cost(i)=norm(R*ppi( :,i)+t-ti( :,i)-Ri( :,:,i)*p);   
     sum=sum+cost(i)^2;
end
sum=sqrt(sum/n);

end

