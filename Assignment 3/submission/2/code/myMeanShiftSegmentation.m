function myMeanShiftSegmentation(hr,hs,nNeighbour,nIter)
    img = imread('../data/baboonColor.png');
    img = im2double(img);

    imagesc(img);title('Original Image');


    %smoothing and downsampling the image
    img = imgaussfilt(img,1);
    img = img(1:2:end,1:2:end,:);
    figure;imagesc(img);title('Downsampled Image');

    


    %feature vector for knnsearch
    [m,n,c] = size(img);
    V = zeros(m*n,5);

    for i = 1:m
        for j = 1:n
            V(i+(j-1)*m,:) = [i/hs,j/hs,img(i,j,1)/hr,img(i,j,2)/hr,img(i,j,3)/hr];
        end
    end

    %iterating
    for iter = 1:10
        [Idx,D] = knnsearch(V,V,'k',nNeighbour);
        nV = V;

        for i = 1:m
            for j = 1:n
                W = exp((D(i+(j-1)*m,:).^2)/2);
                nV(i+(j-1)*m,:) = W*V(Idx(i+(j-1)*m,:),:)/sum(W);
            end
        end

        V = nV;

    end

    I = zeros([m,n,c]);

    %reconstructing the image
    for i = 1:m
        for j = 1:n
            I(i,j,:) = V(i+(j-1)*m,3:5)*hr;
        end
    end

    figure;imagesc(I);title('Segmented Image');

end