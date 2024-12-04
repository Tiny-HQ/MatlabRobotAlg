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

clc;
clear;
Ts = 0.001;
last_value = 5;
u = 0:Ts:last_value;
  
%define nurbs curve control point and weight;
P = [0, 54.493, 52.139; 
0, 55.507, 52.139; 
0, 56.082, 49.615; 
0, 56.780, 44.971; 
0, 69.575, 51.358;
0, 77.786, 58.573; 
0, 90.526, 67.081; 
0, 105.973, 63.801; 
0, 100.400, 47.326;
0, 94.567, 39.913;
0, 92.369, 30.485; 
0, 83.440, 33.757; 
0, 91.892, 28.509; 
0, 89.444, 20.393; 
0, 83.218, 15.446;
0, 87.621, 4.830; 
0, 80.945, 9.267; 
0, 79.834, 14.535; 
0, 76.074, 8.522; 
0, 70.183, 12.550;
0, 64.171, 16.865; 
0, 59.993, 22.122; 
0, 55.680, 36.359; 
0, 56.925, 24.995; 
0, 59.765, 19.828;
0, 54.493, 14.940; 
0, 49.220, 19.828; 
0, 52.060, 24.994; 
0, 53.305, 36.359; 
0, 48.992, 22.122;
0, 44.814, 16.865; 
0, 38.802, 12.551; 
0, 32.911, 8.521; 
0, 29.152, 14.535; 
0, 28.040, 9.267;
0, 21.364, 4.830; 
0, 25.768, 15.447; 
0, 19.539, 20.391; 
0, 17.097, 28.512; 
0, 25.537, 33.750;
0, 16.602, 30.496; 
0, 14.199, 39.803; 
0, 8.668, 47.408;
0, 3.000, 63.794; 
0, 18.465, 67.084;
0, 31.197, 58.572; 
0, 39.411, 51.358; 
0, 52.204, 44.971; 
0, 52.904, 49.614; 
0, 53.478, 52.139;
0, 54.493, 52.139;]; 
w = [1.00, 1.00, 1.00, 1.20, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 2.00, 1.00, 1.00, 5.00, 3.00, 1.00,...
     1.10, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.000, 1.00, 1.10,...
     1.00, 3.00, 5.00, 1.00, 1.00, 2.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.20, 1.00, 1.00, 1.00];
%  
%  a = [0, 0, 0, 0, 0.0083, 0.0150, 0.0361, 0.0855, 0.1293, 0.1509, 0.1931, 0.2273, 0.2435, 0.2561,...
%                       0.2692, 0.2889, 0.3170, 0.3316, 0.3482, 0.3553, 0.3649, 0.3837, 0.4005, 0.4269, 0.4510,...
%                       0.4660, 0.4891, 0.5000, 0.5109, 0.5340, 0.5489, 0.5731, 0.5994, 0.6163, 0.6351, 0.6447,...
%                       0.6518, 0.6683, 0.6830, 0.7111, 0.7307, 0.7439, 0.7565, 0.7729, 0.8069, 0.8491, 0.8707,...
%                       0.9145, 0.9639, 0.9850, 0.9917, 1, 1, 1, 1] ;
  
% 定义 NURBS 曲线度数  
k = 3; % 曲线度数  
[m,n] = size(P);
u_vec = nurbs_cal_knot(k,m,last_value);

Cu = zeros(length(u),3);
dCu = zeros(length(u),3);
ddCu = zeros(length(u),3);
k_c = zeros(length(u),1);

tic;
s = nurbs_simpson_cal_length(u(1),u(length(u)),u_vec,k,P(:,1),w',P(:,2),w',P(:,3),w')
toc;
% px = nurbs_cal_cu(u(20),k,u_vec,P(:,1),Wx);
tic;
for j = 1:length(u)

    %i = floor(u(j)/Ts);%determin index of knot vector;
    [Cu(j,1),dCu(j,1),ddCu(j,1)] = nurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,1),w');
    [Cu(j,2),dCu(j,2),ddCu(j,2)] = nurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,2),w');
    [Cu(j,3),dCu(j,3),ddCu(j,3)] = nurbs_cal_ddcu_derivative(u(j),k,u_vec,P(:,3),w');
    
    dcu = [dCu(j,1) dCu(j,2) dCu(j,3)];
    ddcu = [ddCu(j,1) ddCu(j,2) ddCu(j,3)];
    
    c_cross = cross(dcu,ddcu);  
    k_c(j) = sqrt(sum(c_cross.^2))/(sqrt(sum(dcu.^2)))^3;%curvature;
    
end
toc;
k_c(1) = k_c(2);%discard the first point;
figure;
plot(k_c);

V_max = 30;
A_max = 100;
J_max = 500;
[k] = nurbs_cal_candidate_split_point(100,1000,5000,k_c);

Cu(1,1) = P(1,1);Cu(1,2) = P(1,2);Cu(1,3) = P(1,3);
Cu(length(u),1) = P(m,1);Cu(length(u),2) = P(m,2);Cu(length(u),3) = P(m,3);

le = 0.0;
for j = 1:length(u)
   if j>=2
        le = le+sqrt((Cu(j,1)-Cu(j-1,1))^2+(Cu(j,2)-Cu(j-1,2))^2+(Cu(j,3)-Cu(j-1,3))^2) ;       
   end 
end
le


figure;
plot3(Cu(:,2),Cu(:,3),Cu(:,1));hold on;
plot3(P(:,2),P(:,3),P(:,1));

for i = 1:length(k)
   hold on;
   plot3(Cu(k(i),2),Cu(k(i),3),Cu(k(i),1),'*');
end





