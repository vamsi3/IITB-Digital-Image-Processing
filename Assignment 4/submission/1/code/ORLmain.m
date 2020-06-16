function ORLmain(Allk,type,testX)
    AllAcc=zeros(size(Allk));
    
    [V,X,meanX]=Training_ORL(type);
    
    for p=1:size(Allk,2)
        k=Allk(p);
        nV=V(:,1:k);
        eigCoeffs=nV'*X;
        acc=0;
        for i=1:size(testX,2)
            temp=testX(:,i);
            temp=temp-meanX;
            tempCoeffs=nV'*temp;
            [~,pos]=min(sum((eigCoeffs-tempCoeffs).^2,1));
            foundi=floor((pos-1)/6)+1;
            testi=floor((i-1)/4)+1;
            if(foundi==testi)
                acc=acc+1;
            end
        end
        AllAcc(p)=100*acc/size(testX,2);
    end

    plot(Allk,AllAcc);
    title(strcat('Recognition Rate vs. k on ORL database using',{' '},type));
    xlabel('k');
    ylabel('Recognition Rate');

end