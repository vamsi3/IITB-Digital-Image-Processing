function I2 = myPCADenoising2(I1,sig,s,s1,K)

    [m,n] = size(I1);
    N = (m-s+1)*(n-s+1);

    P = zeros(s^2,N);
    P_com = zeros(s^2,N);

    for i = 1:(m-s+1)
        for j = 1:(n-s+1)
            P(:,(i-1)*(n-s+1)+j) = reshape(I1(i:i+s-1,j:j+s-1),[],1);
        end
    end

    for i = 1:m-s+1
        for j = 1:n-s+1
            R = Range(max(1,i-s1), min(m-s+1,i+s1), max(1,j-s1), min(n-s+1,j+s1),n,s);
            Q = P(:,R);

            [In,~] = knnsearch(Q',P(:,(i-1)*(n-s+1)+j)','K',K);
            Q = Q(:,In);

            [V,~] = eig(Q*Q');
            A = V'*Q;

            A_bar = max(0,diag(A*A')/(size(Q,2))-sig^2);
            B = (sig^2*(1./A_bar)+1);
            A_denoised = A(:,1)./B;

            P_com(:,(i-1)*(n-s+1)+j) = V*A_denoised;
        end
    end


    I2 = zeros(m,n);
    C2 = zeros(m,n);

    for i = 1:(m-s+1)
        for j = 1:(n-s+1)
            I2(i:i+s-1,j:j+s-1) = I2(i:i+s-1,j:j+s-1) + reshape(P_com(:,(i-1)*(n-s+1)+j),[s,s]);
            C2(i:i+s-1,j:j+s-1) = C2(i:i+s-1,j:j+s-1) + 1;
        end
    end

    I2 = I2./C2;

end