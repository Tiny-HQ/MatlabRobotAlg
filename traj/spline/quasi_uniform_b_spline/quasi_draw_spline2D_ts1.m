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

Ts = 0.003;

shoes = load('shoes_cooper.txt');
x = shoes(:,1);
y = shoes(:,2);
z = shoes(:,3);
n = length(x);
x_ = zeros(1,ceil(n/3)-1);
y_ = zeros(1,ceil(n/3)-1);

for i = 1:n
    if(rem(i,3) == 0)
        x_(floor(i/3)+rem(i,3)) = x(i);
        y_(floor(i/3)+rem(i,3)) = y(i);
    end
end
P = [x_;
     y_];

n = length(P)-1;
k = 4;
tic;
node_vector = quasi_uniform_b_create_knots_ext(n, k);


[total_x,total_y] = draw_spline2D(n,k,P,node_vector,Ts);
toc;
figure;
subplot(2,1,1);
plot(total_x,total_y);
total_x_vel = diff(total_x/0.004);
total_y_vel = diff(total_y/0.004);
v = sqrt(total_x_vel.^2+total_y_vel.^2);
subplot(2,1,2);
plot(v*1000,'*');















