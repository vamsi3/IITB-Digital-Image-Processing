tic;

%----------------------------------barbara---------------------------------

I = load('../data/barbara.mat');
I = I.imageOrig;
I = I/max(I(:));

subplot(1,3,1);imshow(mat2gray(I));title('Original');
noise = 0.05*randn(size(I));
corrupted_I = I+noise;

optS = 1;optI = 1;

RMSD = myBilateralFiltering(I,corrupted_I,optS,optI);

disp(['RMSD of barbara is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
noise = 0.05*randn(size(I));
corrupted_I = I+noise;

RMSD = myBilateralFiltering(I,corrupted_I,0.9*optS,optI);

disp(['RMSD of barbara (0.9*optSigS and optSigI) is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
noise = 0.05*randn(size(I));
corrupted_I = I+noise;

RMSD = myBilateralFiltering(I,corrupted_I,1.1*optS,optI);

disp(['RMSD of barbara (1.1*optSigS and optSigI) is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
noise = 0.05*randn(size(I));
corrupted_I = I+noise;

RMSD = myBilateralFiltering(I,corrupted_I,optS,0.9*optI);

disp(['RMSD of barbara (optSigS and 0.9*optSigI) is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
noise = 0.05*randn(size(I));
corrupted_I = I+noise;

RMSD = myBilateralFiltering(I,corrupted_I,optS,1.1*optI);

disp(['RMSD of barbara (optSigS and 1.1*optSigI) is ',num2str(RMSD)]);
figure;

%-----------------------------------grass----------------------------------

I = im2double(imread('../data/grass.png'));
subplot(1,3,1);imshow(mat2gray(I));title('Original');
load('../data/grassNoisy.mat');
corrupted_I = imgCorrupt;

optS = 1;optI = 1;

RMSD = myBilateralFiltering(I,corrupted_I,optS,optI);
disp(['RMSD of grass is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
load('../data/grassNoisy.mat');
corrupted_I = imgCorrupt;

RMSD = myBilateralFiltering(I,corrupted_I,0.9*optS,optI);
disp(['RMSD of grass (0.9*optS and optI)is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
load('../data/grassNoisy.mat');
corrupted_I = imgCorrupt;

RMSD = myBilateralFiltering(I,corrupted_I,1.1*optS,optI);
disp(['RMSD of grass (1.1*optS and optI)is ',num2str(RMSD)]);

figure;


subplot(1,3,1);imshow(mat2gray(I));title('Original');
load('../data/grassNoisy.mat');
corrupted_I = imgCorrupt;

RMSD = myBilateralFiltering(I,corrupted_I,optS,0.9*optI);
disp(['RMSD of grass (optS and 0.9*optI)is ',num2str(RMSD)]);

figure;


subplot(1,3,1);imshow(mat2gray(I));title('Original');
load('../data/grassNoisy.mat');
corrupted_I = imgCorrupt;

RMSD = myBilateralFiltering(I,corrupted_I,optS,1.1*optI);
disp(['RMSD of grass (optS and 1.1*optI)is ',num2str(RMSD)]);

figure;

%-----------------------------------honeyCombReal----------------------------------

I = im2double(imread('../data/honeyCombReal.png'));
subplot(1,3,1);imshow(mat2gray(I));title('Original');
corrupted_I = load('../data/honeyCombReal_Noisy.mat');
corrupted_I = corrupted_I.imgCorrupt;

optS = 1;optI = 1;

RMSD = myBilateralFiltering(I,corrupted_I,optS,optI);

disp(['RMSD of honeyComb is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
corrupted_I = load('../data/honeyCombReal_Noisy.mat');
corrupted_I = corrupted_I.imgCorrupt;


RMSD = myBilateralFiltering(I,corrupted_I,0.9*optS,optI);

disp(['RMSD of honeyComb (0.9*optS and optI) is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
corrupted_I = load('../data/honeyCombReal_Noisy.mat');
corrupted_I = corrupted_I.imgCorrupt;


RMSD = myBilateralFiltering(I,corrupted_I,1.1*optS,optI);

disp(['RMSD of honeyComb (1.1*optS and optI) is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
corrupted_I = load('../data/honeyCombReal_Noisy.mat');
corrupted_I = corrupted_I.imgCorrupt;


RMSD = myBilateralFiltering(I,corrupted_I,optS,0.9*optI);

disp(['RMSD of honeyComb (optS and 0.9*optI) is ',num2str(RMSD)]);

figure;

subplot(1,3,1);imshow(mat2gray(I));title('Original');
corrupted_I = load('../data/honeyCombReal_Noisy.mat');
corrupted_I = corrupted_I.imgCorrupt;


RMSD = myBilateralFiltering(I,corrupted_I,optS,1.1*optI);

disp(['RMSD of honeyComb (optS and 1.1*optI) is ',num2str(RMSD)]);


toc;
