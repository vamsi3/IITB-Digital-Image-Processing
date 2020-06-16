function I = myBilinearInterpolation(image)
    M = imread(image);
    [m,n] = size(M);
    I = zeros(3*m-2,2*n-1);
    
    I(1:3:end,1:2:end) = M;
    
    for i = 2:2:2*n-1
        I(:,i) = (I(:,i-1)+I(:,i+1))/2;
    end
    
    for i = 2:3:3*m-2
        I(i,:) = (2*I(i-1,:)+I(i+2,:))/3;
        I(i+1,:) = (I(i-1,:)+2*I(i+2,:))/3;
    end
    I = mat2gray(I);
end