function disparitymap = disparityFunction( J1, J2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

disparitymap = disparity(rgb2gray(J1), rgb2gray(J2));
figure;
imshow(disparitymap, [0,64], 'InitialMagnification', 50);
colormap('JET');
colorbar;
title('Disparity Map');
end

