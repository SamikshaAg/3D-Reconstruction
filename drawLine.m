function [x1,y1,x2,y2] = drawLine(J1)

figure,imshow(J1)

%# make sure the image doesn't disappear if we plot something else

hold on
%# define points (in matrix coordinates)

[x1,y1]= ginput(1);
[x2,y2]= ginput(1);

%# plot the points.
%# Note that depending on the definition of the points,
%# you may have to swap x and y

plot([x1,x2],[y1,y2],'Color','r','LineWidth',2);
%dist=distanceFunction(X,Y,Z,x1,y1,x2,y2);
text(x1,y1,'A','color','yellow','FontSize',10);
text(x2,y2,'B','color','yellow','FontSize',10);
y1 = typecast(uint64(y1), 'int64');
y2 = typecast(uint64(y2), 'int64');
end
