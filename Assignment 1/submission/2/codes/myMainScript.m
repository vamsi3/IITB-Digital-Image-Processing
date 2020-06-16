tic;

myNumOfColors = 200;
myColorScale = [(0:1/(myNumOfColors-1):1)',(0:1/(myNumOfColors-1):1)',(0:1/(myNumOfColors-1):1)'];


i = 0;
h = waitbar(0,'Assignment1-Part2');

I1 = '../data/barbara.png';
figure(1),imshow(I1);
title('barbara-original');
colorbar;

I2 = '../data/TEM.png';
figure(2),imshow(I2);
title('TEM-original');
colorbar;

I3 = '../data/canyon.png';
figure(3),imshow(I3);
title('canyon-original');

i = i + 0.02;
waitbar(i);


TEM_lcs = myLinearContrastStretching('../data/TEM.png');
figure(4),imagesc(TEM_lcs);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('TEM linear-contrast-stretching');
save('../Report/Images/TEM_lcs.mat','TEM_lcs');

colorbar;
barbara_lcs = myLinearContrastStretching('../data/barbara.png');
figure(5),imagesc(barbara_lcs);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('barbara linear-contrast-stretching');
colorbar;

save('../Report/Images/barbara_lcs.mat','barbara_lcs');
canyon_lcs = myLinearContrastStretching('../data/canyon.png');
figure(6),imagesc(canyon_lcs);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('canyon linear-contrast-stretching');
save('../Report/Images/canyon_lcs.mat','canyon_lcs');

i = i + 0.02;
waitbar(i);

%----------------------------------------------------------------------------------------------

% Canyon CLAHE
% Medium one followed by the one with alpha halved

canyon_clahe = myCLAHE('../data/canyon.png',75,0.4);
figure(7),imagesc(canyon_clahe);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('canyon CLAHE ws=75 a=0.4');
save('../Report/Images/canyon_clahe.mat','canyon_clahe');

i = i + 0.05;
waitbar(i);

canyon_clahe_h = myCLAHE('../data/canyon.png',75,0.2);
figure(8),imagesc(canyon_clahe_h);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('canyon CLAHE ws=75 a=0.2');
save('../Report/Images/canyon_clahe_h.mat','canyon_clahe_h');

i = i + 0.05;
waitbar(i);

%----------------------------------------------------------------------------------------------

% barbara CLAHE
% Medium one followed by the one with alpha halved

barbara_clahe = myCLAHE('../data/barbara.png',75,0.2);
figure(9),imagesc(barbara_clahe);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('barbara CLAHE ws=75 a=0.2');
colorbar;

save('../Report/Images/barbara_clahe.mat','barbara_clahe');
i = i + 0.05;
waitbar(i);

barbara_clahe_h = myCLAHE('../data/barbara.png',75,0.1);
figure(10),imagesc(barbara_clahe_h);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('barbara CLAHE ws=75 a=0.1');
colorbar;
save('../Report/Images/barbara_clahe_h.mat','barbara_clahe_h');

i = i + 0.05;
waitbar(i);


%----------------------------------------------------------------------------------------------

% TEM CLAHE
% Medium one followed by the one with alpha halved

TEM_clahe = myCLAHE('../data/TEM.png',75,0.3);
figure(11),imagesc(TEM_clahe);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('TEM CLAHE ws=75 a=0.3');
colorbar;

save('../Report/Images/TEM_clahe.mat','TEM_clahe');

i = i + 0.05;
waitbar(i);

TEM_clahe_h = myCLAHE('../data/TEM.png',75,0.15);
figure(12),imagesc(TEM_clahe_h);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('TEM CLAHE ws=75 a=0.15');
colorbar;

save('../Report/Images/TEM_clahe_h.mat','TEM_clahe_h');
i = i + 0.05;
waitbar(i);

%----------------------------------------------------------------------------------------------

% Canyon AHE
% Medium one followed by large and small window sizes

canyon_ahe = myAHE('../data/canyon.png',75);
figure(13),imagesc(canyon_ahe);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('canyon AHE ws=75');

save('../Report/Images/canyon_ahe.mat','canyon_ahe');
i = i + 0.05;
waitbar(i);

canyon_ahe_large = myAHE('../data/canyon.png',200);
figure(14),imagesc(canyon_ahe_large);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('canyon AHE ws=200');
save('../Report/Images/canyon_ahe_large.mat','canyon_ahe_large');

i = i + 0.05;
waitbar(i);

canyon_ahe_small = myAHE('../data/canyon.png',30);
figure(15),imagesc(canyon_ahe_small);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('canyon AHE ws=30');

save('../Report/Images/canyon_ahe_small.mat','canyon_ahe_small');
i = i + 0.05;
waitbar(i);

%----------------------------------------------------------------------------------------------

% barbara AHE
% Medium one followed by large and small window sizes

barbara_ahe = myAHE('../data/barbara.png',75);
figure(16),imagesc(barbara_ahe);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('barbara AHE ws=75');
colorbar;

save('../Report/Images/barbara_ahe.mat','barbara_ahe');
i = i + 0.05;
waitbar(i);

barbara_ahe_large = myAHE('../data/barbara.png',200);
figure(17),imagesc(barbara_ahe_large);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('barbara AHE ws=200');
colorbar;

save('../Report/Images/barbara_ahe_large.mat','barbara_ahe_large');
i = i + 0.05;
waitbar(i);

barbara_ahe_small = myAHE('../data/barbara.png',30);
figure(18),imagesc(barbara_ahe_small);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('barbara AHE ws=30');
colorbar;

save('../Report/Images/barbara_ahe_small.mat','barbara_ahe_small');
i = i + 0.05;
waitbar(i);

%----------------------------------------------------------------------------------------------

% TEM AHE
% Medium one followed by large and small window sizes

TEM_ahe = myAHE('../data/TEM.png',75);
figure(19),imagesc(TEM_ahe);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('TEM AHE ws=75');
colorbar;

save('../Report/Images/TEM_ahe.mat','TEM_ahe');
i = i + 0.05;
waitbar(i);

TEM_ahe_large = myAHE('../data/TEM.png',200);
figure(20),imagesc(TEM_ahe_large);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('TEM AHE ws=200');
colorbar;

save('../Report/Images/TEM_ahe_large.mat','TEM_ahe_large');

i = i + 0.05;
waitbar(i);

TEM_ahe_small = myAHE('../data/TEM.png',30);
figure(21),imagesc(TEM_ahe_small);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('TEM AHE ws=30');
colorbar;

save('../Report/Images/TEM_ahe_small.mat','TEM_ahe_small');

i = i + 0.05;
waitbar(i);


%----------------------------------------------------------------------------------------------

% Canyon HE

canyon_he = myHE('../data/canyon.png');
figure(22),imagesc(canyon_he);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('canyon HE');

save('../Report/Images/canyon_he.mat','canyon_he');

i = i + 0.05;
waitbar(i);

%----------------------------------------------------------------------------------------------

% barbara HE

barbara_he = myHE('../data/barbara.png');
figure(23),imagesc(barbara_he);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('barbara HE');
colorbar;

save('../Report/Images/barbara_he.mat','barbara_he');
i = i + 0.05;
waitbar(i);

%----------------------------------------------------------------------------------------------

% TEM HE

TEM_he = myHE('../data/TEM.png');
figure(24),imagesc(TEM_he);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('TEM HE');
colorbar;

save('../Report/Images/TEM_he.mat','TEM_he');
i = i + 0.05;
waitbar(i);

%----------------------------------------------------------------------------------------------

% Church HE

church_he = myHE('../data/church.png');
figure(25),imagesc(church_he);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('Church HE');
colorbar;

save('../Report/Images/church_he.mat','church_he');
i = i + 0.02;
waitbar(i);

%----------------------------------------------------------------------------------------------

% retina HE done only in the mask region
retina_HE = myRetinaHE();
figure(26),imagesc(retina_HE);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('retina HE');
save('../Report/Images/retina_he.mat','retina_HE');


% retina HM
% Original one followed by Reference and Histogram matched

I1 = '../data/retina.png';
figure(27),imshow(I1);
title('retina-original');


I1 = '../data/retinaRef.png';
figure(28),imshow(I1);
title('retina-reference');


retina_HM = myHM();
figure(29),imagesc(retina_HM);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('retina histogram matched');
save('../Report/Images/retina_hm.mat','retina_HM');

i = i+0.2;
waitbar(i);

%----------------------------------------------------------------------------------------------

% Church Linear Contrast Stretching
church_lcs = myLinearContrastStretching('../data/church.png');
figure(30),imagesc(church_lcs);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('Church linear-contrast-stretching');
save('../Report/Images/church_lcs.mat','church_lcs');

i = i+0.2;
waitbar(i);


close(h) 

toc;