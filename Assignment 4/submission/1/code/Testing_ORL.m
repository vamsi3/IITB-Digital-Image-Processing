function [X]=Testing_ORL()
    ORLDir = '../../att_faces';
    cd(ORLDir);

    m=32*4;
    X=zeros(92*112,m);

    for i=1:32
        cd(sprintf('s%d',i));
        for j=7:10
            temp=im2double(imread(sprintf('%d.pgm',j)));
            X(:,(i-1)*4+j-6)=temp(:);
        end
        cd('../');
    end
    cd('../1/code');
    
end