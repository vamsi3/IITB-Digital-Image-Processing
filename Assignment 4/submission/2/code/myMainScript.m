%please put the ORL and Yale folders in the 160050064_160050090_160050092/
%directory (The root directory of the submission)

tic;

Allk=[2, 10, 20, 50, 75, 100, 125, 150, 175];

[eigVectors,X,meanX]=Training_Yale('eig');
eigCoeffs=eigVectors'*X;

num=10;
temp=X(:,num);
imagesc(reshape(temp,192,168));colormap('gray');
set(gca,'xtick',[]);
set(gca,'ytick',[])
title('Original Image');
daspect([8,7,1]);

figure;

for i=Allk
    temp=zeros(192*168,1);
    for j=1:i
        temp=temp+eigVectors(:,j)*eigCoeffs(j,num);
    end
    imagesc(reshape(temp,192,168));colormap('gray');
    set(gca,'xtick',[]);
    set(gca,'ytick',[])
    title(sprintf('Constructed using top %d eigenvectors',i));
    daspect([8,7,1]);
    figure;
end

for i=1:25
    subplot(5,5,i);
    temp=reshape(eigVectors(:,i),192,168);
    imagesc(reshape(eigVectors(:,i),192,168));colormap('gray');
    daspect([8,7,1]);
    set(gca,'xtick',[]);
    set(gca,'ytick',[])
    title(sprintf('Top %d',i));
end

toc;