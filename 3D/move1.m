function [Goal]=move1(X,lx,ly,lz,~)
% length=[X(1)-lx;X(2,1)-ly];
% d=sqrt((X(1)-lx)^2+(X(2,1)-ly)^2);
% length=(length/d)*5;
% clc
% close all
% clear all
% clear all
Xo=[lx ly lz];%���λ��
% Xo=[13 19 20];
% X=[40;70;30];
k=30;%����������Ҫ������ϵ��
K=0;%��ʼ��
m=60;%�������������ϵ���������Լ��趨�ġ�
Po=12;%�ϰ�Ӱ����룬���ϰ��ͳ��ľ�������������ʱ������Ϊ0�������ܸ��ϰ���Ӱ�졣Ҳ���Լ��趨��
[od]=obs();
n=size(od,1);%�ϰ�����
a=2.5;
l=0.05;%����
J=2000;%ѭ����������
%�������ʵ��Ԥ��Ŀ�꣬����Ҳ���ʼ������ϵ����Po���õĲ������йء�
%end
%�����ϰ���Ŀ����Ϣ

Xsum=[X';od];%���������(n+1)*2ά������[10 10]��Ŀ��λ�ã�ʣ�µĶ����ϰ���λ�á�
Xj=Xo;%j=1ѭ����ʼ����������ʼ���긳��Xj
%***************��ʼ����������ʼ����ѭ��******************
% for j=1:J%ѭ����ʼ
fag=1;
j=1;
 while(fag)  
    Goal(j,1)=Xj(1);%Goal�Ǳ��泵�߹���ÿ��������ꡣ�տ�ʼ�Ƚ����Ž���������
    Goal(j,2)=Xj(2);
    Goal(j,3)=Xj(3);
%���ü���Ƕ�ģ��
   [Theta,z]=compute_angle(Xj,Xsum,n);%Theta�Ǽ�������ĳ����ϰ�����Ŀ��֮�����X��֮��ļнǣ�ͳһ�涨�Ƕ�Ϊ��ʱ�뷽�������ģ����Լ��������
%���ü�������ģ��
   Angle=Theta(1);%Theta��1���ǳ���Ŀ��֮��ĽǶȣ�Ŀ��Գ���������
   angle_at=Theta(1);%Ϊ�˺��������������������ķ�����ֵ��angle_at
   an=z(1);
   [Fatx,Faty,Fatz]=compute_Attract(Xj,Xsum,k,Angle,an,a,n);%�����Ŀ��Գ���������x,y�������������ֵ��
   
    for i=1:n
       angle_re(i)=Theta(i+1);%��������õĽǶȣ��Ǹ���������Ϊ��n���ϰ�������n���Ƕȡ�
       an_re(i)=z(i+1);
     end
%���ü������ģ��
    [Frerxx,Freryy,Frerzz,Fataxx,Fatayy,Fatazz]=compute_repulsion(Xj,Xsum,m,angle_at,angle_re,an,an_re,n,Po,a);%�����������x,y����ķ������顣
%��������ͷ����������⣬Ӧ��������ÿ��jѭ����ʱ������Ĵ�СӦ����һ��Ψһ�������������顣Ӧ�ðѳ��������з�����ӣ��������з�����ӡ�
    Fsumzj=Fatz+Frerzz+Fatazz;%y����ĺ���
    Fsumyj=Faty+Freryy+Fatayy;%y����ĺ���
    Fsumxj=Fatx+Frerxx+Fataxx;%x����ĺ���
    Fsum=sqrt(Fsumxj^2+Fsumyj^2);
    Position_angle(j)=atan(Fsumyj/Fsumxj);%������x�᷽��ļн�����
    Position_anz(j)=atan(Fsumzj/Fsum);
%���㳵����һ��λ��
    Xnext(1)=Xj(1)+l*cos(Position_angle(j))*cos(Position_anz(j));
    Xnext(2)=Xj(2)+l*sin(Position_angle(j))*cos(Position_anz(j));
    Xnext(3)=Xj(3)+l*sin(Position_anz(j));
    %���泵��ÿһ��λ����������
    Xj=Xnext;
    %�ж�
    
    if ((Xj(1)-Xsum(1,1))>0)%&&((Xj(2)-Xsum(1,2))>0)&&((Xj(3)-Xsum(1,3))>0)%��Ӧ����ȫ��ȵ�ʱ�������������ֻ�ǽӽ��Ϳ��ԣ����ڰ���ȫ��ȵ�ʱ���̡�
       K=j;%��¼���������ٴΣ�����Ŀ�ꡣ%��¼��ʱ��jֵ 
       fag=0;
    end %���������if�����������·���ѭ��������ִ�С�
    j=j+1;
end%��ѭ������
K=j;
Goal(K,1)=Xsum(1,1);%��·�����������һ���㸳ֵΪĿ��
Goal(K,2)=Xsum(1,2);
Goal(K,3)=Xsum(1,3);
%***********************************�����ϰ�����㣬Ŀ�꣬·����*************************
%����·��
X=Goal(:,1);
Y=Goal(:,2);
Z=Goal(:,3);
%·������Goal�Ƕ�ά����,X,Y�ֱ��������x,yԪ�صļ��ϣ�������һά���顣
% hold on
% [od]=obs();
hold on
plot3( X,Y,Z,'dm','MarkerSize',3,'MarkerFaceColor','r');
axis([0 60 0 70 0 60]);




    