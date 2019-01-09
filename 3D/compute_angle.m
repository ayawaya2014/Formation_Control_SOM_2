function [Y,Z]=compute_angle(X,Xsum,n)  
  for i=1:n+1 
      deltaX(i)=Xsum(i,1)-X(1);
      deltaY(i)=Xsum(i,2)-X(2);
      deltaZ(i)=Xsum(i,3)-X(3);
      r(i)=sqrt(deltaX(i)^2+deltaY(i)^2+deltaZ(i)^2);
      Ry(i)=sqrt(deltaX(i)^2+deltaY(i)^2);
      if deltaX(i)>0
          theta=acos(deltaX(i)/Ry(i));
      else
          theta=pi-acos(deltaX(i)/Ry(i));
      end
%       if i==1 
%           angle=theta;
%       else
%           angle=theta;      
%       end     
      Y(i)=theta; 
      Z(i)=acos(Ry(i)/r(i));
  end
