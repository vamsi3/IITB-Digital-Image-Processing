function M = myCDF(I)
    
    H = imhist(I);
    M = zeros(1,256);
    
    M(1)=H(1);
    for i=2:256
        M(i)=M(i-1)+H(i);
    end
    
end