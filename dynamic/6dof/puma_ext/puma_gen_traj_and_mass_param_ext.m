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
%|  1|          0|          0|        0.0|        0.0|          0|
%|  2|          0|         d2|        0.0|        -90|          0|
%|  3|       -180|          0|         a3|        0.0|          0|
%|  4|          0|         d4|          0|        -90|          0|
%|  5|          0|          0|        0.0|         90|          0|
%|  6|        180|         d6|        0.0|        -90|          0|
%+---+-----------+-----------+-----------+-----------+-----------+


clear;
clc;

global Ts ;
Ts = 0.01;

format long g;

total_time = 5.0;
t = 0:Ts:total_time;
le = length(t);
zero = zeros(1,le);
one = ones(1,le);



pos1 = 0.4*sin(t)*180.0/pi; vel1 = 0.4*sin(t+pi/2)*180.0/pi; acc1 = 0.4*sin(t+pi)*180.0/pi;
pos2 = 1.2*pos1; vel2 = 1.2*vel1; acc2 = 1.2*acc1;
pos3 = 0.5*pos1; vel3 = 0.5*vel1; acc3 = 0.5*acc1;
pos4 = 0.5*pos1; vel4 = 0.5*vel1; acc4 = 0.5*acc1;
pos5 = -2.0*pos1; vel5 = -2.0*vel1; acc5 = -2.0*acc1;
pos6 = 2.5*pos1; vel6 = 2.5*vel1; acc6 = 2.5*acc1;


q1 = [t',pos1']; dq1 = [t',vel1']; ddq1 = [t',acc1'];
q2 = [t',pos2']; dq2 = [t',vel2']; ddq2 = [t',acc2'];
q3 = [t',pos3']; dq3 = [t',vel3']; ddq3 = [t',acc3'];
q4 = [t',pos4']; dq4 = [t',vel4']; ddq4 = [t',acc4'];
q5 = [t',pos5']; dq5 = [t',vel5']; ddq5 = [t',acc5'];
q6 = [t',pos6']; dq6 = [t',vel6']; ddq6 = [t',acc6'];

 %q1 = [t',zero']; dq1 = [t',zero']; ddq1 = [t',zero'];
 %q2 = [t',zero']; dq2 = [t',zero']; ddq2 = [t',zero'];
 %q3 = [t',zero']; dq3 = [t',zero']; ddq3 = [t',zero'];
%q4 = [t',zero']; dq4 = [t',zero']; ddq4 = [t',zero'];
%q5 = [t',zero']; dq5 = [t',zero']; ddq5 = [t',zero'];
%q6 = [t',zero']; dq6 = [t',zero']; ddq6 = [t',zero'];




%??????;

global g a2 a3 d4 d3 m1 m2 m3 m4 m5 m6;
global ic1 ic2 ic3 ic4 ic5 ic6;
global Pc111 Pc222 Pc333 Pc444 Pc555 Pc666;
global P001 P112 P223 P334 P445 P556 P667;

global ii1 ii2 ii3 ii4 ii5 ii6 U_r;

g = 9.80665;
a2 = 400e-3; a3 = 30e-3; d3 = 125e-3; d4 = 430e-3;
m1 = 12.65615427;  m2 = 41.52453758;  m3 = 9.95151214;  m4 = 1.32832452;m5 = 0.21689844; m6 = 0.32891048;

Pc111 = [ 0 18.97808196e-3 -4.26387031e-3 ]';
Pc222 = [ 70.91581478e-3 0.00000000 211.69489465e-3-d3 ]';
Pc333 = [ 17.56050216e-3 119.38037782e-3 0 ]';
Pc444 = [ 0 0 -32.52388888e-3 ]';
Pc555 = [ 0 -6.06453643e-3 0 ]';
Pc666 = [ 0 0 93.94499327e-3 ]';

P001 = [ 0 0 0 ]';
P112 = [ 0 d3 0 ]';%????P112=[0 0 0],??matlab??????d3????,??????,???Pc222?z??d3;
P223 = [ a2 0 0 ]';%[ 400e-3 0 125e-3 ]
P334 = [ a3 d4 0 ]';%[30e-3 430e-3 0]
P445 = [ 0 0 0 ]';
P556 = [ 0 0 0 ]';
P667 = [ 0 0 0 ]';                                 
ic1=[ 77887.93599651e-6, -0.00013107e-6, 0.00000935e-6;
			-0.00013107e-6, 38765.56757892e-6, -1024.13710067e-6;
			0.00000935e-6, -1024.13710067e-6, 76421.19395059e-6 ];  

ic2=[ 214693.97411152e-6, 0, -9732.69714079e-6;
			0, 1320311.93407017e-6, 0;
			-9732.69714079e-6, 0, 1453166.76852061e-6 ];

ic3=[ 155440.16360976e-6, -7644.06665755e-6, 0.00000000;
			 -7644.06665755e-6, 14717.44285625e-6, 0.00000000;
			 0.00000000, 0.00000000, 159542.66018410e-6];   

ic4=[ 2247.32396481e-6, 0.00000000, 0.00000000;
			 0.00000000, 2142.45317996e-6, 0.00000000;
			 0.00000000, 0.00000000, 1379.61893640e-6];


ic5=[103.66681738e-6, 0.00000001e-6, -0.00000014e-6;
			 0.00000001e-6, 62.31416822e-6, 0.00000004e-6;
			 -0.00000014e-6, 0.00000004e-6, 89.36267693e-6];

ic6=[311.60326416e-6, -0.00000017e-6, 0.00000000;
			 -0.00000017e-6, 148.54574141e-6, 0.00000000;
			 0.00000000, 0.00000000, 223.48915117e-6];


 ii1 = ic1+m1*(Pc111'*Pc111*eye(3)-Pc111*Pc111');
 ii2 = ic2+m2*(Pc222'*Pc222*eye(3)-Pc222*Pc222');
 ii3 = ic3+m3*(Pc333'*Pc333*eye(3)-Pc333*Pc333');
 ii4 = ic4+m4*(Pc444'*Pc444*eye(3)-Pc444*Pc444');
 ii5 = ic5+m5*(Pc555'*Pc555*eye(3)-Pc555*Pc555');
 ii6 = ic6+m6*(Pc666'*Pc666*eye(3)-Pc666*Pc666');


