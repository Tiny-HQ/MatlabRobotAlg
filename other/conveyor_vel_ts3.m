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




conveyor_vel = [371.43/19.961 864.29/19.961 1717/19.961 2107/19.961 2521.43/19.961 38.4 64.38 124.56];
acc_disp = [1.64 5.82 16.25 22.14 28.98 4.86 10.54 28.38];

p1 = polyfit(conveyor_vel,acc_disp,2);
x1 = 0:0.5:130;
y1 = p1(1)*x1.^2+p1(2)*x1+p1(3);
plot(x1,y1);hold on;


conveyor_vel_1 = [67.2 33.82 53.6 71.58 88.71 97.61 128.81 49.82 91.4];
acc_disp_1 = [9.18 3.28 6.54 10.09 13.93 16.07 24.36 5.86 14.56];

p2 = polyfit(conveyor_vel_1,acc_disp_1,2);
x2 = 0:0.5:130;
y2 = p2(1)*x2.^2+p2(2)*x2+p2(3);
plot(x2,y2);hold on;


plot(conveyor_vel,acc_disp,'*');
hold on;
plot(conveyor_vel_1,acc_disp_1,'o');
















