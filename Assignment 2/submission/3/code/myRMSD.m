function RMSD = myRMSD(im1,im2)
    D = im1 - im2;
    D = D.^2;
    [size_x,size_y]=size(D);
    RMSD = double(sqrt(sum(D(:))/(size_x*size_y)));
end