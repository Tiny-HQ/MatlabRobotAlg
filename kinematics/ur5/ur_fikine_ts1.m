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
%a��0��ʼ��5;  a starts from 0 to 5; 
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
%|  1|          0|         d1|        0.0|        0.0|          0|
%|  2|        180|        0.0|        0.0|         90|          0|
%|  3|          0|        0.0|         a3|        0.0|          0|
%|  4|          0|         d4|         a4|        0.0|          0|
%|  5|          0|         d5|        0.0|        -90|          0|
%|  6|        180|         d6|        0.0|         90|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|      162.5|        0.0|        0.0|          0|
%|  2|        180|        0.0|        0.0|         90|          0|
%|  3|          0|        0.0|      425.0|        0.0|          0|
%|  4|          0|      133.3|     392.25|        0.0|          0|
%|  5|          0|       99.7|        0.0|        -90|          0|
%|  6|        180|       99.6|        0.0|         90|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

% DH.a(1) = 0.0;%�����Ǵ�0��ʼ��;matlab����ֻ�ܴ�1��ʼ; Here it starts at 0; MATLAB arrays can only start at 1;
% DH.a(2) = 0.0;
% DH.a(3) = 425.0;
% DH.a(4) = 392.25;
% DH.a(5) = 0.0;
% DH.a(6) = 0.0;
% 
% DH.alpha(1) = 0.0;%�����Ǵ�0��ʼ��; Here it starts at 0;
% DH.alpha(2) = 90;
% DH.alpha(3) = 0.0;
% DH.alpha(4) = 0.0;
% DH.alpha(5) = -90;
% DH.alpha(6) = 90;
% 
% DH.d(1) = 162.5;
% DH.d(2) = 0.0;
% DH.d(3) = 0.0;
% DH.d(4) = 133.3;
% DH.d(5) = 99.7;
% DH.d(6) = 99.6;

%dobot
DH.a(1) = 0.0;
DH.a(2) = 0.0;
DH.a(3) = 425.0;
DH.a(4) = 392.430;
DH.a(5) = 0.0;
DH.a(6) = 0.0;

DH.alpha(1) = 0.0;%�����Ǵ�0��ʼ��;Here it starts at 0;
DH.alpha(2) = 90;
DH.alpha(3) = 0.0;
DH.alpha(4) = 0.0;
DH.alpha(5) = -90;
DH.alpha(6) = 90;

DH.d(1) = 89.200;
DH.d(2) = 0.0;
DH.d(3) = 0.0;
DH.d(4) = 109.000;
DH.d(5) = 93.650;
DH.d(6) = 82.000;

DH.theta(1) = 0.0;%�����Ǵ�0��ʼ��; Here it starts at 0;
DH.theta(2) = 180;
DH.theta(3) = 0.0;
DH.theta(4) = 0.0;
DH.theta(5) = 0.0;
DH.theta(6) = 180;


%ur5e
% format bank;
% DH.a(1) = 0.0;
% DH.a(2) = 0.0;
% DH.a(3) = 425.0;
% DH.a(4) = 392.25;
% DH.a(5) = 0.0;
% DH.a(6) = 0.0;
% 
% DH.alpha(1) = 0.0;%�����Ǵ�0��ʼ��; Here it starts at 0;
% DH.alpha(2) = 90;
% DH.alpha(3) = 0.0;
% DH.alpha(4) = 0.0;
% DH.alpha(5) = -90;
% DH.alpha(6) = 90;
% 
% DH.d(1) = 162.5;
% DH.d(2) = 0.0;
% DH.d(3) = 0.0;
% DH.d(4) = 133.3;
% DH.d(5) = 99.7;
% DH.d(6) = 99.6;
% 
% DH.theta(1) = 0.0;%�����Ǵ�0��ʼ��; Here it starts at 0;
% DH.theta(2) = 180;
% DH.theta(3) = 0.0;
% DH.theta(4) = 0.0;
% DH.theta(5) = 0.0;
% DH.theta(6) = 180;

q = [-10.63 -35.33 -89.57 -151.64 48.19 -35.01];
%q = [-117.10 -134.90 -43.18 178.09 -162.10 70.37];
%cart_pos = [  -96.8564  -83.5336  623.7122 -177.5182  -45.6267   75.9659]

[T] = ur5_fkine(q,DH,'deg')


htr2zyx(T)
ur5_ikine(DH,T)





