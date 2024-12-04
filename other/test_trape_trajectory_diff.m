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

Ts = 0.001;
vs = 0;
ve = 0;
s = 50;
a = 600;
v = 140;



[t,aa] = trape_cal_param(s,v,a);
[p,vv] = trape_cal_pvaj(t,a,Ts);

figure;
plot(vv);hold on;
plot(diff(p/Ts));

[t,acc,vc] = trape_ext_cal_param(vs,ve,v,a,s);
[S,V,A] = trape_ext_cal_pvaj(t,acc,vs,vc,ve,Ts);

plot(V);hold on;
plot(diff(S/Ts));






