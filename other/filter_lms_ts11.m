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

close all;






Ts = 0.004;



Z = load('enc_pulse.txt');
Z = -Z;
N = length(Z);
V = diff(Z/Ts);
V(N) = V(N-1);


v = linspace(0,0,N-1);


xn = V;M  = 3 ;   % ??????
rho_max = max(eig(xn*xn.'));   % ??????????????
mu = (1/rho_max) ;    % ???? 0 < mu < 1/rho
mu = 0.7e-10;
%mu = 0.00001;
dn = linspace(3000,3000,N);
%mu = 0.001;
% [yn,W,en] = LMS(xn,dn,M,mu);
[yn,W,en] = LMS(xn,xn,M,mu);



plot(V);
hold on;
plot(yn);























