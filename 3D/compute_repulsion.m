
function [Yrerxx,Yreryy,Yrerzz,Yataxx,Yatayy,Yatazz]=compute_repulsion(X,Xsum,m,angle_at,angle_re,an,an_re,n,Po,a) 
Rat=(X(1)-Xsum(1,1))^2+(X(2)-Xsum(1,2))^2+(X(3)-Xsum(1,3))^2; 
rat=sqrt(Rat); 
for i=1:n
    Rrei(i)=(X(1)-Xsum(i+1,1))^2+(X(2)-Xsum(i+1,2))^2+(X(3)-Xsum(i+1,3))^2; 
        rre(i)=sqrt(Rrei(i)); 
        R0=(Xsum(1,1)-Xsum(i+1,1))^2+(Xsum(1,2)-Xsum(i+1,2))^2+(Xsum(1,3)-Xsum(i+1,3))^2;
        r0=sqrt(R0);
    if rre(i)>Po 
          Yrerx(i)=0;
          Yrery(i)=0;
          Yrerz(i)=0;
          Yatax(i)=0;
          Yatay(i)=0;
          Yataz(i)=0;
    else
        %if r0<Po
        if rre(i)<Po/2
       Yrer(i)=m*(1/rre(i)-1/Po)*(1/Rrei(i))*(rat^a); 
       Yata(i)=a*m*((1/rre(i)-1/Po)^2)*(rat^(1-a))/2; 
       Yrerx(i)=(1+0.1)*Yrer(i)*cos(angle_re(i))*cos(an_re(i));%angle_re(i)=Y(i+1)
       Yrery(i)=-(1-0.1)*Yrer(i)*sin(angle_re(i))*cos(an_re(i));
       Yrerz(i)=Yrer(i)*sin(an_re(i));
       Yatax(i)=Yata(i)*cos(angle_at)*cos(an);%angle_at=Y(1)
       Yatay(i)=Yata(i)*sin(angle_at)*cos(an);
       Yataz(i)=Yata(i)*sin(an);
        else
       Yrer(i)=m*(1/rre(i)-1/Po)*1/Rrei(i)*Rat; 
       Yata(i)=m*((1/rre(i)-1/Po)^2)*rat; 
       Yrerx(i)=Yrer(i)*cos(angle_re(i))*cos(an_re(i));%angle_re(i)=Y(i+1)
       Yrery(i)=Yrer(i)*sin(angle_re(i))*cos(an_re(i));
       Yrerz(i)=Yrer(i)*sin(an_re(i));
       Yatax(i)=Yata(i)*cos(angle_at)*cos(an);%angle_at=Y(1)
       Yatay(i)=Yata(i)*sin(angle_at)*cos(an);
       Yataz(i)=Yata(i)*sin(an);
        end
   end 
end
   Yrerxx=sum(Yrerx); 
   Yreryy=sum(Yrery);
   Yrerzz=sum(Yrerz);
   Yataxx=sum(Yatax);
   Yatayy=sum(Yatay);
   Yatazz=sum(Yataz);