function [Robot,od]=move2(Robot,X,lx,ly)
length=[X(1)-lx;X(2,1)-ly];
hold off
Robot= Robot + length;
% [lx,ly]=select(Robot,X);
[od]=obs();
hold on
plot( Robot(1,:),Robot(2,:),'dm','MarkerSize',8,'MarkerFaceColor','r');
hold on
plot(Robot(1,:),Robot(2,:),'dm','MarkerSize',12);
hold on
plot([Robot(1,:),Robot(1,1)],[Robot(2,:),Robot(2,1)],'-k','LineWidth',2);
axis([0 60 0 70]);
pause(0.2);
