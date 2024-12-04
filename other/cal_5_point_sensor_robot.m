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

nx=-0.9986;
ox=0.01345;
ax=-0.0513;
px=-15.66;

ny=0.0139;
oy=0.999;
ay=-0.00878;
py=61.6;

nz=-0.0512;
oz=0.00948;
az=0.999;
pz=-167.6;

sen1_x=-14.203;
sen1_y=0.0;
sen1_z=173.344;

rb1_x=1820.77;
rb1_y=-786.85;
rb1_z=944.65;

sen2_x=-26.95;
sen2_y=0.0;
sen2_z=163.753;

rb2_x=1820.77;
rb2_y=-799.7;
rb2_z=935.65;

sen3_x=8.81;
sen3_y=0.0;
sen3_z=165.38;

rb3_x=1820.17;
rb3_y=-763.73;
rb3_z=935.65;

sen4_x=7.24;
sen4_y=0.0;
sen4_z=206.28;

rb4_x=1820.8;
rb4_y=-763.73;
rb4_z=976.41;

sen5_x=-36.37;
sen5_y=0.0;
sen5_z=204.087;

rb5_x=1821.22;
rb5_y=-807.02;
rb5_z=976.41;

rb6_x=1880.65;
rb6_y=-797.22;
rb6_z=938.41;

rz = -90;
ry = -180 ;
rx = 0;

T1 = [nx ny nz px;
    ox oy oz py;
    ax ay az pz;
    0 0 0 1];

P_piece = [rb6_x rb6_y rb6_z 1]';

T_s1 = [sen1_x sen1_y sen1_z 1];
T_s2 = [sen2_x sen2_y sen2_z 1];
T_s3 = [sen3_x sen3_y sen3_z 1];
T_s4 = [sen4_x sen4_y sen4_z 1];
T_s5 = [sen5_x sen5_y sen5_z 1];

T_s = [T_s1;T_s2;T_s3;T_s4;T_s5];

T60_1 =cs_define_zyxeul([rb1_x rb1_y rb1_z rz ry rx]);
T60_2 =cs_define_zyxeul([rb2_x rb2_y rb2_z rz ry rx]);
T60_3 =cs_define_zyxeul([rb3_x rb3_y rb3_z rz ry rx]);
T60_4 =cs_define_zyxeul([rb4_x rb4_y rb4_z rz ry rx]);
T60_5 =cs_define_zyxeul([rb5_x rb5_y rb5_z rz ry rx]);

Pr_1 = inv(T60_1)*P_piece;
Pr_2 = inv(T60_2)*P_piece;
Pr_3 = inv(T60_3)*P_piece;
Pr_4 = inv(T60_4)*P_piece;
Pr_5 = inv(T60_5)*P_piece;

Pr = [Pr_1';Pr_2';Pr_3';Pr_4';Pr_5'];

T = pinv(T_s)*Pr; 
T = T'

theta = asin(-T(3,1));
fi = atan2(T(2,1),T(1,1));
pfi = acos(T(3,3)/cos(theta));

hrotz(fi)*hroty(theta)*hrotx(pfi)

T1
T60_1*T'*T_s1' - P_piece;
T60_2*T'*T_s2' - P_piece;
T60_3*T'*T_s3'- P_piece;
T60_4*T'*T_s4' - P_piece;
T60_5*T'*T_s5' - P_piece;

T60_1*T1*T_s1' - P_piece;

