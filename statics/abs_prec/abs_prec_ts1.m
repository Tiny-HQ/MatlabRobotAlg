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
%���Ծ�������;




clc;
clear;

near_zero = 0.001;

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
%|  1|          0|       0.43|        0.0|        0.0|          0|
%|  2|         90|        0.0|   0.163655|         90|          0|
%|  3|          0|  -0.001279|   0.550739|        0.0|          0|
%|  4|          0|   0.700029|   0.208847|         90|          0|
%|  5|          0|        0.0|        0.0|        -90|          0|
%|  6|          0|      0.115|        0.0|         90|          0|
%+---+-----------+-----------+-----------+-----------+-----------+


%ape sv90
L1 = 367;
L2 = 420.7567;
L3 = 46.4259;
L4 = 417.6788;
L5 = 83.5;
L6 = 48.8438;
L7 = 0.9755;

format long g;

syms q1 q2 q3 q4 q5 q6 'real';
syms d1 d3 d4 d6 'real';
syms a1 a2 a3 'real';
syms tx ty tz 'real';

% a1 = 0.163655; a2 = 0.550739;a3 = 0.208847;d1 =0.43; d3 = -0.001279;d4 = 0.700029;d6 = 0.115;
% q1 = pi/3;q2 = pi/2;q3 = pi/3;q4 = pi/4;q5 = pi/5;q6 = pi/6;
% tx = 0.0;ty = 0.0; tz = 0.0;

al = [0.0 pi/2 0 pi/2 -pi/2 pi/2];
a = [0 a1 a2 a3 0 0];
d = [d1 0 d3 d4 0 d6];
q = [q1 q2 q3 q4 q5 q6];

% d1=L1;a1=L6;a2=L2;a3=L3;d4=L4;d3=L7;a6=L5;


ca = cos(al(1));sa = sin(al(1));
if(abs(ca)<near_zero)    ca = 0.0;end
if(abs(sa)<near_zero)    sa = 0.0;end
T01 = [cos(q(1)) -sin(q(1)) 0 a(1);sin(q(1))*ca cos(q(1))*ca -sa -sa*d(1);sin(q(1))*sa cos(q(1))*sa ca d(1)*ca;0 0 0 1];
    
T01_dq1 = diff(T01,q1)
T01_dd1 = diff(T01,d1)

ca = cos(al(2));sa = sin(al(2));
if(abs(ca)<near_zero)    ca = 0.0;end
if(abs(sa)<near_zero)    sa = 0.0;end
T12 = [cos(q(2)) -sin(q(2)) 0 a(2); sin(q(2))*ca cos(q(2))*ca -sa -sa*d(2);sin(q(2))*sa cos(q(2))*sa ca d(2)*ca;0 0 0 1];
T12_dq2 = diff(T12,q2) 
T12_da2 = diff(T12,a1)
   
ca = cos(al(3));sa = sin(al(3));
if(abs(ca)<near_zero)    ca = 0.0;end
if(abs(sa)<near_zero)    sa = 0.0;end
T23 = [cos(q(3)) -sin(q(3)) 0 a(3); sin(q(3))*ca cos(q(3))*ca -sa -sa*d(3); sin(q(3))*sa cos(q(3))*sa ca d(3)*ca; 0 0 0 1];
T23_dq3 = diff(T23,q3)  
T23_da3 = diff(T23,a2)  
T23_dd3 = diff(T23,d3)  


ca = cos(al(4));sa = sin(al(4));
if(abs(ca)<near_zero)    ca = 0.0;end
if(abs(sa)<near_zero)    sa = 0.0;end
T34 = [cos(q(4)) -sin(q(4)) 0 a(4); sin(q(4))*ca cos(q(4))*ca -sa -sa*d(4);sin(q(4))*sa cos(q(4))*sa ca d(4)*ca;0 0 0 1];
T34_dq4 = diff(T34,q4)   
T34_da4 = diff(T34,a3)  
T34_dd4 = diff(T34,d4)   

   

ca = cos(al(5));sa = sin(al(5));
if(abs(ca)<near_zero)    ca = 0.0;end
if(abs(sa)<near_zero)    sa = 0.0;end
T45 = [cos(q(5)) -sin(q(5)) 0 a(5); sin(q(5))*ca cos(q(5))*ca -sa -sa*d(5); sin(q(5))*sa cos(q(5))*sa ca d(5)*ca; 0 0 0 1];
 T45_dq5 = diff(T45,q5) 

ca = cos(al(6));sa = sin(al(6));
if(abs(ca)<near_zero)    ca = 0.0;end
if(abs(sa)<near_zero)    sa = 0.0;end
T56 = [cos(q(6)) -sin(q(6)) 0 a(6); sin(q(6))*ca cos(q(6))*ca -sa -sa*d(6); sin(q(6))*sa cos(q(6))*sa ca d(6)*ca; 0 0 0 1];
T56_dq6 = diff(T56,q6)
T56_dd6 = diff(T56,d6)
   
P_tool = [tx ty tz 1]';
T_tcp = T01*T12*T23*T34*T45*T56*P_tool;

af_aq1 = T01_dq1*T12*T23*T34*T45*T56*P_tool;
af_ad1 = T01_dd1*T12*T23*T34*T45*T56*P_tool;

af_aq2 = T01*T12_dq2*T23*T34*T45*T56*P_tool;
af_aa2 = T01*T12_da2*T23*T34*T45*T56*P_tool;

af_aq3 = T01*T12*T23_dq3*T34*T45*T56*P_tool;
af_aa3 = T01*T12*T23_da3*T34*T45*T56*P_tool;
af_ad3 = T01*T12*T23_dd3*T34*T45*T56*P_tool;

af_aq4 = T01*T12*T23*T34_dq4*T45*T56*P_tool;
af_aa4 = T01*T12*T23*T34_da4*T45*T56*P_tool;
af_ad4 = T01*T12*T23*T34_dd4*T45*T56*P_tool;

af_aq5 = T01*T12*T23*T34*T45_dq5*T56*P_tool;

af_aq6 = T01*T12*T23*T34*T45*T56_dq6*P_tool;
af_ad6 = T01*T12*T23*T34*T45*T56_dd6*P_tool;

af_at = T01*T12*T23*T34*T45*T56*[1 1 1 1]';

af = [af_aq1 af_ad1 af_aq2 af_aa2 af_aq3 af_aa3 af_ad3 af_aq4 af_aa4 af_ad4 af_aq5 af_aq6 af_ad6 af_at];












