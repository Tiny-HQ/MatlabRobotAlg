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
clc;
clear;


global Ts;
Ts = 0.004;




t = [0.0 0.5 1.0 1.5 2.0 2.5 3.0 4.0];
x = [100.0 110.0 130.0 100 90 75 100 120];
y = [30 50 60 45 60 85 100 85];
z = [50 35 60 75 100 85 97 120];

%  x = [100.0 110.0 130.0 100 90 75 100 120];
%  y = [30 50 60 45 60 85 100 85];
%  z = [0 0 0 0 0 0 0 0];

t = 0:1:60;
x = 2*t*pi*6/180;
y = sin(x);
% z = 0*x;
z = 8*sin(x).*cos(x).*sin(2*x).*cos(2*x);

[a,b,c,d] = b_spline_cal_param(t,x,y,z);
[x_,y_,z_] = b_spline_cal_traj(a,b,c,d,t,Ts);


plot3(x_,y_,z_,x,y,z,'o');
hold on;
plot3(x,y,z,'g')

vx = diff(x_)/0.004;
vy = diff(y_)/0.004;
vz = diff(z_)/0.004;
figure;

plot(sqrt(vx.^2+vy.^2+vz.^2));

ax = diff(vx)/0.004;
ay = diff(vy)/0.004;
az = diff(vz)/0.004;
figure;
plot(sqrt(ax.^2+ay.^2+az.^2));

























