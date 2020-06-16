function rmse = RMSE(I1,I2)
    J1 = (I1-I2).^2;
    J2 = I1(:);
    J1 = sum(J1(:));
    J2 = sum(J2.^2);
    rmse = J1/J2;
end