function Yale_main(Allk,method,testX,do)
    AllAcc=zeros(size(Allk));
    
    [V,X,meanX]=Training_Yale(method);

    for p=1:size(Allk,2)
        k=Allk(p);
        nV=V(:,1:k);
        eigCoeffs=nV'*X;
        acc=0;
        for i=1:size(testX,2)
            temp=testX(:,i);
            %imshow(reshape(temp,192,168));
            temp=temp-meanX;
            tempCoeffs=nV'*temp;
            if(do==0)
                [~,pos]=min(sum((eigCoeffs-tempCoeffs).^2,1));
            else
                [~,pos]=min(sum((eigCoeffs(4:end,:)-tempCoeffs(4:end,:)).^2,1));
            end
            %disp([pos, i]);
            foundi=floor((pos-1)/40)+1;
            testi=floor((i-1)/24)+1;
            if(foundi==testi)
                acc=acc+1;
            end
        end
        AllAcc(p)=100*acc/size(testX,2);
        disp(p);
    end

    plot(Allk,AllAcc);
    if(do==0)
        title(strcat('Recognition Rate vs. k on CroppedYale database using all eigen vectors'));
    else
        title(strcat('Recognition Rate vs. k on CroppedYale database using all except top 3 eigen vectors'));
    end
    xlabel('k');
    ylabel('Recognition Rate');

end