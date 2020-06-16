function rng = Range(i1,i2,j1,j2,n,s)
    X = zeros(i2-i1+1,j2-j1+1);
    X(:,1) = (i1-1:i2-1)*(n-s+1);
    Y = (j1:j2);
    for z = i1:i2
        X(z-i1+1,:) = X(z-i1+1,1)+Y;
    end
    rng = X(:);
end