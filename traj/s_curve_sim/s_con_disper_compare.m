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


s = 100.3;
v = 50.6;
a = 100.3;
j = 1000;


[t,jerk] = s_curve_cal_param_con(s,v,a,j);

[p,v,a,jerk] = s_curve_cal_pvaj_con_ext(t,jerk,0.004);

plot(v,'r');hold on;


s = 100.3;
v = 50.6;
a = 100.3;
j = 1000;

[n,jerk] = s_curve_cal_param_disper(s,v,a,j);

[pp,v,a,jerk] = s_curve_cal_pvaj_disper(n,jerk);


plot(v,'b')