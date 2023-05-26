function [A,B]  = GenAB(R_be,t_be,p_c,p_p,flag)

%input:R_be(:,:,n),t_be(:,n),p_c(:,n,m),p_p(:,m)
%flag:
% 1:eye-to-base AX=ZB
% 2:eye-to-base AX=XB
% 3:eye-on-hand AX=ZB
% 4:eye-on-hand AX=XB
%output: A,B

n=size(p_c,2);%sample num
m=size(p_c,3);%point num
R_cp=zeros(3,3,n);
t_cp=zeros(3,n);
T_cp=zeros(4,4,n);

p_p_=mean(p_p(:,1:m),2); %pattern center

T_be=zeros(4,4,n);

for i=1:n    
    p_c_i_=mean(squeeze(p_c(:,i,1:m)),2);
    W=zeros(3,3);
    for j=1:m
        W=W+ (p_c(:,i,j)-p_c_i_)*(p_p(:,j)-p_p_)';
    end
    [U,~,V]=svd(W);
    R_cp(:,:,i)=U*diag([1,1,det(U)*det(V)])*V';
    t_cp(:,i)=p_c_i_-R_cp(:,:,i)*p_p_;
     
    T_cp(:,:,i)=[R_cp(:,:,i) t_cp(:,i);0 0 0 1];
    
    T_be(:,:,i)=[R_be(:,:,i) t_be(:,i);0 0 0 1];
end

switch flag
    case 1
        
        %disp('1:eye-to-base,AX=ZB to solve bXc');
        A=zeros(4,4,n);
        B=zeros(4,4,n);
        for i=1:n
            A(:,:,i)=inv(T_be(:,:,i));
            B(:,:,i)=inv(T_cp(:,:,i));
        end
        
    case 2
        %disp('2:eye-to-base,AX=XB to solve bXc');
        A=zeros(4,4,n*(n-1)/2);
        B=zeros(4,4,n*(n-1)/2);
        k=1;
        for i=1:n
            for v=i+1:n
                A(:,:,k)=T_be(:,:,v)*inv(T_be(:,:,i));
                B(:,:,k)=T_cp(:,:,v)*inv(T_cp(:,:,i));
                k=k+1;
            end
        end
        
    case 3
        % disp('3:eye-on-hand AX=ZB to solve eXc');
        A=zeros(4,4,n);
        B=zeros(4,4,n);
        for i=1:n
            A(:,:,i)=T_be(:,:,i);
            B(:,:,i)=inv(T_cp(:,:,i));
        end
        
    case 4
        %disp('4:eye-on-hand,AX=XB to solve eXc');
        A=zeros(4,4,n*(n-1)/2);
        B=zeros(4,4,n*(n-1)/2);
        k=1;
        for i=1:n
            for v=i+1:n
                A(:,:,k)=inv(T_be(:,:,v))*T_be(:,:,i);
                B(:,:,k)=T_cp(:,:,v)*inv(T_cp(:,:,i));
                k=k+1;
            end
        end
        
    otherwise
        disp('Error Flag');
        
end

end

