function [Goal]=move1(X,lx,ly,od)
length=[X(1)-lx;X(2,1)-ly];
d=sqrt((X(1)-lx)^2+(X(2,1)-ly)^2);
length=(length/d)*5;

Xo=[lx ly];%���λ��
k=50;%����������Ҫ������ϵ��
K=0;%��ʼ��
m=10;%�������������ϵ���������Լ��趨�ġ�
Po=7;%�ϰ�Ӱ����룬���ϰ��ͳ��ľ�������������ʱ������Ϊ0�������ܸ��ϰ���Ӱ�졣Ҳ���Լ��趨��
n=size(od,1);%�ϰ�����
a=15;
l=0.5;%����
J=2000;%ѭ����������
%�������ʵ��Ԥ��Ŀ�꣬����Ҳ���ʼ������ϵ����Po���õĲ������йء�
%end
%�����ϰ���Ŀ����Ϣ
Xsum=[X';od];%���������(n+1)*2ά������[10 10]��Ŀ��λ�ã�ʣ�µĶ����ϰ���λ�á�
Xj=Xo;%j=1ѭ����ʼ����������ʼ���긳��Xj
%***************��ʼ����������ʼ����ѭ��******************
for j=1:J%ѭ����ʼ
    Goal(j,1)=Xj(1);%Goal�Ǳ��泵�߹���ÿ��������ꡣ�տ�ʼ�Ƚ����Ž���������
    Goal(j,2)=Xj(2);
%���ü���Ƕ�ģ��
   Theta=compute_angle(Xj,Xsum,n);%Theta�Ǽ�������ĳ����ϰ�����Ŀ��֮�����X��֮��ļнǣ�ͳһ�涨�Ƕ�Ϊ��ʱ�뷽�������ģ����Լ��������
%���ü�������ģ��
   Angle=Theta(1);%Theta��1���ǳ���Ŀ��֮��ĽǶȣ�Ŀ��Գ���������
   angle_at=Theta(1);%Ϊ�˺��������������������ķ�����ֵ��angle_at
   [Fatx,Faty]=compute_Attract(Xj,Xsum,k,Angle,0,Po,n);%�����Ŀ��Գ���������x,y�������������ֵ��
   
    for i=1:n
       angle_re(i)=Theta(i+1);%��������õĽǶȣ��Ǹ���������Ϊ��n���ϰ�������n���Ƕȡ�
     end
%���ü������ģ��
    [Frerxx,Freryy,Fataxx,Fatayy]=compute_repulsion(Xj,Xsum,m,angle_at,angle_re,n,Po,a);%�����������x,y����ķ������顣
%��������ͷ����������⣬Ӧ��������ÿ��jѭ����ʱ������Ĵ�СӦ����һ��Ψһ�������������顣Ӧ�ðѳ��������з�����ӣ��������з�����ӡ�
    Fsumyj=Faty+Freryy+Fatayy;%y����ĺ���
    Fsumxj=Fatx+Frerxx+Fataxx;%x����ĺ���
    Position_angle(j)=atan(Fsumyj/Fsumxj);%������x�᷽��ļн�����
%���㳵����һ��λ��
    Xnext(1)=Xj(1)+l*cos(Position_angle(j));
    Xnext(2)=Xj(2)+l*sin(Position_angle(j));
    %���泵��ÿһ��λ����������
    Xj=Xnext;
    %�ж�
    if ((Xj(1)-Xsum(1,1))>0)&&((Xj(2)-Xsum(1,2))>0)%��Ӧ����ȫ��ȵ�ʱ�������������ֻ�ǽӽ��Ϳ��ԣ����ڰ���ȫ��ȵ�ʱ���̡�
       K=j;%��¼���������ٴΣ�����Ŀ�ꡣ
       break;
       %��¼��ʱ��jֵ
    end%���������if�����������·���ѭ��������ִ�С�
end%��ѭ������
K=j;
Goal(K,1)=Xsum(1,1);%��·�����������һ���㸳ֵΪĿ��
Goal(K,2)=Xsum(1,2);
%***********************************�����ϰ�����㣬Ŀ�꣬·����*************************
%����·��
X=Goal(:,1);
Y=Goal(:,2);
%·������Goal�Ƕ�ά����,X,Y�ֱ��������x,yԪ�صļ��ϣ�������һά���顣
hold on
plot( od(:,1),od(:,2),'sk','MarkerSize',6,'MarkerFaceColor','k');
axis([0 60 0 70]);
hold on
plot( X,Y,'dm','MarkerSize',3,'MarkerFaceColor','r');
 axis([0 60 0 70]);


% for i=1:K
% Robot(:,3)=Robot(:,1);
% Robot(:,1)=Robot(:,2);
% Robot(:,2)=Goal(k,:)';
% plot( od(:,1),od(:,2),'sk','MarkerSize',6,'MarkerFaceColor','k');
% axis([-20 80 -20 80]);
% hold on
% plot( Robot(1,:),Robot(2,:),'dm','MarkerSize',8,'MarkerFaceColor','r');
% hold on
% plot([Robot(1,1),Robot(1,2)],[Robot(2,1),Robot(2,2)],'-k','LineWidth',2);
% hold on
% plot([Robot(1,2),Robot(1,3)],[Robot(2,2),Robot(2,3)],'-k','LineWidth',2);
% axis([-20 80 -20 80]);
% pause(0.1);
% hold off
% end

    