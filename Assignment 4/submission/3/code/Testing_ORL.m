function [X, Unknown]=Testing_ORL()
    ORLDir = '../../att_faces';
    cd(ORLDir);

    m=32*4;
    X=zeros(92*112,m);
    Unknown=zeros(92*112,8*4);

    for i=1:32
        cd(sprintf('s%d',i));
        for j=7:10
            temp=im2double(imread(sprintf('%d.pgm',j)));
            X(:,(i-1)*4+j-6)=temp(:);
        end
        cd('../');
    end

    for i=33:40
        cd(sprintf('s%d',i));
        for j=7:10
            temp=im2double(imread(sprintf('%d.pgm',j)));
            Unknown(:,(i-33)*4+j-6)=temp(:);
        end
        cd('../');
    end
    cd('../3/code');
    
end