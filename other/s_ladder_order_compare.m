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


N = 8;
S = 25;
V = 50;
A = 500;
D = 500;
J = 80000;
t_int = 0.001;

[t] = ladder_cal_param(N,S,V,A,D);
[s,v,a] = ladder_cal_pvaj(N,t,A,D,t_int);



[t1] = s_curve_cal_param_non_symmetry(S,V,A,D,J);
[s1,v1,a1,jerk1] = s_curve_cal_pvaj_non_symmetry(t1,J,t_int);

[t,aa,d] = trape_cal_param_ext(S,V,A,D);
[s2,v2,a2] = trape_cal_pvaj_ext(t,A,D,t_int);


%figure;
clf;
subplot(3,1,1);
plot(s);hold on; plot(s1);hold on;plot(s2);
legend('Ladder','S','Trape');
subplot(3,1,2);
plot(v);hold on;plot(v1);hold on; plot(v2);
%legend('Ladder','S','Trape');
subplot(3,1,3);
plot(a);hold on;plot(a1);hold on; plot(a2);
%legend('Ladder','S','Trape');




















