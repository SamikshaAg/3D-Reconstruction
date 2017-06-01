function [X,Y,Z] = Reconstruct(disparitymap,I1,I2)
s=load('calib.mat');
[J1, J2] = rectifyStereoImages(I1, I2,s.params);
pointCloud = reconstructScene(disparitymap,s.params);
pointCloud = pointCloud / 1000;


X = pointCloud(:, :, 1);
Y = pointCloud(:, :, 2);
Z = pointCloud(:, :, 3);


end