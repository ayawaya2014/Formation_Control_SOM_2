function [lx,ly]=select(Robot,X)
   %den=[60;70];
    Robnum=size(Robot,1)+1;
    distance=[0 0 0];
    mn=1000;
for i=1:Robnum
        
%             distance(i)=sqrt((Robot(1,i)-X(1))*(Robot(2,i)-X(2,1)));
              distance(i)=abs(Robot(1,i)-X(1))+abs(Robot(2,i)-X(2,1));
           if distance(i)<mn
               mn=distance(i);
               lx=Robot(1,i);
               ly=Robot(2,i);
           end
        
  
end
    