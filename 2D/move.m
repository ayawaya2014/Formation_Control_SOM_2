function [Robot,od]=move(Robot,X,lx,ly,b)
length=[X(1)-lx;X(2,1)-ly];
d=sqrt((X(1)-lx)^2+(X(2,1)-ly)^2);
length=length/d;
length1=[length(1) length(1) length(1);length(2,1)  length(2,1)  length(2,1)];
hold off
Robot= Robot + length1*0.5;
% [lx,ly]=select(Robot,X);
[od]=obs();
if b==0
% hold on
plot( Robot(1,:),Robot(2,:),'dm','MarkerSize',8,'MarkerFaceColor','r');
% hold on
plot(Robot(1,:),Robot(2,:),'dm','MarkerSize',12);
% hold on
plot([Robot(1,:),Robot(1,1)],[Robot(2,:),Robot(2,1)],'-k','LineWidth',2);
axis([0 60 0 70]);
pause(0.2);
end


           
