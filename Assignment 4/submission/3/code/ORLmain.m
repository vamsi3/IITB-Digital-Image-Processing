function ORLmain(Allk,type,testX,Unknown)
    FN=zeros(size(Allk));
    FP=zeros(size(Allk));
    
    [V,X,meanX]=Training_ORL(type);
    
    for p=1:size(Allk,2)
        k=Allk(p);
        nV=V(:,1:k);
        eigCoeffs=nV'*X;
        
        max_dist=0;
        for i=1:size(eigCoeffs,2)
            for j=1:size(eigCoeffs,2)
                dist=sum((eigCoeffs(:,i)-eigCoeffs(:,j)).^2);
                max_dist=max(max_dist,dist);
            end
        end
        threshold=max_dist/12;
        fp=0;
        fn=0;
        
        for i=1:size(testX,2)
            temp=testX(:,i);
            temp=temp-meanX;
            tempCoeffs=nV'*temp;
            [val,~]=min(sum((eigCoeffs-tempCoeffs).^2,1));
            if(val>=threshold)
                fp=fp+1;
            end
        end
        FP(p)=100*fp/size(testX,2);

        for i=1:size(Unknown,2)
            temp=Unknown(:,i);
            temp=temp-meanX;
            tempCoeffs=nV'*temp;
            [val,~]=min(sum((eigCoeffs-tempCoeffs).^2,1));
            if(val<threshold)
                fn=fn+1;
            end
        end
        FN(p)=100*fn/size(Unknown,2);
    
    end

    plot(Allk,FP,Allk,FN);
    title('False Positives and False Negatives Vs. k');
    xlabel('k');
    ylabel('percentage');

end