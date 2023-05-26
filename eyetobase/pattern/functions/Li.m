function [X,Y]=Li(AA,BB)
% Reference: Li A, Wang L, Wu D. Simultaneous robot-world and hand-eye 
% calibration using dual-quaternions and Kronecker product[J]. 
% International Journal of the Physical Sciences, 2010, 5(10): 1530-1536.

% Code from https://github.com/ihtishamaliktk/RWHE-Calib
% Adaptations are done for parameter consistency.

[m,n]=size(AA); n = n/4;

A = zeros(12*n,24);
b = zeros(12*n,1);
for i = 1:n
    Ra = AA(1:3,4*i-3:4*i-1);
    Rb = BB(1:3,4*i-3:4*i-1);
    ta = AA(1:3,4*i);
    tb = BB(1:3,4*i);
    A(12*i-11:12*i-3,1:18) = [kron(Ra,eye(3)) kron(-eye(3),Rb')];
    A(12*i-2:12*i,10:24) = [kron(eye(3),tb') -Ra eye(3)];
    b(12*i-2:12*i) = ta;
end
x = A\b;

X=reshape(x(1:9),3,3)';
[u,s,v]=svd(X); X = u*v'; if det(X)<0, X = u*diag([1 1 -1])*v'; end
X = [X x(19:21);[0 0 0 1]];
Y=reshape(x(10:18),3,3)';
[u,s,v]=svd(Y); Y = u*v'; if det(Y)<0, Y = u*diag([1 1 -1])*v'; end
Y = [Y x(22:24);[0 0 0 1]];
end
