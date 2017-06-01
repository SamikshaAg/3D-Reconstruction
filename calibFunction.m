function [ params ] = calibFunction

numImages = 19;
leftImages = cell(1, numImages);
rightImages = cell(1, numImages);
for i=1:numImages
    leftImages{i} = fullfile(matlabroot, 'd3', sprintf('imgL%d.png', i));
    rightImages{i} = fullfile(matlabroot, 'd3', sprintf('imgR%d.png', i));
end

[imagePoints, boardSize] = detectCheckerboardPoints(leftImages, rightImages);

worldPoints = generateCheckerboardPoints(boardSize, 31.5);

im = imread(leftImages{i});
params = estimateCameraParameters(imagePoints, worldPoints);

showReprojectionErrors(params);



end

