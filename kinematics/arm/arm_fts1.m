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




syms theta1 theta2 theta3 theta4 theta5 theta6 real;
deg = pi/180.0;



%model1...error!
% d1 = 0.43;a1 = 0.163655;alpha1 = 90;
% d2 = 0;a2 = 0.550739;alpha2 = 0;
% d3 = -0.001279;a3 = 0.208847;alpha3 = 90;
% d4 = 0.700029;a4 = 0;alpha4 = -90;
% d5 = 0;a5 = 0;alpha5 = 90;
% d6 = 0.115;a6 = 0;alpha6 = 0;
% T01 = create_link(0,d1,alpha1,a1,'deg');
% T12 = create_link(90,d2,alpha2,a2,'deg');
% T23 = create_link(0,d3,alpha3,a3,'deg');
% T34 = create_link(0,d4,alpha4,a4,'deg');
% T45 = create_link(0,d5,alpha5,a5,'deg');
% T56 = create_link(0,d6,alpha6,a6,'deg');





%model2...ok!
alpha0 = 0;         a0 = 0;         theta1 = 0;     d1 = 0.43;
alpha1 = 90;        a1 = 0.163655;  theta2 = 90;    d2 = 0;
alpha2 = 0;         a2 = 0.550739;  theta3 = 0;     d3 = -0.001279;
alpha3 = 90;        a3 = 0.208847;  theta4 = 0;     d4 = 0.700029;
alpha4 = -90;       a4 =0;          theta5 = 0;     d5 = 0;
alpha5 = 90;        a5 = 0;         theta6 = 0;     d6 = 0.115;
T01 = create_link(theta1,d1,alpha0,a0,'deg');
T12 = create_link(theta2,d2,alpha1,a1,'deg');
T23 = create_link(theta3,d3,alpha2,a2,'deg');
T34 = create_link(theta4,d4,alpha3,a3,'deg');
T45 = create_link(theta5,d5,alpha4,a4,'deg');
T56 = create_link(theta6,d6,alpha5,a5,'deg');



% model3...ok!
% alpha0 = 0;       a0 = 0;         theta1 = 0;    d1 = 0.43;
% alpha1 = -90;     a1 = 0.163655;  theta2 = -90;   d2 = 0;
% alpha2 = 0;       a2 = 0.550739;  theta3 = 0;    d3 =  0.001279;
% alpha3 = -90;     a3 = 0.208847;  theta4 = 0;     d4 = 0.700029;
% alpha4 = 90;      a4 =0;          theta5 = 0;     d5 = 0;
% alpha5 = -90;     a5 = 0;         theta6 = 0;     d6 = 0.115;
% 
% T01 = create_link(theta1,d1,alpha0,a0,'deg');
% T12 = create_link(theta2,d2,alpha1,a1,'deg');
% T23 = create_link(theta3,d3,alpha2,a2,'deg');
% T34 = create_link(theta4,d4,alpha3,a3,'deg');
% T45 = create_link(theta5,d5,alpha4,a4,'deg');
% T56 = create_link(theta6,d6,alpha5,a5,'deg');
 




T = T01*T12*T23*T34*T45*T56


det(T)
% 
% 
% 
% L1 = Link('d',0.43,'a',0.163655,'alpha',pi/2,'qlim',[-165,165]*deg);
% L2 = Link('d',0,'a',0.550739,'alpha',0,'qlim',[-60,180]*deg);
%  L3 = Link('d',-0.001279,'a',0.208847,'alpha',pi/2,'qlim',[-85,135]*deg);
%  L4 = Link('d',0.700029,'a',0,'alpha',-pi/2,'qlim',[-360,360]*deg);
%  L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',[-135,135]*deg);
%   L6 = Link('d',0.115,'a',0,'alpha',0,'qlim',[-360,360]*deg);
% bot = SerialLink([L1 L2 L3 L4 L5 L6],'name','ER6C-C60');
% 
% bot.fkine([pi/4 pi/2 0 pi/4 0 0])
% 
% bot1 = SerialLink([L4 L5 L6],'name','ER6C-C601');
% bot1.fkine([0 0 0])




















