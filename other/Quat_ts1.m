
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
%��Ԫ��ת������; quaternion conversion problems;
clc;
clear;



% P = [0 0 0 -70 179.5  -80.662];
% T = cs_define_zyzeul(P);
% display(T);
% 
% w = (htrace(splitT_R(T))+1)^0.5/2;
% x = (T(1,1)-T(2,2)-T(3,3)+1)^0.5/2;
% y = (-T(1,1)+T(2,2)-T(3,3)+1)^0.5/2;
% z = (-T(1,1)-T(2,2)+T(3,3)+1)^0.5/2;

%if((abs(w)>=abs(x))&&(abs(w)>=abs())

% display('func1');
% display([w,x,y,z]);
% 
% A = Quat_to_R([w,x,y,z]);
% display(A);
% 
% 
% x1 = (T(3,2) - T(2,3))/(4*w);
% y1 = (T(1,3) - T(3,1))/(4*w);
% z1 = (T(2,1) - T(1,2))/(4*w);
% 
% 
% display('func2');
% display([w,x1,y1,z1]);
% B = Quat_to_R([w,x1,y1,z1]);
% display(B);
P_zyx = [0 0 0 30 25.725 -150];

cs_define_xyzeul(P_zyx);
c1 = cos(P_zyx(4)/2*pi/180);
s1 = sin(P_zyx(4)/2*pi/180);
c2 = cos(P_zyx(5)/2*pi/180);
s2 = sin(P_zyx(5)/2*pi/180);
c3 = cos(P_zyx(6)/2*pi/180);
s3 = sin(P_zyx(6)/2*pi/180);
w = c1 * c2 * c3 + s1 * s2 * s3;
x = s1 * c2 * c3 - c1 * s2 * s3;
y = c1 * s2 * c3 + s1 * c2 * s3;
z = c1 * c2 * s3 - s1 * s2 * c3;
Quat = [w,x,y,z]
%Quat_to_R(Quat)



P_zyx = [0 0 0 30 -25.725 -150];
cs_define_zyxeul(P_zyx);
c1 = cos(P_zyx(4)/2*pi/180);
s1 = sin(P_zyx(4)/2*pi/180);
c2 = cos(P_zyx(5)/2*pi/180);
s2 = sin(P_zyx(5)/2*pi/180);
c3 = cos(P_zyx(6)/2*pi/180);
s3 = sin(P_zyx(6)/2*pi/180);
w = c1 * c2 * c3 + s1 * s2 * s3;
x = s1 * c2 * c3 - c1 * s2 * s3;
y = c1 * s2 * c3 + s1 * c2 * s3;
z = c1 * c2 * s3 - s1 * s2 * c3;
Quat = [w,x,y,z]
%Quat_to_R(Quat)




