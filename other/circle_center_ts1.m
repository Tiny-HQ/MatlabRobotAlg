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
x10=1;y10=1;z10=1;

a1=1;b1=1;c1=1;

r1=2;


t1=0:0.001:2*pi;

x1=r1*cos(t1);

y1=r1*sin(t1);

z1=zeros(1,length(t1));


A1=asin(-b1/sqrt(b1^2+c1^2));

B1=asin(a1/sqrt(a1^2+c1^2));

C1=0;


Rx_A1=[1 0 0;0 cos(A1) sin(A1);0 -sin(A1) cos(A1)];

Ry_B1=[cos(B1) 0 -sin(B1);0 1 0;sin(B1) 0 cos(B1)];

Rz_C1=[cos(C1) sin(C1) 0;-sin(C1) cos(C1) 0;0 0 1];
T = Rz_C1*Ry_B1*Rx_A1
det(T)



Rxyz1=Rz_C1*Ry_B1*Rx_A1*[x1;y1;z1];


TR1(1,:)=Rxyz1(1,:)+x10*ones(1,length(t1));

TR1(2,:)=Rxyz1(2,:)+y10*ones(1,length(t1));

TR1(3,:)=Rxyz1(3,:)+z10*ones(1,length(t1));


plot3(TR1(1,:),TR1(2,:),TR1(3,:),'r');



P1 = TR1(:,1000);
P2 = TR1(:,4000);
P3 = TR1(:,6000);

v = cross(P1-P2,P2-P3);
v = v/sqrt(sum(v.^2));
sum(v.*[a1/3^0.5 b1/3^0.5 c1/3^0.5]')



z = [1,1,1]';
y = [-1,2,-1]';
x = [1,0,-1]';

x = x/ sqrt(sum(x.^2));
y = y/ sqrt(sum(y.^2));
z = z/ sqrt(sum(z.^2));


T = [x y z]
det(T)
Rxyz2=T*[x1;y1;z1];
TR2(1,:)=Rxyz2(1,:)+x10*ones(1,length(t1));

TR2(2,:)=Rxyz2(2,:)+y10*ones(1,length(t1));

TR2(3,:)=Rxyz2(3,:)+z10*ones(1,length(t1));
hold on;
plot3(TR2(1,:),TR2(2,:),TR2(3,:),'b');


P1 = TR2(:,10);
P2 = TR2(:,20);
P3 = TR2(:,30);

cross(P1-P2,P2-P3)
v = v/sqrt(sum(v.^2));
sum(v.*[a1/3^0.5 b1/3^0.5 c1/3^0.5]')
%//grid on;

axis equal;

xlabel('X÷·');

ylabel('Y÷·');

zlabel('Z÷·');
