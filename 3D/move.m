function [Robot,od]=move(Robot,X,lx,ly,lz)
length=[X(1)-lx;X(2,1)-ly;X(3,1)-lz];
d=sqrt((X(1)-lx)^2+(X(2,1)-ly)^2+(X(3,1)-lz)^2);
length=length/d;
length1=[length(1) length(1) length(1);length(2,1)  length(2,1)  length(2,1);length(3,1) length(3,1) length(3,1)];
% hold off
Robot= Robot + length1*0.5;
% [lx,ly]=select(Robot,X);
[od]=obs();
hold on
plot3( Robot(1,:),Robot(2,:),Robot(3,:),'dm','MarkerSize',8,'MarkerFaceColor','r');
hold on
plot3(Robot(1,:),Robot(2,:),Robot(3,:),'dm','MarkerSize',12);
hold on
plot3([Robot(1,:),Robot(1,1)],[Robot(2,:),Robot(2,1)],[Robot(3,:),Robot(3,1)],'-k','LineWidth',2);
axis([0 60 0 70]);
pause(0.2);

           
