function I = mySpecialCDF(M,a)
    
    H = imhist(M);
    m = max(H(:));
    
    extra = 0;
    for i = 1:256
        if( H(i) > m*a )
            extra = extra + H(i) - m*a;
            H(i) = m*a;
        end
    end
    
    H = H + extra/256;
    
    I = zeros(1,256);
    I(1) = H(1);
    for i=2:256
        I(i) = I(i-1)+H(i);
    end
    
end