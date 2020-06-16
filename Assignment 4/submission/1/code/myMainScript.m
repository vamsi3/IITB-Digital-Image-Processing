%please put the ORL and Yale folders in the 160050064_160050090_160050092/
%directory (The root directory of the submission)


tic;

%-------------------------------------ORLDdatabase-----------------------------------

%takes about 5 secs

Allk=[1, 2, 3, 5, 10, 15, 20, 30, 50, 75, 100, 150, 170];

[testX]=Testing_ORL();
ORLmain(Allk,'eig',testX);
figure;
ORLmain(Allk,'svd',testX);
figure;

%---------------------------------CroppedYaledatabase--------------------------------

%takes about 120 secs

Allk=[1, 2, 3, 5, 10, 15, 20, 30, 50, 60, 65, 75, 100, 200, 300, 500, 1000];

testX=Testing_Yale();
Yale_main(Allk,'svd',testX,0);   
figure;
Yale_main(Allk,'svd',testX,1);   

toc;