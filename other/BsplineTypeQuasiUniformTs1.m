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


Ts = 0.004;
bsplineQu = load('BsplineTypeQuasiUniform.TXT');


x = bsplineQu(:,1);
y = bsplineQu(:,2);



vel_x = diff(x/Ts);
vel_y = diff(y/Ts);


figure;
subplot(2,1,1);
plot(bsplineQu(:,1),bsplineQu(:,2));
subplot(2,1,2);
v = sqrt(vel_x.^2+vel_y.^2);
plot(v,'o');

figure;

plot(bsplineQu(:,1),bsplineQu(:,2),'o');













