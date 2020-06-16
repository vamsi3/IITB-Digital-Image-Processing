function I = myLinearContrastStretching(image)
    
    M = im2double(imread(image));
    if(ndims(M)==3)
        I(:,:,1) = myLinearContrastStretching_n(M(:,:,1));
        I(:,:,2) = myLinearContrastStretching_n(M(:,:,2));
        I(:,:,3) = myLinearContrastStretching_n(M(:,:,3));
    else
        I = myLinearContrastStretching_n(M);
    end
    
end

function I = myLinearContrastStretching_n(M)
    
    
    a = min(M(:));
    b = max(M(:));
    I = uint8(255*(M-a)/(b-a));
    I = mat2gray(I);
    
end