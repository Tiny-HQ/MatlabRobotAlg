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


t_int = 0.001;% 1ms


ss1 = 13;
se1 = 90;
vs1 = 5;
ve1 = 20;
v_max = 30;
A = 100;
J = 100;

ss2 = 90;
se2 = 150;
vs2 = 20;
ve2 = 15;

[t1,je1,error] = s_curve_all_parameter_cal_para(ss1,se1,vs1,ve1,v_max,A,J);
[s1,v1,a1,jerk1,t_e1] = s_curve_all_parameter_cal_traj(t1,t_int,je1,vs1,ss1,0.0);


[t2,je2,error] = s_curve_all_parameter_cal_para(ss2,se2,vs2,ve2,v_max,A,J);
[s2,v2,a2,jerk2,t_e] = s_curve_all_parameter_cal_traj(t2,t_int,je2,vs2,ss2,t_e1);

l = length(s1)+length(s2);
s = zeros(1,l);
v = zeros(1,l);
a = zeros(1,l);
jer= zeros(1,l);
s(1:length(s1))= s1;
s(length(s1)+1:l) = s2;
v(1:length(s1))= v1;
v(length(s1)+1:l) = v2;
a(1:length(s1))= a1;
a(length(s1)+1:l) = a2;
jer(1:length(s1))= jerk1;
jer(length(s1)+1:l) = jerk2;



subplot(4,1,1);
plot(s,'g');
subplot(4,1,2);
plot(v,'b');hold on;plot(diff(s/t_int));
subplot(4,1,3);
plot(a,'r');
subplot(4,1,4);
plot(jer,'y');