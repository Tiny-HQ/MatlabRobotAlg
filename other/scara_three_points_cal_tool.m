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

P1 = [520.39 160.02 157.31 37.297 179.896 62.811];
P2 = [554.81 206.16 157.31 37.318 179.896 79.287];
P3 = [598.75 239.28 157.31 37.311 179.896 94.955];

[pc,r,theta] = cal_arc_param1(P1(1:3),P2(1:3),P3(1:3));

T1 = cs_define_zyzeul(P1);
T2 = cs_define_zyzeul(P2);
T3 = cs_define_zyzeul(P3);

Tcp = zeros(1,6);
Tcp(1:3) = pc;
T_tcp = cs_define_zyzeul(Tcp);

T_tool1 = T1\T_tcp
T_tool2 = T2\T_tcp
T_tool3 = T3\T_tcp


T1*T_tool1
T2*T_tool2
T3*T_tool3


