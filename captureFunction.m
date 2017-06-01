function captureFunction
i=0;
filename=input('enter file name','s');
fileext=input('enter extension','s');
camL=webcam(1);     % set the no. to left camera
camR=webcam(3);    % set the no. to right camera
pvL = preview(camL);
pvR = preview(camR);
stop=1;
i=0;
while(stop>0)
    stop=1;
i=i+1;
pause;
IL=snapshot(camL);
IR=snapshot(camR);
while stop<3
 stop=input('press 1,2 to view R,L image,3 to save,9 to reject');
if stop==1
 imshow(IL);
end
if stop==2
imshow(IR);
end
end

if stop==3
 fil=[filename,'L',num2str(i),fileext];
imwrite(IL,fil);
 fil=[filename,'R',num2str(i),fileext];
imwrite(IR,fil);
end
stop=input('press 0 to stop\n');
end
clear camL;
clear camR;

    end

