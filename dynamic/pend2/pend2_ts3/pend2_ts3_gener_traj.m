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
clear;
clc;

global Ts Pi g m1 m2 Izz2 Izz1 L1 L2;
Ts = 0.01;
Pi = 3.1415926;
g = 9.81;


Izz2 = 1.0;
Izz1 = 0.208;

m1 = 2.409;
m2 = 1.0;
L1 = 1.0;
L2 = 2.0;


total_time = 10.0;
i = 1;
t = 0:Ts:total_time;

pos1 = 0.4*sin(t)*180.0/pi; vel1 = 0.4*sin(t+pi/2)*180.0/pi; acc1 = 0.4*sin(t+pi)*180.0/pi;
pos2 = 1.2*pos1; vel2 = 1.2*vel1; acc2 = 1.2*acc1;


q1 = [t',pos1']; dq1 = [t',vel1']; ddq1 = [t',acc1'];
q2 = [t',pos2']; dq2 = [t',vel2']; ddq2 = [t',acc2'];

[tao1,tao2] = pend2_ts3_cal_tao_(pos1,vel1,acc1,pos2,vel2,acc2);

figure(1);
plot(tao1);
figure(2);
plot(tao2);
























