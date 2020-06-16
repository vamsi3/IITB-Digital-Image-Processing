function filt_I = myBilateralFiltering(corrupted_I,sig_S,sig_I)
    
    W = 2*round(2*sig_S)+1;
    
    [size_x,size_y] = size(corrupted_I);
    
    filt_I = zeros(size(corrupted_I));
    
    half_W = round((W-1)/2);
    weights_S = fspecial('gaussian',W,sig_S);
    
    denominator = padarray(ones(size(corrupted_I)),[half_W, half_W]);
    corrupted_I = padarray(corrupted_I,[half_W, half_W]);
    
    
    for i=half_W+1:size_x + half_W
        for j=half_W+1:size_y + half_W
            
            patch = corrupted_I(i-half_W:i+half_W, j-half_W:j+half_W);
            weights_I = normpdf(patch-corrupted_I(i,j),0,sig_I);
            
            weights = weights_I.*weights_S;
            temp1 = patch.*weights;
            temp2 = denominator(i-half_W:i+half_W, j-half_W:j+half_W).*weights;
            
            filt_I(i-half_W,j-half_W) = sum(temp1(:))/sum(temp2(:));
            
        end
    end
end
