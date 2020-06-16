function I = myAHE(image,n)
    
    M = imread(image);
    I = zeros(size(M));
    if(ndims(M)==3)
        I(:,:,1) = myAHE_n(M(:,:,1),n);
        I(:,:,2) = myAHE_n(M(:,:,2),n);
        I(:,:,3) = myAHE_n(M(:,:,3),n);
    else
        I = myAHE_n(M,n);
    end
    
end

function I = myAHE_n(M, n)
   
    d = round((n-1)/2);
    I = zeros(size(M));
    [sx,sy] = size(M);
    
    for i = 1:sx
        xi = max(1,i-d):min(sx,i+d);
        for j = 1:sy
            xj = max(1,j-d):min(sy,j+d);
            Temp = M(xi,xj);
            cdfTemp = myCDF(Temp);
            I(i,j) = uint8(255*cdfTemp(M(i,j)+1)/cdfTemp(256));
        end
    end
    
    I = mat2gray(I);
    
end