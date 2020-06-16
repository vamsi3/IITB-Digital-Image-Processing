function gaussianLowPassFilter(F,sig,m,n)

    G = fspecial('gaussian',[2*m,2*n],sig);
    
    figure;
    imagesc(log(abs(G)+1));colorbar;
    title(sprintf("Gaussian low pass filter with sigma = %f",sig));
    
    NF = F.*G;

    PNI = real(ifft2(ifftshift(NF)));
    NI = PNI(m/2+1:m+m/2,n/2+1:n/2+n);
    
    figure;
    imagesc(NI);colormap(gray);
    title(sprintf("Image filtered with Gaussian low pass filter with sigma = %f",sig));

end