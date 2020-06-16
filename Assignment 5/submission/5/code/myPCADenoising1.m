function I2 = myPCADenoising1(I1,sig,s)
    
    [m,n] = size(I1);
    N = (m-s+1)*(n-s+1);
    P = zeros(s^2,N);

    for i = 1:(m-s+1)
        for j = 1:(n-s+1)
            P(:,(i-1)*(n-s+1)+j) = reshape(I1(i:i+s-1,j:j+s-1),[],1);
        end
    end

    [V,~] = eig(P*P');
    A = V'*P;
    A_bar = max(0,diag(A*A')/N-sig^2);
    B = (sig^2*(1./A_bar)+1);
    A_denoised = A./B;


    P = V*A_denoised;

    I2 = zeros(m,n);
    C2 = zeros(m,n);

    for i = 1:(m-s+1)
        for j = 1:(n-s+1)
            I2(i:i+s-1,j:j+s-1) = I2(i:i+s-1,j:j+s-1) + reshape(P(:,(i-1)*(n-s+1)+j),[s,s]);
            C2(i:i+s-1,j:j+s-1) = C2(i:i+s-1,j:j+s-1) + 1;
        end
    end

    I2 = I2./C2;

end