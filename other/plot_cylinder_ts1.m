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
clear all

r=1;%????
n=100;%?????????
h=5;%???
[x,y,z]=cylinder(r,n);%?????100???????,???r,??1,????0,0;
z1=[z(1,:);z(2,:)+h-1];%?????,???h

 

%???????????
z2=[z(1,:);z1;z1(2,:)];
x2=[zeros(1,n+1);x;zeros(1,n+1)];
y2=[zeros(1,n+1);y;zeros(1,n+1)];

 

z3=[z1(1,:);z1(1,:)];
x3=[x(1,:);x(1,:)];
y3=[y(1,:);y(1,:)];
z4=[z1(2,:);z1(2,:)];

 

z5=z2([1,2],:);
x5=x2([1,2],:);
y5=y2([1,2],:);
z6=z2([3,4],:);

% figure(1)
% mesh(x2,z2,y2)
% map=jet(16);
% cl=12;%???16???(1-16)
% map1=map(cl,:);
% colormap(map1)
% alpha(0.6)%?????(0-1)
% axis equal

 

figure(2)
surf(x2,z2,y2,'LineStyle','none')
map=jet(16);
cl=4;%???16???(1-16)
map1=map(cl,:);
colormap(map1)
hold on
surf(x3,z3,y3)
surf(x3,z4,y3)
alpha(.7)%?????(0-1)
hold off
axis equal

 

% figure(3)
% surf(x,z1,y)
% map=jet(16);
% cl=13;%???8???(1-16)
% map1=map(cl,:);
% colormap(map1)
% hold on
% surf(x5,z5,y5,'LineStyle','none')
% surf(x5,z6,y5,'LineStyle','none')
% alpha(.9)%?????(0-1)
% hold off
% axis equal