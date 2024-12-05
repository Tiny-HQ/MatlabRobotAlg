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

syms cr sr cp sp xr3 yr3 zr3 x y z x2 y2 z2 real;

cr = 2^0.5/2;
sr = 2^0.5/2;
cp = 2^0.5/2;
sp = 2^0.5/2;


xr3 = 100;
yr3 = 100.0;
zr3 = 0.0;

x = 100;
y = 300.0;
z = 0.0;

x2 = 1000;
y2 = 1000.0;
z2 = 0.0;


B = [xr3-cr*cp*x2-x;yr3-sr*cp*x2;zr3-z+sp*x2]

A = [cr*cp*y2 -sr*y2 1;sr*sp*y2 cr*y2 1;cp*yr3 0 1;]

 T = inv(A)*B

atan2(T(1),T(2))*180/pi



F2 = cr/sp;
F1 = cp^2+sr*sp;
s1 = yr3-cp*z+zr3-y;
s2 = xr3-(z+zr3)*cr/(sp/cp)-x;
M2 = (F2*s1-F1*s2)/(F2*cr+F1*sr)
M1 = (s1-M2*cr)/F1
W = atan2(M1,M2)*180/pi






