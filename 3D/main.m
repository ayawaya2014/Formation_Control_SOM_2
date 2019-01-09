clc
clear
close all
%Robot = [1 20 13;18 2 19];%
Robot = [3 15 20;13 2 19;5 15 20] ;%两点竞争一点
% Robot = [26 35 38;28 27 39] ;
X=[40;70;30];
temp=[25;32;25];
b=true;
[od]=obs();
[lx,ly,lz]=select(Robot,X);
[Robot]=SOM(Robot,lx,ly,lz,X);
while(b)
    d=sqrt((temp(1)-lx)^2+(temp(2,1)-ly)^2+(temp(3,1)-lz)^2); 
    if d<0.3
        b=false;
    end
    [Robot,od]=move(Robot,temp,lx,ly,lz);
    [lx,ly,lz]=select(Robot,X);
end
[Robot]=SOMline(Robot,lx,ly,lz,X);
[Goal]=move1(X,lx,ly,lz,od);
% [od]=obs();
% while(1)
%  [Robot,od]=move(Robot,X,lx,ly);
% [lx,ly]=select(Robot,X);
% % d1=[];
% %     for i=1:length(od)
%         d1=sqrt(([lx,ly]-X')*([lx,ly]-X')');
%         if d1<35
%            [Robot]=SOMline(Robot,lx,ly,X);
%            b=true;
%         while(b)
%             [Robot]=move1(Robot,X,lx,ly,od);
%             [lx,ly]=select(Robot,X);
%             a=X(2,1)-ly;
%             if a<0.1
%                 b=false;
%             end
%         end
%         end
%    
% end

% % end
% end
% % Robot(:,2)=Robot(:,3);
% % plot( Robot(1,:),Robot(2,:),'dm','MarkerSize',8,'MarkerFaceColor','r');
% % hold on
% % plot([Robot(1,:),Robot(1,1)],[Robot(2,:),Robot(2,1)],'-k','LineWidth',2);
% % axis([-20 80 -20 80]);
% % pause(1);
% % hold off
% % Robot(:,2)=Robot(:,1);
% % Robot(:,3)=Robot(:,1);
% % % plot(  Robot(1,:),Robot(2,:),'dm','MarkerSize',8,'MarkerFaceColor','r');
% % % axis([-20 80 -20 80]);
% % %[Robot]=SOM(Robot,Target);
% % % % den=[45;45];
% b=true;
% X=[60;70];
% [lx,ly]=select(Robot,X);
% [Robot,od]=SOM(Robot,lx,ly,X);
%  while(b)
% [Robot,od]=move(Robot,X,lx,ly);
% [lx,ly]=select(Robot,X);
% % d1=[];
%     for i=1:length(od)
%        d1=sqrt(([lx,ly]-od(i,:))*([lx,ly]-od(i,:))');
%         if d1<3.5
%             [Robot]=SOMline(Robot,lx,ly,X);
%             b=false;
%         end
%     end
%  end
%  [lx,ly]=select(Robot,X);
%  [Goal]=move1(X,lx,ly,od);
%  K=size(Goal,1);
%  for i=2:K
%      c=1;
%      while(c)
%     [Robot,od]=move(Robot,Goal(i,:)',lx,ly);
%     [lx,ly]=select(Robot,Goal(i,:)');
%     d=sqrt((Goal(i,:)-[lx,ly])*(Goal(i,:)-[lx,ly])');
%         if d<0.001
%              c=0; 
%                
%         end
%      end
%  end

% Robot(:,2)=Robot(:,3);
% hold off
% [od]=obs();
% hold on
% plot( Robot(1,:),Robot(2,:),'dm','MarkerSize',8,'MarkerFaceColor','r');
% hold on
% plot([Robot(1,:),Robot(1,1)],[Robot(2,:),Robot(2,1)],'-k','LineWidth',2);
% axis([-20 80 -20 80]);
% pause(2);
% hold off
% [od]=obs();
% hold on
% Robot(:,2)=Robot(:,1);
% Robot(:,3)=Robot(:,1);
% plot(  Robot(1,:),Robot(2,:),'dm','MarkerSize',8,'MarkerFaceColor','r');
% axis([-20 80 -20 80]);
 
      

        
