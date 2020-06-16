function R = myUnsharpMasking(I,sig,k)
    I = load(I);
    I = I.imageOrig;
    I = I/max(I(:));
    subplot(1,2,1);
    imshow(I);
    title('Original');
    
    kernel = fspecial('gaussian',[2*round(3*sig)+1,2*round(3*sig)+1],sig);
    mask = I-imfilter(I,kernel,'symmetric');
    
    R = I + k*mask;
    
    Rmin = min(R(:));
    Rmax = max(R(:));
    R = (R - Rmin)*(1/(Rmax-Rmin));
    
    subplot(1,2,2);
    imshow(R);
    title('Sharpened');
end