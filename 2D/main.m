% clc
% clear
% close all
Robot = [1 20 13;18 2 19];%
%Robot = [1 3 13;18 20 19] ;%两点竞争一点
% Robot = [26 35 38;28 27 39] ;
% X=[60;70];
% [od]=obs();
% [lx,ly]=select(Robot,X);
% [Robot]=SOM(Robot,lx,ly,X);
% [Robot]=SOMline(Robot,lx,ly,X);
% [Goal]=move1(X,lx,ly,od);
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
b=true;
X=[60;70];
[lx,ly]=select(Robot,X);
[Robot]=SOM(Robot,lx,ly,X);
 while(b)
[Robot,od]=move(Robot,X,lx,ly,0);
[lx,ly]=select(Robot,X);
% d1=[];
    for i=1:length(od)
       d1=sqrt(([lx,ly]-od(i,:))*([lx,ly]-od(i,:))');
        if d1<3.5
            [Robot]=SOMline(Robot,lx,ly,X);
            b=false;
        end
    end
 end
 [lx,ly]=select(Robot,X);
 [Goal]=move1(X,lx,ly,od);
 K=size(Goal,1);
%  for i=2:K
%      %c=1;
%      %while(c)
%         % [lx,ly]=select(Robot,Goal(i,:)');
%         % [Robot]=SOM(Robot,lx,ly,Goal(i,:)');
%          [Robot,od]=move(Robot,Goal(i,:)',lx,ly);
%          %d=sqrt((Goal(i,:)-[lx,ly])*(Goal(i,:)-[lx,ly])');
%          %if d<0.8
%             % c=0; 
%                
%          %end
%      %end
%  end

 for i=2:K
     c=1;
     while(c)
         c=mod(i,5);
        [Robot,od]=move(Robot,Goal(i,:)',lx,ly,c);
        [lx,ly]=select(Robot,Goal(i,:)');
        d=sqrt((Goal(i,:)-[lx,ly])*(Goal(i,:)-[lx,ly])');
        if d<0.1
             c=0; 
               
        end
     end
 end
rost=0;
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
 
      

        
