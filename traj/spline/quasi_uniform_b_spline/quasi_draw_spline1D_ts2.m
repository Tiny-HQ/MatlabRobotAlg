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

Ts = 0.0004;

P = [1 1 1 5 3 6 9 8 7 20 30 12 1 1 1];

n = length(P)-1;
k = 3;
tic;
node_vector = quasi_uniform_b_create_knots_ext(n, k);

x = draw_spline1D_f23_k3(n,k,P,node_vector,Ts);

figure;
subplot(3,1,1);
plot(x);
subplot(3,1,2);
vel = diff(x)/0.004;
plot(vel);
subplot(3,1,3);
acc = diff(vel/0.004);
plot(acc);







