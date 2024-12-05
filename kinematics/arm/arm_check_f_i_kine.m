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
%a��0��ʼ��5; a starts from 0 to 5;
%alpha��0��ʼ��5; alpha starts from 0 to 5;
%d��1��ʼ��6; d starts from 1 to 6;
%theta��1��ʼ��6; theta starts from 1 to 6;
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



% DH.a(1) = 0.0;%�����Ǵ�0��ʼ��;matlab����ֻ�ܴ�1��ʼ; Here it starts at 0; MATLAB arrays can only start at 1;
% DH.a(2) = 0.163655;
% DH.a(3) = 0.550739;
% DH.a(4) = 0.208847;
% DH.a(5) = 0.0;
% DH.a(6) = 0.0;
% 
% DH.alpha(1) = 0.0;%�����Ǵ�0��ʼ��; Here it starts at 0;
% DH.alpha(2) = 90;
% DH.alpha(3) = 0.0;
% DH.alpha(4) = 90;
% DH.alpha(5) = -90;
% DH.alpha(6) = 90;
% 
% DH.d(1) = 0.43;
% DH.d(2) = 0.0;
% DH.d(3) = -0.001279;
% DH.d(4) = 0.700029;
% DH.d(5) = 0.0;
% DH.d(6) = 0.115;

DH.a(1) = 0.0;%�����Ǵ�0��ʼ��;matlab����ֻ�ܴ�1��ʼ;Here it starts at 0; MATLAB arrays can only start at 1;
DH.a(2) = 0.163655;
DH.a(3) = 0.550739;
DH.a(4) = 0.208847;
DH.a(5) = 0.0;
DH.a(6) = 0.0;

DH.alpha(1) = 0.0;%�����Ǵ�0��ʼ��;Here it starts at 0;
DH.alpha(2) = 90;
DH.alpha(3) = 0.0;
DH.alpha(4) = 90;
DH.alpha(5) = -90;
DH.alpha(6) = 90;

DH.d(1) = 0.43;
DH.d(2) = 0.0;
DH.d(3) = -0.001279;
DH.d(4) = 0.700029;
DH.d(5) = 0.0;
DH.d(6) = 0.115;

DH.theta(1) = 0.0;
DH.theta(2) = 0.0;
DH.theta(3) = 0.0;
DH.theta(4) = 0.0;
DH.theta(5) = 0.0;
DH.theta(6) = 0.0;


 %q = [130 25 156 -40 20 -90]%(0-180�����;) (0-180 can be filled in casually; )
q = [0 90 0 0 0 0];%(0-180�����;) (0-180 can be filled in casually; )
q = [pi/3 pi/2 pi/3 pi/4 pi/5 pi/6]*180/pi;%(0-180�����;) (0-180 can be filled in casually; )
%q = [0 90 0 0 0 0];%(0-180�����;) (0-180 can be filled in casually; )

[T,shoulder,elbow,wrist] = arm_fkine_dh(q,DH,'deg','deg');
 T
% shoulder
% elbow
% wrist


% q_i = arm_ikine_dh(T,DH,shoulder,elbow,wrist,'deg','deg')



% q(2) = q(2)-90;%�����ĳ�ʼλ����dhλ�ø�90��; The initial position of the % spin is minus 90 degrees at the DH position;
%q = [92 -36 60 167 35 14]%(0-180�����;) (0-180 can be filled in casually; )
% [T1,shoulder1,elbow1,wrist1] = arm_fkine_sc(q,DH,'deg','deg');
%T1;
% shoulder1
% elbow1
% wrist1


% q_i1 = arm_ikine_sc(T1,DH,shoulder1,elbow1,wrist1,'deg','deg')























