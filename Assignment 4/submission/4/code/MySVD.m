function [U,S,V]=MySVD(A)
    [x,y]=size(A);
    [U,S1]=eigs(A*A',x);
    [V,S2]=eigs(A'*A,y);
    S=zeros(x,y);
    if x>y
        S(1:y,1:y)=S2.^0.5;
        U(1:x,1:y)=A*V;
    else
        S(1:x,1:x)=S1.^0.5;
        V(1:y,1:x)=A'*U;
    end
    U=U./sum(U.*U).^0.5;
    V=V./sum(V.*V).^0.5;
end