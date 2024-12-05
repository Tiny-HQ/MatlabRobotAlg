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

R1 = cs_define_zyzeul([110.80 351.58 654.99 113.26 0.014 -65.001]);
R1 = splitT_R(R1);
axis = [0.0036601832117971926 -0.0014552782440592495 -0.99999224258194030];
angle = 2.1857358245455845;

nx = axis(1);ny = axis(2);nz = axis(3);

a11 = nx^2+(1-nx^2)*cos(angle);a12 = nx*ny*(1-cos(angle))-nz*sin(angle);a13 = nx*nz*(1-cos(angle))+ny*sin(angle);
a21 = nx*ny*(1-cos(angle))+nz*sin(angle);a22=ny^2+(1-ny^2)*cos(angle);a23 = ny*nz*(1-cos(angle))-nx*sin(angle);
a31 = nx*nz*(1-cos(angle))-ny*sin(angle);a32= ny*nz*(1-cos(angle))+nx*sin(angle);a33=nz^2+(1-nz^2)*cos(angle);

R = [a11 a12 a13;a21 a22 a23;a31 a32 a33]


M = S_alg(axis);

R_ = eye(3)+sin(angle)*M+(1-cos(angle))*M*M

R1*R
R1*R_









