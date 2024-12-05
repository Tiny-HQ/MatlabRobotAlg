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
%plot 3d figure use nurbs...

clc;
clear;
Ts = 0.001;
last_value = 2;
u = 0:Ts:last_value;
  
%define nurbs curve control point and weight;
Px = [0 ;1 ;3;6;10;20 ;25;28;39;45;]; % ���Ƶ�����   Control point coordinates
Py = [10 ;12;2;33;55;20 ;-11;-23;33;52;]; % ���Ƶ�����  Control point coordinates
Wx = [1 ;2;3;4;5;6 ;1 ;4;5;6 ]; % Ȩ�� weight  
Wy = [1 ;2;3;4;5 ;10 ;2;3;5;6 ]; % Ȩ��   weight


  
% ���� NURBS ���߶���    Define the degrees of the NURBS curve  
k = 3; % ���߶���   The degree of the curve
[m,n] = size(Px);
u_vec = nurbs_cal_knot(k,m,last_value);

  
Nik = zeros(1,length(u));
Cux = zeros(1,length(u));
Cuy = zeros(1,length(u));

[s] = nurbs_simpson_cal_length(Ts,last_value,u_vec,k,Px,Wx,Py,Wy)
tic;

% a = nurbs_cal_cu(0.9,k,u_vec,Px,Wx);

for j = 1:length(u)
%     if j == 2500
%         B = 10;
%     end
    %i = floor(u(j)/Ts);%determin index of knot vector;
    Cux(j) = nurbs_cal_cu(u(j),k,u_vec,Px,Wx);
    Cuy(j) = nurbs_cal_cu(u(j),k,u_vec,Py,Wy);
end
  
plot(Px,Py);hold on;
%let the first and end of curve point equals to the control point;
Cux(1) = Px(1);Cuy(1) = Py(1);
Cux(length(Cux)) = Px(length(Px));Cuy(length(Cuy)) = Py(length(Py));
plot(Cux,Cuy); hold on;
toc;

% figure;
% plot(diff(Cux/Ts));hold on;plot(diff(Cuy/Ts));
% figure;plot(diff(Cuy/Ts/Ts));


