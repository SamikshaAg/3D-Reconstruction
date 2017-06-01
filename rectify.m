function [J1,J2] = rectify(I1, I2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%I1 = imread(fullfile(matlabroot,left_image));
%I2 = imread(fullfile(matlabroot,right_image));
s = load('calib.mat');

[J1, J2] = rectifyStereoImages(I1, I2,s.params);
figure; imshow(cat(3, I1(:,:,1), I2(:,:,2:3)), 'InitialMagnification', 50);
title('Before rectification');
figure; imshow(cat(3, J1(:,:,1), J2(:,:,2:3)), 'InitialMagnification', 50);
title('After rectification');

end

