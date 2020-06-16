%% MyMainScript

tic;
%% Your code here
img=load('../data/image_low_frequency_noise.mat');
img=img.Z;
[X,Y]=size(img);
fft = fftshift(fft2(img,2*X,2*Y));
absfft = log(abs(fft)+1);
figure,imshow(absfft,[-1 18]);
colormap (jet); colorbar; %% (237,247) and (277,267) are noise
title('log magnitude of its Fourier transform')
threshold=4;
for i=1:2*X
    for j=1:2*Y
        if (i-237)^2+(j-247)^2 < threshold
            fft(i,j)=0;
        end
        if (i-277)^2+(j-267)^2 < threshold
            fft(i,j)=0;
        end
    end
end
figure;
imshow(img,[]);
title('Original')
imfft = real(ifft2(ifftshift(fft)));
figure;
imshow(imfft(1:X,1:Y),[]);
title('After filtering')
toc;
