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


A = [260.194 56.277 0 143.39 0 0];
B = [259.635 55.8172 0 -0 0 0];
TA = cs_define_zyzeul(A);
TB = cs_define_zyzeul(B);
T = inv(TA)*TB

x = (B(1)-A(1))*cos(143.39*pi/180)+(B(2)-A(2))*sin(143.39*pi/180)
y = (B(1)-A(1))*cos(143.39*pi/180)-(B(2)-A(2))*sin(143.39*pi/180)
a = cos(143.39*pi/180);b = sin(143.39*pi/180);c =-b;d = a;
m = B(1)-A(1);n = B(2)-A(2);
x = (m*d-b*n)/(a*d-b*c)
TA*T