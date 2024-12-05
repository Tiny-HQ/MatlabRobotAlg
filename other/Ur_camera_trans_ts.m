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

Pos = load('Pos_ur_camera.mat');
Pos_ur = Pos.Pos(:,1:6);


Pos_ca = Pos.Pos(:,7:13);

[m,n] = size(Pos_ur);
T_ur = zeros(4,4,m);
T_ca = zeros(4,4,m);
Trans = zeros(m,6);
axis_angle = Pos_ur(:,4:6);
for i = 1:m
    angle = sqrt(axis_angle(i,1)^2+axis_angle(i,2)^2+axis_angle(i,3)^2)
    axis = axis_angle(i,:)/angle
    T_ur(1:3,1:3,i) = axis_angle_trans(axis,angle);
    T_ur(1:3,4,i) = Pos_ur(i,1:3)';T_ur(4,4,i) = 1.0;
end

for i = 1:m
   Q = Pos_ca(i,1:4);
   P = Pos_ca(i,5:7);
   R = Quat_to_R(Q);
   T_ca(1:3,1:3,i) = R;
   T_ca(1:3,4,i) = P';
   T_ca(4,4,i) = 1.0; 
end




for i = 1:floor(m/2)
    Tf1 = T_ur(1:4,1:4,i);
    Tf2 = T_ur(1:4,1:4,m-i*2+1);
    Tnd1 = T_ca(1:4,1:4,i);
    Tnd2 = T_ca(1:4,1:4,m-i*2+1);
    
%     A = inv(Tnd2)*Tnd1;
%     B = inv(Tf2)*Tf1;
    
%     A = inv(Tf1)*Tf2;
%     B = Tnd1*inv(Tnd2);

    X = tsai(A,B)
end
