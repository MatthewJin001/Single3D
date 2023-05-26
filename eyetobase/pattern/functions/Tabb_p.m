function [R,t,RZ,tZ,rnti]  = Tabb_p(R_be,t_be,p_c,p_p,flag)
tic;
[A,B]  = GenAB(R_be,t_be,p_c,p_p,flag);
[X,Z] = Tabb(A,B);
R=X(1:3,1:3);
t=X(1:3,4);
RZ=Z(1:3,1:3);
tZ=Z(1:3,4);
rnti=toc;
end

