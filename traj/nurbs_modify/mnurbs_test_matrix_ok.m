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
last_value = 5;
u = 0:Ts:last_value;
  
%define nurbs curve control point and weight;
P = [0 10 1;
    1 12 -5;
    5 2 9;
    6 33 -11;
    10 55 15 ;
    20 20 -17;
    25 -11 20;
    28 -23 -25;
    39 33 28;
    45 50 36;]; % ?????  
% P = [0 10 1;1 12 -5;5 2 9;6 33 -11;10 55 15 ;23 -20 17;25 -11 20;28 -23 -25;39 33 28;45 50 36;]; % modify one of control point, figure only change one part of them. 

Wx = [1 ;2;3;4;6 ;1 ;2;3;5;6 ]; % ??  
%Wx = [1 ;1;1;1;1 ;1 ;1;1;1;1 ]; % ?? 
Wy = [1 ;1;1;1;1 ;1 ;1;1;1;1 ]; % ?? 
% Wy = [1 ;2;3;5;6 ;10 ;2;3;4;6 ]; % ??  
 Wz = [1 ;1;1;1;1 ;1 ;1;1;1;1 ]; % ?? 
% Wz = [1 ;2;4;5;6 ;10 ;3;4;5;6 ]; % ??  
  
% ?? NURBS ????  
k = 3; % ????  
[m,n] = size(P);
u_vec = mnurbs_cal_knot_ext(k,m,last_value);
Cu = zeros(length(u),3);


for j = 1:length(u)

    %i = floor(u(j)/Ts);%determin index of knot vector;
    Cu(j,1) = mnurbs_cal_cu_matrix(u(j),k,u_vec,P(:,1),Wx);
    Cu(j,2) = mnurbs_cal_cu_matrix(u(j),k,u_vec,P(:,2),Wy);
    Cu(j,3) = mnurbs_cal_cu_matrix(u(j),k,u_vec,P(:,3),Wz);
end
Cu(1,1) = P(1,1);Cu(1,2) = P(1,2);Cu(1,3) = P(1,3);
Cu(length(u),1) = P(m,1);Cu(length(u),2) = P(m,2);Cu(length(u),3) = P(m,3);
plot3(Cu(:,1),Cu(:,2),Cu(:,3));hold on;
plot3(P(:,1),P(:,2),P(:,3))

figure;
plot(diff(Cu(:,1)));hold on;plot(diff(Cu(:,2)));hold on;plot(diff(Cu(:,3)));hold on;





