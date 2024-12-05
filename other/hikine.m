% -------------------------------------------------------------------------
% Author: [Tiny][YuZhi]                      
% Contact: [tiny_h@163.com] 
% GitHub: [https://github.com/Tiny-HQ] 
% Zhihu:[https://www.zhihu.com/people/tiny_hq]
% Copyright (c) [2024] [Tiny][YuZhi]. All rights reserved.
% 
% This code is for academic, educational, and non-commercial use only.
% Unauthorized use, reproduction, or distribution is prohibited.
% 
% Disclaimer: This code is provided "as is" without any warranties. Use at your own risk.
% The author is not responsible for any robot or machine safety-related issues arising from the use of this code.
% -------------------------------------------------------------------------
function q = hikine(T)
   global j1;global j2;global j3;global j4;global j5;global j6;
   q=[];
   theta=[];
   rad=pi/180;
   [x,y,z]=size(T);
   a1=0.165;a2=0.55;a3=0.21;d1=0.43;d3=0.03;d4=0.7;d6=0.115;
   o1o2=0.55;
   o2p=sqrt(0.21^2+0.7^2);
   thetac=pi-atan(0.7/0.21);
   for j=1:z
       nx=T(1,1,j);ny=T(2,1,j);nz=T(3,1,j);ox=T(1,2,j);oy=T(2,2,j);oz=T(3,2,j);
       ax=T(1,3,j);ay=T(2,3,j);az=T(3,3,j);px=T(1,4,j);py=T(2,4,j);pz=T(3,4,j); 
	   
	   
       xp=px-ax*d6;
       yp=py-ay*d6;
       zp=pz-az*d6;
	   
	   
       %theta(1)=atan2(py-ay*d6,px-ax*d6);
	   theta(1) = atan2(yp,xp)-atan2(d3,sqrt(xp^2+yp^2-d3^2));
	  
       if theta(1)>(165*rad)
           theta(1)=theta(1)-pi;
       end
	   
	   
       if theta(1)<(-165*rad)    
           theta(1)=pi+theta(1);
       end
	   xp_1 = xp + d3*sin(theta(1));
	   yp_1 = yp - d3*cos(theta(1));
	   
       xp1=xp_1*cos(theta(1))-0.165+yp_1*sin(theta(1));
       yp1=zp-0.43;
       o1p=sqrt(xp1^2+yp1^2);
       theta(2)=acos((o1o2^2+o1p^2-o2p^2)/(2*o1o2*o1p))+atan2(yp1,xp1);
%        if(theta(2)>=(300*rad))
%            theta(2)=theta(2)-2*pi;
%        end
%        if ((theta(2)>(180*rad))&&(theta(2)<(300*rad)))||((theta(2)>(-180*rad))&&(theta(2)<(-60*rad)))
%            theta(2)=atan2(yp1,xp1)-acos((o1o2^2+o1p^2-o2p^2)/(2*o1o2*o1p));
%        end   
      % xp2=xp1*cos(theta(2))-a2+yp1*sin(theta(2));
       %if(xp2>0)
           theta(3)=acos((o1o2^2+o2p^2-o1p^2)/(2*o1o2*o2p))-thetac;
       %else
        %   theta(3)=2*pi-acos((o1o2^2+o2p^2-o1p^2)/(2*o1o2*o2p))+thetac;
       
        if (1-((ax*cos(theta(1))+ay*sin(theta(1)))*sin(theta(2)+theta(3))-az*cos(theta(2)+theta(3))))<=0.000001
            theta(4)=j4;
            theta(5)=0;
            theta(6)=atan2(nx*sin(theta(1))-ny*cos(theta(1)),nz*sin(theta(2)+theta(3))+nx*cos(theta(1))*cos(theta(2)+theta(3))+ny*sin(theta(1))*cos(theta(2)+theta(3)))-theta(4);
        else
            theta(4)=atan2((ax*sin(theta(1))-ay*cos(theta(1))),(az*sin(theta(2)+theta(3))+ax*cos(theta(1))*cos(theta(2)+theta(3))+ay*sin(theta(1))*cos(theta(2)+theta(3))));
            theta(5)=atan2(az*cos(theta(4))*sin(theta(2)+theta(3))+ax*(cos(theta(1))*cos(theta(4))*cos(theta(2)+theta(3))+sin(theta(1))*sin(theta(4)))+ay*(sin(theta(1))*cos(theta(4))*cos(theta(2)+theta(3))-cos(theta(1))*sin(theta(4))),-(az*cos(theta(2)+theta(3))-ax*cos(theta(1))*sin(theta(2)+theta(3))-ay*sin(theta(1))*sin(theta(2)+theta(3))));
            theta(6)=atan2(-nz*sin(theta(4))*sin(theta(2)+theta(3))-nx*(cos(theta(1))*sin(theta(4))*cos(theta(2)+theta(3))-cos(theta(4))*sin(theta(1)))-ny*(sin(theta(1))*sin(theta(4))*cos(theta(2)+theta(3))+cos(theta(1))*cos(theta(4))),nz*(sin(theta(5))*cos(theta(2)+theta(3))+cos(theta(4))*cos(theta(5))*sin(theta(2)+theta(3)))-ny*(sin(theta(1))*(sin(theta(5))*sin(theta(2)+theta(3))-cos(theta(4))*cos(theta(5))*cos(theta(2)+theta(3)))+cos(theta(1))*cos(theta(5))*sin(theta(4)))-nx*(cos(theta(1))*(sin(theta(5))*sin(theta(2)+theta(3))-cos(theta(4))*cos(theta(5))*cos(theta(2)+theta(3)))-cos(theta(5))*sin(theta(1))*sin(theta(4))));
        end
       q(j,1)=theta(1);q(j,2)=theta(2);q(j,3)=theta(3);q(j,4)=theta(4);q(j,5)=theta(5);q(j,6)=theta(6);
       j1=theta(1);j2=theta(2);j3=theta(3);j4=theta(4);j5=theta(5);j6=theta(6);
   end