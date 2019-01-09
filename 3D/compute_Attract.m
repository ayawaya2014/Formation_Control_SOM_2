function [Yatx,Yaty,Yatz]=compute_Attract(X,Xsum,k,angle,an,a,~) 
R=(X(1)-Xsum(1,1))^2+(X(2)-Xsum(1,2))^2+(X(3)-Xsum(1,3))^2; 
r=sqrt(R); 
Yatx=k*r*cos(angle)*cos(an);%angle=Y(1)
Yaty=k*r*sin(angle)*cos(an);
Yatz=k*r*a*sin(an);
