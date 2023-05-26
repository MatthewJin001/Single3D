function [X,Z] = Tabb(AA,BB)

[X_init,Z_init] = Shah(AA,BB);

para.A=AA;
para.B=BB;
para.x0=[vex(logm(X_init(1:3,1:3)))' X_init(1:3,4)' vex(logm(Z_init(1:3,1:3)))' Z_init(1:3,4)'];

options = optimoptions('fmincon','Display','off','StepTolerance',1e-5,'MaxFunctionEvaluations',3000,'Algorithm','sqp');

x=fmincon(@(x)cost_Tabb(x,para),para.x0,[],[],[],[],[],[],[],options);
XR=expm(skew([x(1);x(2);x(3)]));
Xt=[x(4);x(5);x(6)];    
ZR=expm(skew([x(7);x(8);x(9)]));
Zt=[x(10);x(11);x(12)];

X=[XR Xt;0 0 0 1];
Z=[ZR Zt;0 0 0 1];

end


function cost=cost_Tabb(x,para)

A=para.A;
B=para.B;
n=size(A,3);

%%
XR=expm(skew([x(1);x(2);x(3)]));
Xt=[x(4);x(5);x(6)];    
ZR=expm(skew([x(7);x(8);x(9)]));
Zt=[x(10);x(11);x(12)];        

cost=0;
for i=1:n
    cost=cost+norm(A(:,:,i)*[XR Xt;0 0 0 1]-[ZR Zt;0 0 0 1]*B(:,:,i),'fro')^2;    
end

end


function [X,Y]=Shah(AA,BB)
% Reference: Shah M. Solving the robot-world/hand-eye calibration problem 
% using the Kronecker product[J]. Journal of Mechanisms and Robotics, 2013, 5(3): 031007.

% Code from https://github.com/ihtishamaliktk/RWHE-Calib
% Adaptations are done for parameter consistency.

[m,n]=size(AA); n = n/4;
A = zeros(9*n,18);
T = zeros(9,9);
b = zeros(9*n,1);
for i = 1:n
    Ra = AA(1:3,4*i-3:4*i-1);
    Rb = BB(1:3,4*i-3:4*i-1);
    T = T + kron(Rb,Ra);
end
[u,s,v]=svd(T);
x = v(:,1);
y = u(:,1);
X = reshape(x,3,3);
X = sign(det(X))/abs(det(X))^(1/3)*X;
[u,s,v]=svd(X); X = u*v';
Y = reshape(y,3,3);
Y = sign(det(Y))/abs(det(Y))^(1/3)*Y;
[u,s,v]=svd(Y); Y = u*v';
A = zeros(3*n,6);
b = zeros(3*n,1);
for i = 1:n
    A(3*i-2:3*i,:) = [-AA(1:3,4*i-3:4*i-1) eye(3)];
    b(3*i-2:3*i,:) = AA(1:3,4*i) - kron(BB(1:3,4*i)',eye(3))*reshape(Y,9,1);
end
t = A\b;

X = [X t(1:3);[0 0 0 1]];
Y = [Y t(4:6);[0 0 0 1]];
end