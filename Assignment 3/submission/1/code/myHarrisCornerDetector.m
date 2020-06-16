function myHarrisCornerDetector(sigmap,sigmab,alpha,tH)
    imgData = load('../data/boat.mat');
    I = im2double(imgData.imageOrig);

    %normalizing image
    I = I - min(I(:));
    I = I/max(I(:));

    %original image
    imagesc(I);colormap('gray');title('Original Image');
    
    %smoothening image
    If = imgaussfilt(I,sigmap);
    figure;imagesc(If);colormap('gray');title('Smoothened Image');

    %computing horizontal, vertical derivatives
    [Ix, Iy] = imgradientxy(I);
    figure;imagesc(Ix);colormap('gray');title('X gradient');
    figure;imagesc(Iy);colormap('gray');title('Y gradient');

    %computing the elements of the local structure matrix
    A = Ix.*Ix;
    B = Iy.*Iy;
    C = Ix.*Iy;

    %smoothening the components
    Af = imgaussfilt(A,sigmab);
    Bf = imgaussfilt(B,sigmab);
    Cf = imgaussfilt(C,sigmab);

    %corner response function
    Det = Af.*Bf-Cf.*Cf;
    Trace = Af + Bf;
    Q = Det - alpha*(Trace.*Trace);
    figure;imagesc(Q/max(Q(:)));colormap('gray');title('Corner Response');
    Q(Q < tH) = 0;

    %eigen values
    eigen1 = 0.5*(Trace + sqrt(Trace.*Trace - 4*Det));
    eigen2 = 0.5*(Trace - sqrt(Trace.*Trace - 4*Det));
    
    figure;imagesc(eigen1/max(eigen1(:)));colormap('gray');title('Max Eigen Value');
    figure;imagesc(eigen2/max(eigen2(:)));colormap('gray');title('Min Eigen Value');
    
    [m,n] = size(Q);

    for i=1:m
        for j=1:n

            temp = Q(max(1,i-1):min(m,i+1),max(1,j-1):min(n,j+1));
            if(max(temp(:)) ~= Q(i,j))
                Q(i,j) = 0;
            end

        end
    end

    %inserting markers
    [rows,cols] = find(Q > 0);

    figure;imagesc(I);colormap('gray');title('Corners');hold on;
    plot(cols,rows,'+','color','r','linewidth',0.75);hold off;
end