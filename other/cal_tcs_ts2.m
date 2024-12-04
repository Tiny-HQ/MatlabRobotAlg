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

% pos1 = [357.1 65 966.1 -170.9 34.6 173.4];
% pos2 = [637.5 -197.5 929.5 166.6 -14.1 135.8];
% pos3 = [401.4 376.7 948.2 -179.8 30.8 -153.9];
% pos4 = [308.3 448.7 808.6 -132.3 -1.8 -121];

pos1 = [255.315 -111.928 15.6613 -60.1085 147.147 -178.373];
pos2 = [249.596 -198.596 17.5628 41.1747 147.147 -178.373];
pos3 = [278.561 -187.804 33.6253 74.9434 155.661 -31.127];
pos4 = [336.625 -143.761 27.2846 -152.309 143.268 -24.3185];



%打印圆心坐标; Print the coordinates of the center of the circle;
[Pc,r] = cal_sphere_center(pos1,pos2,pos3,pos4);



%第一个点求转换xyz; The first point is the transformation xyz;
BB = Pc-pos1(1:3)';
%sqrt(sum(BB.^2))%验证球心半径 Verify the spherical radius
AA = eye(4);
AA = rotz(pos1(4))*roty(pos1(5))*rotz(pos1(6));
V = inv(AA(1:3,1:3))*BB
%验证: Verify:
AA(1:3,4) = pos1(1:3)';
T = eye(4);
T(1:3,4) = V;
AA*T;
%所得矩阵的p矢量就是圆心坐标 The p-vector of the resulting matrix is the center coordinates





%第二个点求转换xyz; The second point is the transformation xyz;
BB = Pc-pos2(1:3)';
%sqrt(sum(BB.^2))%验证球心半径 Verify the spherical radius
AA = rotz(pos2(4))*roty(pos2(5))*rotz(pos2(6));
V = inv(AA(1:3,1:3))*BB
%验证: Verify:
AA(1:3,4) = pos2(1:3)';
T = eye(4);
T(1:3,4) = V;
AA*T;
%所得矩阵的p矢量就是圆心坐标 The p-vector of the resulting matrix is the center coordinates


%第三个点求转换xyz; The third point is the transformation xyz;
BB = Pc-pos3(1:3)';
%sqrt(sum(BB.^2))%验证球心半径 Verify the spherical radius
AA = rotz(pos3(4))*roty(pos3(5))*rotz(pos3(6));
V = inv(AA(1:3,1:3))*BB
%验证:Verify:
AA(1:3,4) =  pos3(1:3)';
T = eye(4);
T(1:3,4) = V;
AA*T;
%所得矩阵的p矢量就是圆心坐标 The p-vector of the resulting matrix is the center coordinates



%第四个点求转换xyz;The fourth point is the transformation xyz;
BB = Pc-pos4(1:3)';
%sqrt(sum(BB.^2))%验证球心半径V erify the spherical radius
AA =rotz(pos4(4))*roty(pos4(5))*rotz(pos4(6));
V = inv(AA(1:3,1:3))*BB
%验证:Verify:
AA(1:3,4) = pos4(1:3)';
T = eye(4);
T(1:3,4) = V;
AA*T;
%所得矩阵的p矢量就是圆心坐标 The p-vector of the resulting matrix is the center coordinates







