%坐标列向量
function [Robot]=SOM(Robot,lx,ly,lz,X)

%for k=1:step
    l=[X(3,1)-lz ly-X(2,1) X(1)-lx];
    m=[X(1)-lx X(2,1)-ly X(3,1)-lz];
    d=sqrt((ly-X(2,1))*(ly-X(2,1))+(X(1)-lx)*(X(1)-lx)+(X(3,1)-lz)*(X(3,1)-lz));
    l=l/d;
    m=m/d;
    a=[lx,ly,lz]-10*m+3*l;
    b=[lx,ly,lz]-10*m-7*l;
    Target=[a;lx,ly,lz;b]';
    Tarnum=size(Target,2);
    Robnum=size(Robot,2);
    distance=zeros(Robnum,Tarnum);
    temp=Robot;

    for i=1:Robnum
        for j=1:Tarnum
            distance(i,j)=(Robot(:,i)-Target(:,j))'*(Robot(:,i)-Target(:,j));
        end
    end
    [~,minnum]=min( distance,[],2);
    normal=[1,2,3];%normal=[1...Tarnum]
    normal_num=zeros(1,Tarnum);
    for i=1:Tarnum
        normal_num(i)=sum(minnum==normal(i));
    end
    if max(normal_num)>1
        m=find(normal_num>1);
        n=find(normal_num<1);
        A=find(minnum==m);
        minnum(A(1))=m;
        minnum(A(2))=n;
    end
    dist=1;
%     hold on
    while(dist>0.01)
         hold off
%          [od]=obs();
  
        for i=1:Robnum
            temp(:,i)=Target(:,minnum(i))-Robot(:,i);
            Robot(:,i)=Robot(:,i)+0.3*temp(:,i);
        end
%         hold on
        plot3(Target(1,:),Target(2,:),Target(3,:),'dm','MarkerSize',10,'MarkerFaceColor','b');
        hold on
        plot3( Robot(1,:),Robot(2,:),Robot(3,:),'dm','MarkerSize',8,'MarkerFaceColor','r');
        hold on
        plot3([Target(1,:),Target(1,1)],[Target(2,:),Target(2,1)],[Target(3,:),Target(3,1)],'-k','LineWidth',2);
        axis([0 60 0 70 0 60]);
        legend('virtual AUVS','AUVs');
        obs();
        
        pause(0.1);
        dist=max(diag(temp'*temp));
    end
    %flag=0;
%     Target = Target + length;
%     pause(0.2);
% %end
%NewPosition=Robot;


