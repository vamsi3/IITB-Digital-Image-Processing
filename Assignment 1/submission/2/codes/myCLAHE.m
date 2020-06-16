function I = myCLAHE(image,n,a)
    
    M = imread(image);
    I = zeros(size(M));
    if(ndims(M)==3)
        I(:,:,1) = myCLAHE_n(M(:,:,1),n,a);
        I(:,:,2) = myCLAHE_n(M(:,:,2),n,a);
        I(:,:,3) = myCLAHE_n(M(:,:,3),n,a);
    else
        I = myCLAHE_n(M,n,a);
    end
    
end

function I = myCLAHE_n(M,n,a)
   
    I = zeros(size(M));
    [sx,sy] = size(M);
    d = round((n-1)/2);
    
    for i = 1:sx
        xi = max(1,i-d):min(sx,i+d);
        for j = 1:sy
            xj = max(1,j-d):min(sy,j+d);
            Temp = M(xi,xj);
            cdfTemp = mySpecialCDF(Temp,a);
            I(i,j) = uint8(255*cdfTemp(M(i,j)+1)/cdfTemp(256));
        end
    end
    
    I=mat2gray(I);
    
end