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


%?????????????????;

D = 0;
V = 10.173;
A = 500;
A_set =1500;
J = 27210.65;
Ts = 0.004;

% D = 50;
% V = 1000;
% A = 1000;
% J = 1000;

% D = 50;
% V = 1000;
% A = 0;
% J = 10000;


[t,j] = stop_cal_param_sim_ext(V,A,A_set,J);
[p,v,a,jerk] = stop_cal_pvaj_ext(t,j,V,A,D,Ts);


% plot(p,'b');
% figure;
% plot(v,'r');
% hold on;
% plot(diff(p)/0.004,'g');

% v_ = diff(p)/0.004;
% v__ = v(2:length(v));
% figure;
% plot(v_-v__,'c');

% figure;
% plot(a,'g');

    subplot(4,1,1);plot(p,'b');grid on;hold on;
    subplot(4,1,2);plot(v,'r');grid on;hold on;
    subplot(4,1,3);plot(a,'g');grid on;hold on;
    subplot(4,1,4);plot(jerk,'g');grid on;hold on;






























