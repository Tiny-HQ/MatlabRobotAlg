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
% a1 = 0.163655; a2 = 0.550739;a3 = 0.208847;d1 =0.43; d3 = -0.001279;d4 = 0.700029;d6 = 0.115;
L1 = 367;
L2 = 420;
L3 = 45;
L4 = 415;
L5 = 83.5;
L6 = 50;
L7 = 3.2;

d1=L1;
a3=L2;
a4=L3;
d4=L4;
d6=L5;
a2=L6;
d3=L7;



DH.a(1) = 0.0;%这里是从0开始的;matlab数组只能从1开始;Here it starts at 0; MATLAB arrays can only start at 1;
DH.a(2) = a2;
DH.a(3) = a3;
DH.a(4) = a4;
DH.a(5) = 0.0;
DH.a(6) = 0.0;

DH.alpha(1) = 0.0;%这里是从0开始的; Here it starts at 0;
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

% q = [0 90 0 0 0 0];
% 
% arm_fkine_dh(q,DH,'deg','deg')


q = [-0.1 90+75.06 -41.74 0.02 69.68 217.64]

T = arm_fkine_dh(q,DH,'deg','deg')

 q = arm_ikine_dh(T,DH,-1,-1,1,'deg','deg')

% shoes = load('shoes_cooper.m');
% 
% [m,n] = size(shoes);
% 
% shoes(:,1) = shoes(:,1)*1000+200;shoes(:,2) = shoes(:,2)*1000;shoes(:,3) = shoes(:,3)*1000+200;
% shoes(:,4) = shoes(:,4)*180.0/pi-30;shoes(:,5) = shoes(:,5)*180.0/pi;shoes(:,6) = shoes(:,6)*180.0/pi;
% joint = zeros(m,n);
% 
% for i = 1:m
%     P = shoes(i,:);
%     T = cs_define_rpy(P);
%     q = arm_ikine_dh(T,DH,1,-1,1,'deg','deg');
%     q(2) = q(2)-90;
%     joint(i,:) = q;
%     
% end











