
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

t = [0 1.345 2 2.855];
x = [0 60.8 -9.36 10];

% t=[0 1 2 3 4];
% x=[0 1 4 9 16];
% t=1:1:100;
% for i=1:length(t)
%     x(i) = sin(i)+sin(i)*cos(i);
% end
Ts = 0.004;
tic;
[a,b,c,d]=c_spline_prm_calc_v3(t,x,0);
toc;
%point=zeros(1,1000000);
point = c_spline_point_calc(a,b,c,d,t,Ts);
plot(point);hold on;plot(t/0.004,x,'o');
figure;
plot(diff(point/0.004))
figure;
plot(diff(diff(point/0.004))/0.004)