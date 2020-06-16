A = [1 2; 3 4; 5 6; 7 8];
A = double(A);

[U1,S1,V1] = MySVD(A);
[U,S,V] = svd(A);

B = U*S*V';

%A and B are equal. Can be checked by viewing the matrices