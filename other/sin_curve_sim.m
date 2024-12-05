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

clc;
clear;




A = 100;
J = 1000;
DT = pi*A/2/J;


t = 0:0.001:2*DT;

s0 = A/2*DT^2/pi/pi;

v = -A/2*DT/pi*cos(pi/DT*t-pi/2)+A/2*t;

a = A/2*sin(pi/DT*t-pi/2)+A/2;

j = pi*A/2/DT*cos(pi/DT*t-pi/2);

s = -A/2*DT^2/pi/pi*sin(pi/DT*t-pi/2)+A*t.^2/4-s0;

DT = pi*A/J;
t1 = 0:0.001:DT;
a1 = A*sin(pi/DT*t1).^2;
v1 = A/2*t1-A*DT/4/pi*sin(2*pi/DT*t1);
j1 = A*pi/DT*sin(2*pi/DT*t1);

%a1 = A/2*sin(pi/DT*t).^2+A/2;
%j1 = A*pi/DT*sin(2*(pi/DT*t));
%plot(a1);


subplot(4,1,1);
plot(s);
subplot(4,1,2);
plot(v);hold on;plot(v1);
subplot(4,1,3);
plot(a);hold on;plot(a1);
subplot(4,1,4);
plot(j);hold on;plot(j1);

% subplot(3,2,1);
% plot(t,v);
% subplot(3,2,3);
% plot(t,a);
% subplot(3,2,5);
% plot(t,j);





% subplot(4,2,4);
% plot(v1);
% subplot(4,2,6);
% plot(a1);
% subplot(4,2,8);
% plot(j1);
% 
% figure;
% plot(t,j);
% 
% 
% figure;
% plot(t,cos(pi/DT*t-pi/2));
% figure;
% plot(t,-A/2*DT/pi*cos(pi/DT*t-pi/2));
% figure;
% plot(t,-A/2*DT/pi*cos(pi/DT*t-pi/2)+A/2*t);
% subplot(3,1,1);
% plot(t,v1);
% subplot(3,1,2);
% plot(t,a1);
% subplot(3,1,3);
% plot(t,j1);













