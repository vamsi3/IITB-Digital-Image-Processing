function [V,X,meanX] = Training_ORL(method)
    ORLDir = '../../att_faces';
    cd(ORLDir);

    m=32*6;
    X=zeros(92*112,m);

    for i=1:32
        cd(sprintf('s%d',i));
        for j=1:6
            temp=im2double(imread(sprintf('%d.pgm',j)));
            X(:,(i-1)*6+j)=temp(:);
        end
        cd('../');
    end
    meanX=mean(X,2);
    X=X-meanX;
    
    if(strcmp(method,'eig'))
        L=X'*X;
        [eigVectors,eigValues]=eig(L);
        eigVectors=X*eigVectors;
        eigVectors=normc(eigVectors);

        eigValues=diag(eigValues);
        [~,ind]=sort(eigValues,'descend');

        eigVectors=eigVectors(:,ind);
    else
        if(strcmp(method,'svd'))
            [U,S,~]=svd(X);
            [~,ind] = sort(diag(S), 'descend');
            eigVectors=U(:,ind);
            eigVectors=normc(eigVectors);
        end
    end
    V=eigVectors;
    cd('../1/code');
end
