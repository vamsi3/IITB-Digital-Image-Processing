%The idea here is taken from:
%https://arxiv.org/pdf/1705.02782.pdf

%please put the ORL and Yale folders in the 160050064_160050090_160050092/
%directory (The root directory of the submission)


Allk=[1, 2, 3, 5, 10, 15, 20, 30, 50, 75, 100, 150, 170];

[testX,U]=Testing_ORL();
ORLmain(Allk,'eig',testX,U);