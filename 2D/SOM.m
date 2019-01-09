%坐标列向量
function [Robot]=SOM(Robot,lx,ly,X)

%for k=1:step
    l=[ly-X(2,1) X(1)-lx];
    m=[X(1)-lx X(2,1)-ly];
    d=sqrt((ly-X(2,1))*(ly-X(2,1))+(X(1)-lx)*(X(1)-lx));
    l=l/d;
    m=m/d;
    a=[lx,ly]-10*m+3*l;
    b=[lx,ly]-10*m-7*l;
    Target=[a;lx,ly;b]';
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
    while(dist>0.01)
        [od]=obs();
%         hold on
        for i=1:Robnum
            temp(:,i)=Target(:,minnum(i))-Robot(:,i);
            Robot(:,i)=Robot(:,i)+0.1*temp(:,i);
        end
      
        plot(Target(1,:),Target(2,:),'dm','MarkerSize',12);
        hold on
        plot( Robot(1,:),Robot(2,:),'dm','MarkerSize',8,'MarkerFaceColor','r');
        hold on
        plot([Target(1,:),Target(1,1)],[Target(2,:),Target(2,1)],'-k','LineWidth',2);
        axis([0 60 0 70]);
%         legend('障碍物','AUVs');
        hold off
        pause(0.1);
        dist=max(diag(temp'*temp));
    end
    %flag=0;
%     Target = Target + length;
%     pause(0.2);
% %end
%NewPosition=Robot;


