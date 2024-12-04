% -------------------------------------------------------------------------
% Author: [Tiny][YuZhi]                      
% Contact: [tiny_h@163.com] 
% GitHub: [https://github.com/Tredin] 
% Zhihu:[https://www.zhihu.com/people/tiny_hq]
% Copyright (c) [2024] [Tiny][YuZhi]. All rights reserved.
% 
% This code is for academic, educational, and non-commercial use only.
% Unauthorized use, reproduction, or distribution is prohibited.
% 
% Disclaimer: This code is provided "as is" without any warranties. Use at your own risk.
% The author is not responsible for any robot or machine safety-related issues arising from the use of this code.
% -------------------------------------------------------------------------
% ‰»Î input
% q0=input('init position ');
% q1=input('end position ');
% v0=input('init velociy ');
% v1=input('end velociy ');
% 
% vmax=input('input maximun velocity ');
% amax=input('input maximun acceleration ');
% jmax=input('input maximun jerk ');
q0=0;q1=10;v0=1;v1=0;
vmax=5;amax=100;jmax=30;jmin=-jmax;

% case of vlim = vmax , while vlim = max(dq(t))
if ((vmax-v0)*jmax<amax^2)
    Tj1 = sqrt( (vmax-v0) / jmax );
    Ta=2*Tj1;
else
    Tj1=amax/jmax;
    Ta=Tj1+(vmax-v0)/amax;
end

if((vmax-v1)*jmax<amax^2)
    Tj2=sqrt((vmax-v1)/jmax);
    Td=2*Tj2;
else
    Tj2=amax/jmax;
    Td=Tj2+(vmax-v1)/amax;
end

Tv=(q1-q0)/vmax-Ta/2*(1+v0/vmax)-Td/2*(1+v1/vmax);

% case of vlim < vmax
if Tv<0
    Tj1=amax/jmax;
    Tj2=amax/jmax;
    Tj=amax/jmax;
    deta=(amax^4)/(jmax^2)+2*(v0^2+v1^2)+amax*(4*(q1-q0)-2*amax/jmax*(v1+v0));
    Ta=(amax^2/jmax-2*v0+sqrt(deta))/(2*amax);
    Td=(amax^2/jmax-2*v1+sqrt(deta))/(2*amax);
end

% if Ta<2Tj or Td<2Tj£¨progressively decrease the value of amax, until
% Ta>2Tj and Td>2Tj

%computation of the trajectory for q1>q0

alima=jmax*Tj1;
alimd=-jmax*Tj2;
vlim=v0+(Ta-Tj1)*alima;
T=Ta+Tv+Td;

figure(1);hold on;
t=0:0.01:Tj1;
q=q0+v0*t+jmax*t.^3/6; plot(t,q);

t=Tj1:0.01:Ta-Tj1;
q=q0+v0*t+alima/6*(3*t.^2-3*Tj1.*t+Tj1^2);
plot(t,q);

t=Ta-Tj1:0.01:Ta;
q=q0+(vlim+v0)*Ta/2-vlim*(Ta-t)-jmin*(Ta-t).^3/6;plot(t,q);

t=Ta:0.01:Ta+Tv;
q=q0+(vlim+v0)*Ta/2+vlim.*(t-Ta);plot(t,q);

t=T-Td:0.01:T-Td+Tj2;
q=q1-(vlim+v1)*Td/2+vlim.*(t-T+Td)-jmax*(t-T+Td).^3/6;plot(t,q);

t=T-Td+Tj2:0.01:T-Tj2;
q=q1-(vlim+v1)*Td/2+vlim*(t-T+Td)+alimd/6*(3*(t-T+Td).^2-3*Tj2*(t-T+Td)+Tj2.^2);plot(t,q);

t=T-Tj2:0.01:T;
q=q1-v1*(T-t)-jmax*(T-t).^3/6;plot(t,q);

%------dq-------%
figure(2);hold on;
t=0:0.01:Tj1;
dq=v0+jmax*t.^2/2;plot(t,dq);

t=Tj1:0.01:Ta-Tj1;
dq=v0+alima*(t-Tj1/2);plot(t,dq);

t=Ta-Tj1:0.01:Ta;
dq=vlim+jmin.*(Ta-t).^2/2;plot(t,dq);

t=Ta:0.01:Ta+Tv;
dq=vlim*ones(size(t));plot(t,dq);

t=T-Td:0.01:T-Td+Tj2;
dq=vlim-jmax*(t-T+Td).^2/2;plot(t,dq);

t=T-Td+Tj2:0.01:T-Tj2;
dq=vlim+alimd.*(t-T+Td-Tj2/2);plot(t,dq);

t=T-Tj2:0.01:T;
dq=v1+jmax*(T-t).^2/2;plot(t,dq);

%------ddq-------%
figure(3);hold on;
t1=0:0.01:Tj1;
ddq1=jmax.*t1; 

t2=Tj1:0.01:Ta-Tj1;
ddq2=jmax*Tj1*ones(size(t2));

t3=Ta-Tj1:0.01:Ta;
ddq3=-jmin*(Ta-t3);

t4=Ta:0.01:Ta+Tv;
ddq4=0*ones(size(t4));

t5=T-Td:0.01:T-Td+Tj2;
ddq5=-jmax*(t5-T+Td);

t6=T-Td+Tj2:0.01:T-Tj2;
ddq6=alimd*ones(size(t6));

t7=T-Tj2:0.01:T;
ddq7=-jmax*(T-t7);

t=[t1,t2,t3,t4,t5,t6,t7];
ddq=[ddq1,ddq2,ddq3,ddq4,ddq5,ddq6,ddq7];
plot(t,ddq);
%------ddq-------%
figure(4);hold on;
t1=0:0.01:Tj1;
dddq1=jmax*ones(size(t1));

t2=Tj1:0.01:Ta-Tj1;
dddq2=0*ones(size(t2));

t3=Ta-Tj1:0.01:Ta;
dddq3=jmin*ones(size(t3));

t4=Ta:0.01:Ta+Tv;
dddq4=0*ones(size(t4));

t5=T-Td:0.01:T-Td+Tj2;
dddq5=-jmin*ones(size(t5));

t6=T-Td+Tj2:0.01:T-Tj2;
dddq6=0*ones(size(t6));

t7=T-Tj2:0.01:T;
dddq7=jmax*ones(size(t7));

t=[t1,t2,t3,t4,t5,t6,t7];
dddq=[dddq1,dddq2,dddq3,dddq4,dddq5,dddq6,dddq7];
plot(t,dddq);