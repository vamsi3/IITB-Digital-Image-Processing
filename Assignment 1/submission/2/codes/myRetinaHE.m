function image = myRetinaHE()

    image=imread('../data/retina.png');
    mask=imread('../data/retinaMask.png');
   
    [x,y,~]=size(image);
    
    
    for iter = 1:3
        histo=zeros(256,1);
        for i=1:x
            for j=1:y
                if(mask(i,j)~=0)
                    histo(image(i,j,iter)+1)=1+histo(image(i,j,iter)+1);
                end
            end 
        end
    
        cdf = cumsum(histo)/sum(histo);
        for i=1:x
            for j=1:y
                if(mask(i,j)~=0)
                    image(i,j,iter)=cdf(image(i,j,iter)+1)*255;
                end
            end 
        end
    end
     
end