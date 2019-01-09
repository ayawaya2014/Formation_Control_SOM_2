function drawobs( x,y,z )
%DRAWOBS 此处显示有关此函数的摘要
%   此处显示详细说明
p=5;
A = [x;y;z];
B = A + [p;0;0];
C = B + [0;p;0];
D = A + [0;p;0];
  
r1 = repmat(A,1,5);
r2 = [A,B,C,D,A];
r3 = r2 + repmat([0;0;p],1,5);
r4 = repmat(r3(:,1),1,5);
P=[r1;r2;r3;r4];

X = P(1:3:end,:);
Y = P(2:3:end,:);
Z = P(3:3:end,:);
surf(X,Y,Z,'FaceColor','k','EdgeColor','none')
axis([0 60 0 70 0 60]);
end

