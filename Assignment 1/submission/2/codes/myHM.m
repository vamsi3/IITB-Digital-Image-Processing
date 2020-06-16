function fimage = myHM()
    
    image=imread('../data/retina.png');
    imagem=imread('../data/retinaMask.png');
    refimage=imread('../data/retinaRef.png');
    refimagem=imread('../data/retinaRefMask.png');
    fimage=image;
    fimage(:,:,1)=histmatch(image(:,:,1),refimage(:,:,1),imagem,refimagem);
    fimage(:,:,2)=histmatch(image(:,:,2),refimage(:,:,2),imagem,refimagem);
    fimage(:,:,3)=histmatch(image(:,:,3),refimage(:,:,3),imagem,refimagem);
    
end


function histo=myimhist(image,mask)
    histo=zeros(256,1);
    [x,y]=size(image);
    for i=1:x
        for j=1:y
            if(mask(i,j)~=0)
                histo(image(i,j)+1)=1+histo(image(i,j)+1);
            end
        end 
    end
end

function fimage=histmatch(image,refimage,imagem,refimagem)
    myhist=myimhist(image,imagem);
    myrefhist=myimhist(refimage,refimagem);
    mycdf=cumsum(myhist)/sum(myhist);
    myrefcdf=cumsum(myrefhist)/sum(myrefhist);
    mapping=1:256;
    pointer = 1;
    for i= 1:256
        if pointer==256
            mapping(i)=pointer;
        else
            diff1=abs(mycdf(i)-myrefcdf(pointer));
            diff2=abs(mycdf(i)-myrefcdf(pointer+1));
            while diff1 >= diff2 && pointer ~= 255
                pointer=pointer+1;
                diff1=abs(mycdf(i)-myrefcdf(pointer));
                diff2=abs(mycdf(i)-myrefcdf(pointer+1));   
            end
            mapping(i)=pointer;
        end 
%     [~,index]=min(abs(myrefcdf-mycdf(i)));     Brute force way
%     mapping(i)=index;
    end
    fimage=image;
    [x,y]=size(image);
    for i=1:x
        for j=1:y
            if(imagem(i,j)~=0)
                fimage(i,j)=mapping(image(i,j)+1)-1;
            end
        end
    end
end