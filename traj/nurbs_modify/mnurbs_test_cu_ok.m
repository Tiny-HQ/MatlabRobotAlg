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
%plot 2d figure use nurbs...
%test second derivative ddcu and check.

clc;
clear;
Ts = 0.001;
last_value = 1;
u = 0:Ts:last_value;
  
%define nurbs curve control point and weight;
Px = [-5 ;1 ;5;6;10;20 ;25;28;39;45;]; % ���Ƶ�����  control point coodinate
Py = [10 ;12;2;33;55;20 ;-11;-23;33;52;]; % ���Ƶ�����  control point coodinate
Wx = [1 ;2;4;5;6 ;1 ;2;3;5;6 ]; % Ȩ��  weight
%Wx = [1 ;1;1;1;1 ;1 ;1;1;1;1 ]; % Ȩ�� weigth
Wy = [1 ;1;1;1;1 ;1 ;1;1;1;1 ]; % Ȩ�� weight
%Wy = [1 ;2;3;5;6 ;10 ;2;3;4;6 ]; % Ȩ��  weight


  
% ���� NURBS ���߶���  degree
k = 3; % ���߶���  
[m,n] = size(Px);
u_vec = mnurbs_cal_knot_ext(k,m,last_value);

  
Nik = zeros(1,length(u));
Cux = zeros(1,length(u));
Cuy = zeros(1,length(u));

tic;

% a = nurbs_cal_cu(0.9,k,u_vec,Px,Wx);

for j = 1:length(u)
%     if j == 2500
%         B = 10;
%     end
    %i = floor(u(j)/Ts);%determin index of knot vector;
    Cux(j) = mnurbs_cal_cu(u(j),k,u_vec,Px,Wx);
    Cuy(j) = mnurbs_cal_cu(u(j),k,u_vec,Py,Wy);
    
end
  toc;
% k_c(1) = k_c(2);%discard the first point;
Cux(length(u)) = Px(length(Px));Cux(1) = Px(1);
Cuy(length(u)) = Py(length(Px));Cuy(1) = Py(1);
%let the first and end of curve point equals to the control point;
figure;
plot(Cux,Cuy); 



% figure;
% plot(diff(Cux/Ts));hold on;plot(diff(Cuy/Ts));
% figure;plot(diff(Cuy/Ts/Ts));

