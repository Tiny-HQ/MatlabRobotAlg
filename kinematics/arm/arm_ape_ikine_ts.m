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
% a1 = 0.163655; a2 = 0.550739;a3 = 0.208847;d1 =0.43; d3 = -0.001279;d4 = 0.700029;d6 = 0.115;
% L1 = 367;
% L2 = 420.7567;
% L3 = 46.4259;
% L4 = 417.6788;
% L5 = 83.5;
% L6 = 48.8438;
% L7 = 0.9755;


L1 = 270;
L2 = 210.0;
L3 = 75;
L4 = 229;
L5 = 75;
L6 = 0.0;
L7 = 0.0;

d1=L1;
a3=L2;
a4=L3;
d4=L4;
d6=L5;
a2=L6;
d3=L7;



DH.a(1) = 0.0;%�����Ǵ�0��ʼ��;matlab����ֻ�ܴ�1��ʼ;
DH.a(2) = a2;
DH.a(3) = a3;
DH.a(4) = a4;
DH.a(5) = 0.0;
DH.a(6) = 0.0;

DH.alpha(1) = 0.0;%�����Ǵ�0��ʼ��;
DH.alpha(2) = 90;
DH.alpha(3) = 0.0;
DH.alpha(4) = 90;
DH.alpha(5) = -90;
DH.alpha(6) = 90;

DH.d(1) = d1;
DH.d(2) = 0.0;
DH.d(3) = d3;
DH.d(4) = d4;
DH.d(5) = 0.0;
DH.d(6) = d6;

DH.theta(1) = 0.0;
DH.theta(2) = 0.0;
DH.theta(3) = 0.0;
DH.theta(4) = 0.0;
DH.theta(5) = 0.0;
DH.theta(6) = 0.0;

%q = [60 90+50 30 90 50 23];
q = [0 90 0 0 0 0];
q = [50.4408 18.0346+90 14.1673 -78.899 -89.2832 44.242]

[T,sh,el,wri] = arm_fkine_dh(q,DH,'deg','deg')

htr2zyz(T)
% P = [120.362614  30.154453  645.114596  -32.979278  98.988908  167.031307];
%P = [203 84 568 149 70 -5.3];
%T = cs_define_zyzeul(P);
q = arm_ikine_dh(T,DH,1,-1,-1,'deg','deg')


% 
% [T,shoulder,elbow,wrist] = arm_fkine_dh(q,DH,'deg','deg')
% 
% q(2) = q(2)-90;
% q
% 
% q = [-2.8711  -43.8505  -13.2762   -0.0000  -32.8734    -10.11];
% q(2) = q(2)+90;
% [T,shoulder,elbow,wrist] = arm_fkine_dh(q,DH,'deg','deg')
% 
% htr2zyz(T)
