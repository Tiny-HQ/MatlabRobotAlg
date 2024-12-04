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
%plot 3d figure use nurbs...
% calculate the curvantrue of nurbs.

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
    45 50 36;]; % 控制点坐标   control point coodinate
% P = [0 10 1;1 12 -5;5 2 9;6 33 -11;10 55 15 ;23 -20 17;25 -11 20;28 -23 -25;39 33 28;45 50 36;]; % modify one of control point, figure only change one part of them. 

Wx = [1 ;2;3;4;6 ;1 ;2;3;5;6 ]; % 权重  weight
%Wx = [1 ;1;1;1;1 ;1 ;1;1;1;1 ]; % 权重 weight
Wy = [1 ;1;1;1;1 ;1 ;1;1;1;1 ]; % 权重 weight
% Wy = [1 ;2;3;5;6 ;10 ;2;3;4;6 ]; % 权重  weight
 Wz = [1 ;1;1;1;1 ;1 ;1;1;1;1 ]; % 权重 weight
% Wz = [1 ;2;4;5;6 ;10 ;3;4;5;6 ]; % 权重  weight
  
% 定义 NURBS 曲线度数  degree
k = 3; % 曲线度数  
[m,n] = size(P);
u_vec = mnurbs_cal_knot_ext(k,m,last_value);

Cu = zeros(length(u),3);
dCu = zeros(length(u),3);
ddCu = zeros(length(u),3);
k_c = zeros(length(u),1);

% px = nurbs_cal_cu(u(20),k,u_vec,P(:,1),Wx);

for j = 1:length(u)

    %i = floor(u(j)/Ts);%determin index of knot vector;
%     Cu(j,1) = nurbs_cal_cu(u(j),k,u_vec,P(:,1),Wx);
%     Cu(j,2) = nurbs_cal_cu(u(j),k,u_vec,P(:,2),Wy);
%     Cu(j,3) = nurbs_cal_cu(u(j),k,u_vec,P(:,3),Wz);
    
%  [Cu(j,1),  dCu(j,1)] = nurbs_cal_dcu_derivative(u(j),k,u_vec,P(:,1),Wx);
%  [Cu(j,2),   dCu(j,2)] = nurbs_cal_dcu_derivative(u(j),k,u_vec,P(:,2),Wy);
%  [Cu(j,3),   dCu(j,3)] = nurbs_cal_dcu_derivative(u(j),k,u_vec,P(:,3),Wz);
     
   [Cu(j,1),dCu(j,1),ddCu(j,1)] = mnurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,1),Wx);
   [Cu(j,2),dCu(j,2),ddCu(j,2)] = mnurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,2),Wy);
   [Cu(j,3),dCu(j,3),ddCu(j,3)] = mnurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,3),Wz);
    
    dcu = [dCu(j,1) dCu(j,2) dCu(j,3)];
    ddcu = [ddCu(j,1) ddCu(j,2) ddCu(j,3)];
    
    c_cross = cross(dcu,ddcu);  
     k_c(j) = sqrt(sum(c_cross.^2))/(sqrt(sum(dcu.^2)))^3;%curvature;
end

k_c(1) = k_c(2);%discard the first point;
figure;
plot(k_c);


figure;
Cu(1,1) = P(1,1);Cu(1,2) = P(1,2);Cu(1,3) = P(1,3);
Cu(length(u),1) = P(m,1);Cu(length(u),2) = P(m,2);Cu(length(u),3) = P(m,3);
plot3(Cu(:,1),Cu(:,2),Cu(:,3));
hold on;
plot3(P(:,1),P(:,2),P(:,3))
%according to the figure of curvantrue, i can find these point, at this
%point, the curvantrue is bigger than other points. from my sight, these
%point is matched.
hold on;
plot3(Cu(190,1),Cu(190,2),Cu(190,3),'o');
hold on;
plot3(Cu(654,1),Cu(654,2),Cu(654,3),'*');
hold on;
plot3(Cu(2081,1),Cu(2081,2),Cu(2081,3),'o');
hold on;
plot3(Cu(3573,1),Cu(3573,2),Cu(3573,3),'*');
hold on;
plot3(Cu(4075,1),Cu(4075,2),Cu(4075,3),'o');



