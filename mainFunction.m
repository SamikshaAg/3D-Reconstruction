function mainFunction

maxrun=8; % maximum number of times the setup will run without exiting
while(maxrun>0)
choice=input('press q for stereo image capture\n press c for calibration \npress l to launch reconstructor\n press e for exit\n','s');
if choice=='e'
    break;
end

%To run stereo image capture    
if choice=='q'
    captureFunction;
end
if choice=='c'
    fprintf('Running calibration....\n');
    params1=calibFunction;
    fprintf('Calibration Done\n');
end

%For reconstruction
if choice=='l'
    fprintf('Enter Input Stereo Images\n');
    filename1=input('Left Image: \n','s');
    filename2=input('Right Image: \n','s');
    
    I1= imread(fullfile(matlabroot,sprintf('%s.png',filename1)));
    I2= imread(fullfile(matlabroot,sprintf('%s.png',filename2)));
    [J1,J2]=rectify(I1,I2);
    disparitymap=disparityFunction(J1,J2);
    [X,Y,Z]=Reconstruct(disparitymap,I1,I2);
    [x1,y1,x2,y2]=drawLine(J1);
    dist=distanceFunction(X,Y,Z,x1,y1,x2,y2);
    fprintf('distance between A and B is %f \n', dist);
    
end
    maxrun=maxrun-1;
end

end