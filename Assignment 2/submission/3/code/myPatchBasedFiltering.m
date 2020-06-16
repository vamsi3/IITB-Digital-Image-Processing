function filteredImage = myPatchBasedFiltering(image,weightSigma)

filteredImage = zeros(size(image));

imgHeight = size(image, 1);
imgWidth = size(image, 2);

patchSigma = 2.5;
gaussian_conv = fspecial('gaussian', 9, patchSigma);


for i=1:imgWidth
    waitbar(i/(imgWidth-1));
    for j=1:imgHeight
        centerL = max(1, i-4)-i;
        centerR = min(imgWidth, i+4)-i;
        centerT = max(1, j-4)-j;
        centerB = min(imgHeight, j+4)-j;
        
        windowL = max(1, i-12);
        windowR = min(imgWidth, i+12);
        windowT = max(1, j-12);
        windowB = min(imgHeight, j+12);
        window = image(windowT:windowB, windowL:windowR);
        weight = zeros(size(window));
        for x=windowL:windowR
            for y=windowT:windowB
                neighborL = max(1, x-4)-x;
                neighborR = min(imgWidth, x+4)-x;
                neighborT = max(1, y-4)-y;
                neighborB = min(imgHeight, y+4)-y;
                commonL = max(centerL, neighborL);
                commonR = min(centerR, neighborR);
                commonT = max(centerT, neighborT);
                commonB = min(centerB, neighborB);
                centerPatch = image(commonT+j:commonB+j, commonL+i:commonR+i);
                neighborPatch = image(commonT+y:commonB+y, commonL+x:commonR+x);
               diffPatch = neighborPatch-centerPatch;
               gaussian_conv_here = gaussian_conv(5+commonT:5+commonB,5+commonL:5+commonR);
               gaussian_conv_here = gaussian_conv_here / sum(gaussian_conv_here(:));
               gaussian_conv_here = gaussian_conv_here * size(gaussian_conv_here,1)*size(gaussian_conv_here,2);
               diffPatch = diffPatch .* gaussian_conv_here;
               diffPatch = diffPatch .^ 2;
               weight(y-windowT+1, x-windowL+1) = sum(diffPatch(:))/(weightSigma^2);
            end
        end
        weight = exp(-weight);
        weight = weight / sum(weight(:));
        window = window .* weight;
        filteredImage(j, i) = sum(window(:));
    end
end

subplot(1, 3, 3);
imshow(filteredImage);title('Filtered');

