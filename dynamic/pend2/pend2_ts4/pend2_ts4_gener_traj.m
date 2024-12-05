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

%���ɹ켣����������;generation of trajectories and mass parameters;
% �޸ĵ�dh Modified DH
% ���˵Ĵ���ģ�� Approximate appearance of the connecting rod link
%                           ����ϵ3
%                             |
%                             |     L2 
%          ����ϵ1   _________|  ����ϵ2
%                   |   L1
%                 0 |
%
%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|         q1|         d1|         a0|     alpha0|          0|
%|  2|         q2|         d2|         a1|     alpha1|          0|
%|  3|         q3|         d3|         a2|     alpha2|          0|

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|         d1|        0.0|          0|          0|
%|  2|          0|     d2(L1)|        0.0|        -90|          0|
%|  3|          0|     d3(L2)|          0|         90|          0|


clear;
clc;
global Ts Pi g L1 L2 m1 m2 IC11 IC22 P01 P12 P23 PC11 PC22;

%min-paramter;
global Ii11 Ii22 U U_min_param;

Ts = 0.01;
Pi = 3.1415926;
g = 9.81;

m1 = 12.65615427;
m2 = 41.52453758;
L1 = 0.5;%
L2 = 0.5;

IC11 = [ 77887.93599651e-6, -0.00013107e-6, 0.00000935e-6;
			-0.00013107e-6, 38765.56757892e-6, -1024.13710067e-6;
			0.00000935e-6, -1024.13710067e-6, 76421.19395059e-6 ];
IC22 = [ 214693.97411152e-6, 0, -9732.69714079e-6;
			0, 1320311.93407017e-6, 0;
			-9732.69714079e-6, 0, 1453166.76852061e-6 ];

P01 = [0 0 0]';P12 = [0 L1 0]';P23 = [0 -L2 0]';
PC11 = [ 0 18.97808196e-3 -4.26387031e-3 ]';
PC22 = [ 70.91581478e-3 0.00000000 211.69489465e-3 ]';

Ii11 = IC11+m1*(PC11'*PC11*eye(3)-PC11*PC11');
Ii22 = IC22+m2*(PC22'*PC22*eye(3)-PC22*PC22');
 
total_time = 10.0;
i = 1;
t = 0:Ts:total_time;

pos1 = 0.8*sin(t)*180.0/pi; vel1 = 0.8*sin(t+pi/2)*180.0/pi; acc1 = 0.8*sin(t+pi)*180.0/pi;
pos2 = 1.2*pos1; vel2 = 1.2*vel1; acc2 = 1.2*acc1;

q1 = [t',pos1']; dq1 = [t',vel1']; ddq1 = [t',acc1'];
q2 = [t',pos2']; dq2 = [t',vel2']; ddq2 = [t',acc2'];

