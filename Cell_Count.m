function [area, centroids] = Cell_Count(raw_image)
    % This function analyzes the positive cells in a given image matrix
    % img_gray = rgb2gray(raw_image);
    img_gray = raw_image;
    I_BW = imbinarize(img_gray, 0.35);
    I_BW_m = medfilt2(I_BW, [3, 3]);
    se = strel('cube', 1);
    I_BW_e = imerode(I_BW_m, se);
    BWnobord = imclearborder(I_BW_e, 4);
    D = -bwdist(~BWnobord);
    Ld = watershed(D);
    BWnobord(Ld == 0) = 0;
    L = bwlabeln(BWnobord, 8);
    S = regionprops(L, 'Area', 'Centroid');
    validAreas = ([S.Area] <= 2000) & ([S.Area] >= 15);  % Adjust these thresholds as needed
    validS = S(validAreas);
    area = [validS.Area];
    centroids = cat(1, validS.Centroid);
end
