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


t_int = 0.001;% 1ms

%% 1. 
% ss = 13;
% se = 90;
% vs = 30;
% ve = 30;
% v_max = 30;
% A = 100;
% J = 100;

%% 2. 
% ss = 13;
% se = 90;
% vs = 30;
% ve = 20;
% v_max = 30;
% A = 100;
% J = 100;
%% 3. 
% ss = 13;
% se = 90;
% vs = 10;
% ve = 30;
% v_max = 30;
% A = 100;
% J = 100;

%% 4. 
% ss = 13;
% se = 90;
% vs = 10;
% ve = 3;
% v_max = 30;
% A = 40;
% J = 100;

%% 5. 
ss = 13;
se = 23;
vs = 10;
ve = 20;
v_max = 30;
A = 100;
J = 100;
%% 6. 
% ss = 13;
% se = 20;
% vs = 10;
% ve = 20;
% v_max = 30;
% A = 100;
% J = 100;


%% error param 
% ss = 170.91;
% se = 177.1290;
% vs = 0.7064;
% ve = 23;
% v_max = 120;
% A = 100;
% J = 100;


[t,je,error] = s_curve_all_parameter_cal_para(ss,se,vs,ve,v_max,A,J);
 if(error == 0)% report error show 
    [s,v,a,jerk,t_e] = s_curve_all_parameter_cal_traj(t,t_int,je,vs,ss,0.0);
    subplot(4,1,1);
    plot(s,'g');
    subplot(4,1,2);
    plot(v,'b');hold on;plot(diff(s/t_int));
    subplot(4,1,3);
    plot(a,'r');
    subplot(4,1,4);
    plot(jerk,'y');
 end











