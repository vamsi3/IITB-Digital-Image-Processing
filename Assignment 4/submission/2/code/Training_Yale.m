function [eigVectors,OX,meanX] = Training_Yale(method)
    YaleDir = '../../CroppedYale/';
    

    m=38*40;
    X=zeros(192*168,m);

    for i=1:39
        if(i==14) 
            continue;
        end
        files = dir(fullfile(YaleDir,strcat('yaleB',num2str(i,'%02.f')),'*.pgm'));
        for j=1:40
            temp=im2double(imread(fullfile(YaleDir,strcat('yaleB',num2str(i,'%02.f')),files(j).name)));
            if(i<14)
                X(:,(i-1)*40+j)=temp(:);
            else
                X(:,(i-2)*40+j)=temp(:);
            end
        end
    end
    meanX=mean(X,2);
    OX=X;
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
            [U,S,~]=svd(X,'econ');
            [~,ind] = sort(diag(S), 'descend');
            eigVectors=U(:,ind);
            eigVectors=normc(eigVectors);
        end
    end
end