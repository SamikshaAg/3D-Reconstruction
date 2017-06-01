function res  = distanceFunction(X,Y,Z,x1,y1,x2,y2)
XNan = isnan(X);
YNan = isnan(Y);
ZNan = isnan(Z); 
wfactor = 0.0019;
 
if XNan(x1,y1) == 0 && YNan(x1,y1) == 0 && ZNan(x1,y1) == 0 && XNan(x2,y2) == 0 && YNan(x2,y2) == 0 && ZNan(x2,y2) == 0
   X1=X(x1,y1);
    Y1=Y(x1,y1);
    Z1=Z(x1,y1);
     X2=X(x2,y2);
    Y2=Y(x2,y2);
    Z2=Z(x2,y2); 
   res = sqrt(double(((X2-X1)^2)+((Y2-Y1)^2)+((Z2-Z1)^2)));
else
   ed = sqrt(double(((x2-x1)^2)+((y2-y1)^2)));
   res = ed * wfactor;
end
    

end

