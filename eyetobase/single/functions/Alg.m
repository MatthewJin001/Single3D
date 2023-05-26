function [Rcf,tcf,pcf,Rit,tit,pit,timecf,timeit] = Alg(Ri,ti,ppi)
tic;
iter_max=100;
step_th=1e-5;
n=size(Ri,3);

R_=mean(Ri,3);
t_=mean(ti,2);
p_=mean(ppi,2);

Rs=Ri-R_;
ts=ti-t_;
ps=ppi-p_;

M=zeros(3,3);
P=zeros(9,3);
N=zeros(3,3);
Q=zeros(3,3);
T=zeros(3,1);

for i=1:n
    M=M+Rs(:,:,i)'*Rs(:,:,i);
    P=P+kron(ps(:,i),Rs(:,:,i));
    N=N+ps(:,i)*ps(:,i)';
    Q=Q+ts(:,i)*ps(:,i)';
    T=T+Rs(:,:,i)'*ts(:,i);
end

vec_R=inv((kron(N,eye(3))-P*inv(M)*P'))*(reshape(Q,9,1)-P*inv(M)*T);
Rcf_l=reshape(vec_R,3,3);
[U,~,V]=svd(Rcf_l);
Rcf=sign(det(U)*det(V))*U*V';
pcf=inv(M)*(P'*reshape(Rcf,9,1)-T);
tcf=t_-Rcf*p_+R_*pcf;

timecf=toc;
Rk=Rcf;

k_num=1;
step=100;

while (step_th<step && k_num<iter_max)
    
    k_num=k_num+1;
    
    delta=Rk*inv((N-trace(N)*eye(3))+R_f(Rk)'*P*inv(M)*P'*R_f(Rk))...
        *R_f(Rk)'*(reshape(Q,9,1)-P*inv(M)*(T-P'*reshape(Rk,9,1)));
    
    Rk=expm(skew(delta))*Rk;
    
    step=norm(delta);
end

Rit=Rk;
pit=inv(M)*(P'*reshape(Rit,9,1)-T);
tit=t_-Rit*p_+R_*pit;

timeit=toc;
end

function [R_new] = R_f(R)
R_new=[zeros(3,1) R(:,3) -R(:,2);...
       -R(:,3) zeros(3,1) R(:,1);...
       R(:,2) -R(:,1) zeros(3,1)];
end
