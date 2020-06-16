tic;

myNumOfColors = 200;
myColorScale = [(0:1/(myNumOfColors-1):1)',(0:1/(myNumOfColors-1):1)',(0:1/(myNumOfColors-1):1)'];


i = 0;
h = waitbar(0,'Assignment1-Part1');
I1 = '../data/circles_concentric.png';
figure(1),imshow(I1);
colormap (myColorScale);
daspect ([1 1 1]);
title('circles-concentric');
axis tight;


circles_d2 = myShrinkImageByFactorD('../data/circles_concentric.png',2);
figure(2),imshow(circles_d2);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
colorbar;
title('circles-concentric d=2');
i = i + 1;
waitbar(i/4);


circles_d3 = myShrinkImageByFactorD('../data/circles_concentric.png',3);
figure(3),imshow(circles_d3);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('circles-concentric d=3');
colorbar;
i = i + 1;
waitbar(i/4);

I2 = '../data/barbaraSmall.png';
figure(4),imshow(I2);
colormap (myColorScale);
daspect ([1 1 1]);
title('barbaraSmall');
axis tight;
colorbar;

barbaraSmall_nni = myNearestNeighborInterpolation('../data/barbaraSmall.png');
figure(5),imshow(barbaraSmall_nni);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('barbaraSmall nearest neighbour interpolation');
colorbar;
i = i + 1;
waitbar(i/4);

barbaraSmall_bi = myBilinearInterpolation('../data/barbaraSmall.png');
figure(6),imshow(barbaraSmall_bi);
colormap (myColorScale);
daspect ([1 1 1]);
axis tight;
title('barbaraSmall bilinear interpolation');
colorbar;
i = i + 1;
waitbar(i/4);
close(h);

toc;
