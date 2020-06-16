%The results from ideal low pass filters have ringing artifacts as the
%inverse fourier transform of the jinc function (which is a 2d version of sinc function)
%is the ideal low pass filter. Since it contains peaks of rings the
%resulting image too will contain the ringing artifacts


tic;

I = double(imread('../data/barbara256.png'));
[m,n] = size(I);

PI = padarray(I,[m/2,n/2]);
F = fftshift(fft2(PI));

figure;
imagesc(log(abs(F)+1));colorbar;
title(sprintf("Magnitude of Image in freq. domain"));

idealLowPassFilter(F,40,m,n);
idealLowPassFilter(F,80,m,n);

gaussianLowPassFilter(F,40,m,n);
gaussianLowPassFilter(F,80,m,n);

toc;