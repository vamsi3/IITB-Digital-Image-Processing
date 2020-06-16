tic;
%--------------------------------honeyComb---------------------------------
I = im2double(imread('../data/honeyCombReal.png'));
subplot(1,3,1);imshow(mat2gray(I));title('Original');
corrupted_I = load('../data/honeyCombReal_Noisy.mat');
image = corrupted_I.imgCorrupt;
subplot(1,3,2);
imshow(image);title('NoiseImage');

optWeightSigma = 0.481;

waitbar(0,'PatchBasedFiltering for honeyComb');
res = myPatchBasedFiltering(image,optWeightSigma);
save('../images/honeyCombFiltered.mat','res');

RMSD = myRMSD(I,res);
disp(['RMSD of honeyComb is ',num2str(RMSD)]);

figure;

imshow(fspecial('gaussian', 9, 2.5));title('PatchGaussianMask');

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
corrupted_I = load('../data/honeyCombReal_Noisy.mat');
image = corrupted_I.imgCorrupt;
subplot(1,3,2);
imshow(image);title('NoiseImage');

waitbar(0,'PatchBasedFiltering for honeyComb');
res = myPatchBasedFiltering(image,0.9*optWeightSigma);

RMSD = myRMSD(I,res);
disp(['RMSD of honeyComb (0.9*optWeightSigma) is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
corrupted_I = load('../data/honeyCombReal_Noisy.mat');
image = corrupted_I.imgCorrupt;
subplot(1,3,2);
imshow(image);title('NoiseImage');

waitbar(0,'PatchBasedFiltering for honeyComb');
res = myPatchBasedFiltering(image,1.1*optWeightSigma);

RMSD = myRMSD(I,res);
disp(['RMSD of honeyComb (1.1*optWeightSigma) is ',num2str(RMSD)]);

figure;


%----------------------------------grass-----------------------------------
I = im2double(imread('../data/grass.png'));
subplot(1,3,1);imshow(mat2gray(I));title('Original');
corrupted_I = load('../data/grassNoisy.mat');
image = corrupted_I.imgCorrupt;
subplot(1,3,2);
imshow(image);title('NoiseImage');

optWeightSigma = 0.857;

waitbar(0,'PatchBasedFiltering for grass');
res = myPatchBasedFiltering(image,optWeightSigma);
save('../images/grassFiltered.mat','res');

RMSD = myRMSD(I,res);
disp(['RMSD of grass (optWeightSigma) is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
corrupted_I = load('../data/grassNoisy.mat');
image = corrupted_I.imgCorrupt;
subplot(1,3,2);
imshow(image);title('NoiseImage');

waitbar(0,'PatchBasedFiltering for grass');
res = myPatchBasedFiltering(image,0.9*optWeightSigma);

RMSD = myRMSD(I,res);
disp(['RMSD of grass 0.9*(optWeightSigma) is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
corrupted_I = load('../data/grassNoisy.mat');
image = corrupted_I.imgCorrupt;
subplot(1,3,2);
imshow(image);title('NoiseImage');

waitbar(0,'PatchBasedFiltering for grass');
res = myPatchBasedFiltering(image,1.1*optWeightSigma);

RMSD = myRMSD(I,res);
disp(['RMSD of grass 1.1*(optWeightSigma) is ',num2str(RMSD)]);

figure;


%----------------------------------barbara---------------------------------

imageData = load('../data/barbara.mat');
image = imageData.imageOrig;
image = image/max(image(:));
noise = 0.05*randn(size(image));
subplot(1,3,1);imshow(image);title('Original');

im = imgaussfilt(image+noise,0.66);
newim = im(1:2:end,1:2:end);
subplot(1, 3, 2);
imshow(newim);title('NoiseImage');

optWeightSigma = 0.25;

waitbar(0,'PatchBasedFiltering for barbara');
res = myPatchBasedFiltering(newim,optWeightSigma);
save('../images/barbaraFiltered.mat','res');

RMSD = myRMSD(image(1:2:end,1:2:end),res);
disp(['RMSD of barbara is ',num2str(RMSD)]);

figure;

image = imageData.imageOrig;
image = image/max(image(:));
noise = 0.05*randn(size(image));
subplot(1,3,1);imshow(image);title('Original');

im = imgaussfilt(image+noise,0.66);
newim = im(1:2:end,1:2:end);
subplot(1, 3, 2);
imshow(newim);title('NoiseImage');


waitbar(0,'PatchBasedFiltering for barbara');
res = myPatchBasedFiltering(newim,0.9*optWeightSigma);

RMSD = myRMSD(image(1:2:end,1:2:end),res);
disp(['RMSD of barbara 0.9*(optWeightSigma) is ',num2str(RMSD)]);

figure;

image = imageData.imageOrig;
image = image/max(image(:));
noise = 0.05*randn(size(image));
subplot(1,3,1);imshow(image);title('Original');

im = imgaussfilt(image+noise,0.66);
newim = im(1:2:end,1:2:end);
subplot(1, 3, 2);
imshow(newim);title('NoiseImage');


waitbar(0,'PatchBasedFiltering for barbara');
res = myPatchBasedFiltering(newim,1.1*optWeightSigma);

RMSD = myRMSD(image(1:2:end,1:2:end),res);
disp(['RMSD of barbara 1.1*(optWeightSigma) is ',num2str(RMSD)]);


toc;
