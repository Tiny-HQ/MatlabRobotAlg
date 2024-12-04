
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
format bank;
%
%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|         q1|         d1|         a0|     alpha0|          0|
%|  2|         q2|         d2|         a1|     alpha1|          0|
%|  3|         q3|         d3|         a2|     alpha2|          0|
%|  4|         q4|         d4|         a3|     alpha3|          0|
%|  5|         q5|         d5|         a4|     alpha4|          0|
%|  6|         q6|         d6|         a5|     alpha5|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|         d1|        0.0|        0.0|          0|
%|  2|          0|         d2|        0.0|        -90|          0|
%|  3|        -90|         d3|         l2|       -180|          0|
%|  4|          0|         d4|          0|        -90|          0|
%|  5|          0|          0|        0.0|        -90|          0|
%| 6*|          0|         d6|        0.0|         90|          0|
%|  6|          0|          0|         l6|          0|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

syms nx ny nz ox oy oz ax ay az px py pz;
syms d1 a2 a3 d4 d5 d6 l1 l2 l3 l4 l5 l6 d2 d3;
syms q1 q2 q3 q4 q5 q6;
syms c1 c2 c3 c4 c5 c6 s1 s2 s3 s4 s5 s6

syms T01 T12 T23 T34 T45 T56;
syms T01_1 T12_1 T23_1 T34_1 T45_1 T56_1;





T01 = [c1 -s1 0 0;s1 c1 0 0;0 0 1 0; 0 0 0 1]
%T01_1 = [c1 s1 0 0; -s1 c1 0 0;0 0 1 0; 0 0 0 1];



T12 = [c2 -s2 0 0;0 0 1 d2; -s2 -c2 0 0;0 0 0 1;]
%T12_1 = T12';

T23 = [c3 -s3 0 l2;s3 c3 0 0;0 0 1 -d3; 0 0 0 1;]

T34 = [c4 -s4 0 0; 0 0 1 d4;-s4 -c4 0 0;0 0 0 1;]
T45 = [c5 -s5 0 0; 0 0 1 0;-s5 -c5 0 0; 0 0 0 1;]

T56_x = [0 -1 0 0; 0 0 -1 -d6;1 0 0 0;0 0 0 1]
T66 = [c6 -s6 0 l6;s6 c6 0 0;0 0 1 0;0 0 0 1]


T = [nx ox ax px;ny oy ay py;nz oz az pz; 0 0 0 1];

T12*T23

T01*T12*T23*T34*T45*T56_x*T66

T*T56_x*T66

T01*T12*T23*T34*T45*T56_x


