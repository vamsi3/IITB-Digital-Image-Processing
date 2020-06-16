function idealLowPassFilter(F,D,m,n)

    H = zeros(2*m,2*n);

    for u = -D:D
        for v = -D:D
            if u^2 + v^2 <= D^2
                H(u+m,v+n) = 1;
            end
        end
    end

    figure;
    imagesc(log(abs(H)+1));colorbar;
    title(sprintf("Ideal Low Pass filter with D = %f",D));
    
    NF = F.*H;
    PNI = real(ifft2(ifftshift(NF)));

    NI = PNI(m/2+1:m+m/2,n/2+1:n+n/2);
    
    figure;
    imagesc(NI);colormap(gray);
    title(sprintf("Image filtered with Ideal low pass filter with D = %f",D));    

end