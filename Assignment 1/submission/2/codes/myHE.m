function I = myHE(image)
    
    M = imread(image);
    if(ndims(M)==3)
        I(:,:,1) = myHE_n(M(:,:,1));
        I(:,:,2) = myHE_n(M(:,:,2));
        I(:,:,3) = myHE_n(M(:,:,3));
    else
        I = myHE_n(M);
    end
    
end


function I = myHE_n(M)

    cdfM = myCDF(M);
    I = uint8(255*cdfM(M+1)/cdfM(256));
       
end