function [X,Z] = Zhao(AA,BB)

[X_init,Z_init] = Shah(AA,BB);



para.A=AA;
para.B=BB;
para.x0=[vex(logm(X_init(1:3,1:3)))' X_init(1:3,4)' vex(logm(Z_init(1:3,1:3)))' Z_init(1:3,4)'];

options = optimoptions('fmincon','Display','off','StepTolerance',1e-5,'MaxIterations',200,'Algorithm','sqp');

x=fmincon(@(x)cost_zhao(x,para),para.x0,[],[],[],[],[],[],[],options);
XR=expm(skew([x(1);x(2);x(3)]));
Xt=[x(4);x(5);x(6)];    
ZR=expm(skew([x(7);x(8);x(9)]));
Zt=[x(10);x(11);x(12)];

X=[XR Xt;0 0 0 1];
Z=[ZR Zt;0 0 0 1];
end


function cost=cost_zhao(x,para)

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
    cost=cost+norm(reshape((A(:,:,i)*[XR Xt;0 0 0 1]-[ZR Zt;0 0 0 1]*B(:,:,i)),16,1),1)^2;    
end

end


function X  = Park(A,B)
n = size(A,3);

%% Calculate best rotation Rcg
a=zeros(3,n);
b=zeros(3,n);
for i = 1:n
    a(:,i) = vex(logm(A(1:3,1:3,i)));
    b(:,i) = vex(logm(B(1:3,1:3,i)));
end
%||a-R*b||
W=zeros(3,3);
for i=1:n
    W=W+a(:,i)*b(:,i)';
end


[U S V]=svd(W);
R=U*diag([1,1,det(U)*det(V)])*V';


%% Calculate best translation t
C = zeros(3*n,3);
d = zeros(3*n,1);

for i = 1:n
    C(3*i-2:3*i,:) = eye(3) - A(1:3,1:3,i);
    d(3*i-2:3*i,:) = A(1:3,4,i)-R*B(1:3,4,i);
end

t = C\d;
X = [R t;0 0 0 1];
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