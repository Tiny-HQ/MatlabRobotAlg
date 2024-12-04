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

syms a1 a2 d3;
syms q1 q2 q4


T01 = trotx(0.0)*transl(0.0,0,0)*trotz(q1)*transl(0,0,0.0)
T12 = trotx(0.0)*transl(a1,0,0)*trotz(q2)*transl(0,0,0.0)
T23 = trotx(0.0)*transl(a2,0,0)*trotz(0.0)*transl(0,0,d3)
T34 = trotx(0.0)*transl(0.0,0,0)*trotz(q4)*transl(0,0,0.0)


syms c1 s1 c2 s2 c4 s4;
T_01 = [c1 -s1 0 0.0;
        s1 c1 0 0;
        0 0 1 0;
        0 0 0 1];
    
T_12 = [c2 -s2 0 a1;
        s2 c2 0 0;
        0 0 1 0;
        0 0 0 1];

T_23 = [1 0 0 a2;
        0 1 0 0;
        0 0 1 d3;
        0 0 0 1];

T_34 = [c4 -s4 0 0;
        s4 c4 0 0;
        0 0 1 0;
        0 0 0 1];


T_01*T_12*T_23*T_34












