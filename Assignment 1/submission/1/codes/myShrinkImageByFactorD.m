function M = myShrinkImageByFactorD(image,d)
    M = imread(image);
    M = M(d:d:end,d:d:end);
    M = mat2gray(M);
end