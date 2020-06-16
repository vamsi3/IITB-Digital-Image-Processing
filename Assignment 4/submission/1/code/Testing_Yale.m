function [X]=Testing_Yale()
    YaleDir = '../../CroppedYale';
    

    m=24*38;
    X=zeros(192*168,m);

    for i=1:39
        if(i==14) 
            continue;
        end
        files = dir(fullfile(YaleDir,strcat('yaleB',num2str(i,'%02.f')),'*.pgm'));
        ss = size(files,1);
        for j=41:ss
            temp=im2double(imread(fullfile(YaleDir,strcat('yaleB',num2str(i,'%02.f')),files(j).name)));
            if(i<14)
                X(:,(i-1)*24+j-40)=temp(:);
            else
                X(:,(i-2)*24+j-40)=temp(:);
            end
        end
    end
    
end