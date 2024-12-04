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

Ts = 0.004;

P = [1 1 1 5 3 6 9 8 7 20 30 12 1 1 1;
     1 1 1 3 6 5 9 8 2 12 30 20 1 1 1;
     1 1 1 8 6 3 4 9 2 3  2  6  1 1 1;
     1 1 1 3 5 8 9 2 1 3  5  1  1 1 1;
     1 1 1 6 2 5 9 6 3 5  3  5  1 1 1;
     1 1 1 8 9 6 4 7 6 3  6  9  1 1 1];

n = length(P)-1;
k = 3;
tic;
node_vector = quasi_uniform_b_create_knots_ext(n, k);

x = draw_spline6D(n,k,P',node_vector,Ts);

plot(x(1,:));hold on;
plot(x(2,:));hold on;
plot(x(3,:));hold on;
plot(x(4,:));hold on;
plot(x(5,:));hold on;
plot(x(6,:));hold on;

figure;
plot(diff(x(1,:)/Ts));




