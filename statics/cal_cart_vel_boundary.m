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


clear;
clc;
format long g;

%a?0???5;
%alpha?0???5;
%d?1???6;
%theta?1???6;
%
%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|         q1|         d1|         a0|     alpha0|          0|
%|  2|         q2|         d2|         a1|     alpha1|          0|
%|  3|          0|         q3|         a2|     alpha2|          0|
%|  4|         q4|         d4|         a3|     alpha3|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|        0.0|        0.0|        0.0|          0|
%|  2|          0|        0.0|        325|        0.0|          0|
%|  3|          0|        0.0|        275|        0.0|          0|
%|  4|          0|        0.0|        0.0|        0.0|          0|
%+---+-----------+-----------+-----------+-----------+-----------+



DH.a(1) = 0.0;
DH.a(2) = 225;%??1???;
DH.a(3) = 175;%??2???;
DH.a(4) = 0;


DH.alpha(1) = 0.0;
DH.alpha(2) = 0.0;
DH.alpha(3) = 0.0;
DH.alpha(4) = 0.0;

DH.d(1) = 0;
DH.d(2) = 0.0;
DH.d(3) = 0.0;
DH.d(4) = 0.0;


DH.theta(1) = 0.0;
DH.theta(2) = 0.0;
DH.theta(3) = 0.0;
DH.theta(4) = 0.0;

num = 1000;

%?????????
%????,???,???mm??
qlimit_positive = [132,150,2,360];
qlimit_negative = [-132,-150,-190,-360];
%?????,???/s;
qv = [375 600 0 1875]*0.7;
qv(1) = qv(1)*pi/180.0;qv(2) = qv(2)*pi/180.0;qv(3) = qv(3);qv(4) = qv(4)*pi/180.0;
q = zeros(1,4);

path_vel = zeros(1,num);

for i = 1:num
    q(1) = (2*rand()-1)*qlimit_positive(1);
    q(2) = (2*rand()-1)*qlimit_positive(2);
    q(3) = 0.0;
    q(4) = (2*rand()-1)*qlimit_positive(4);
    J1 = scara_jacobian(DH,q,'deg');
    vel = J1*qv';
    path_vel(i) =  sqrt(vel(1)^2+vel(2)^2+vel(3)^2);
end

figure;
plot(path_vel,'*');
