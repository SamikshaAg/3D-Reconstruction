function pointCloudFunc(disparitymap,I1,I2)
s=load('calib.mat');
[J1, J2] = rectifyStereoImages(I1, I2,s.params);
pointCloud = reconstructScene(disparitymap, s.params);
pointCloud = pointCloud / 1000;

[reducedColorImage, reducedColorMap] = rgb2ind(J1, 128);
hFig = figure; hold on;
set(hFig, 'Position', [1 1 840   630]);
hAxes = gca;

X = pointCloud(:, :, 1);
Y = pointCloud(:, :, 2);
Z = pointCloud(:, :, 3);

for i = 1:size(reducedColorMap, 1)
    x = X(reducedColorImage == i-1);
    y = Y(reducedColorImage == i-1);
    z = Z(reducedColorImage == i-1);

    if isempty(x)
        continue;
    end

    % Eliminate invalid values.
    idx = isfinite(x);
    x = x(idx);
    y = y(idx);
    z = z(idx);

    % Plot points between 3 and 7 meters away from the camera.
    maxZ = 2;
    minZ = 0.4;
    x = x(z > minZ & z < maxZ);
    y = y(z > minZ & z < maxZ);
    z = z(z > minZ & z < maxZ);

    plot3(hAxes, x, y, z, '.', 'MarkerEdgeColor', reducedColorMap(i, :));
    hold on;
end

% Set up the view.
grid on;
cameratoolbar show;
axis vis3d
axis equal;
set(hAxes,'YDir','reverse', 'ZDir', 'reverse');
camorbit(-20, 25, 'camera', [0 1 0]);


end

