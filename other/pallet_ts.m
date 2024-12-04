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


%如果示教的点位是在PCS下进行的，那么设置PCS; If the teaching point is carried out under PCS, then set PCS;
%如果没有设置PCS，将PCS的值设置为0; If PCS is not set, set the value of PCS to 0;
pcs = [291.7 -530.7 367.7 104.845 44.6819 -91.1188];
%pcs = [0.0 0.0 0.0 0.0 0.0 0.0];


%设置各个示教点位,与程序界面的值对应，不要修改顺序; Set each teaching point to correspond to the value of the program interface, and do not modify the order;
P1 = [145.6 -0.1 0.0 57.77 170.78 -43.59];
P2 = [0.099 0.1 0.0 57.77 170.78 -43.59 ];
P3 = [147.50 115.199 0.00 57.77 170.78 -43.59 ];
P4 = [145.599911 -0.100142 0.000128 57.774833 170.78 -43.59 ];
P5 = [145.599911 -0.100142 0.000128 57.774833 170.78 -43.59 ];


%计算世界坐标系下的矩阵; Calculate matrices in the world coordinate system;
T_WCS1 = cs_define_zyzeul(pcs)*cs_define_zyzeul(P1);
T_WCS2 = cs_define_zyzeul(pcs)*cs_define_zyzeul(P2);
T_WCS3 = cs_define_zyzeul(pcs)*cs_define_zyzeul(P3);
T_WCS4 = cs_define_zyzeul(pcs)*cs_define_zyzeul(P4);
T_WCS5 = cs_define_zyzeul(pcs)*cs_define_zyzeul(P5);

%求标定的盘坐标系下的x、y、z轴矢量; Find the x, y, and z axis vectors in the calibrated disk coordinate system;
vx = splitT_P(T_WCS2) - splitT_P(T_WCS1);%vx = normal(vx);
vy = splitT_P(T_WCS3) - splitT_P(T_WCS1);%vy = normal(vy);
vz = splitT_P(T_WCS4) - splitT_P(T_WCS1);%vz = normal(vz);



%求x轴于y轴、x于z轴、y轴与z轴的点积，如果三者的点积为0或者接近0 Find the dot product of the x-axis in the y-axis, x-x-x-axis, y-axis and z-axis, if the dot product of the three is 0 or close to 0
%那么说明标定效果不错，如果不为0，那么说明标定效果比较差; Then it means that the calibration effect is good, if it is not 0, then it means that the calibration effect is relatively poor;
sum(vx.*vy)
sum(vy.*vz)
sum(vz.*vx)
% vz = cross(vx,vy);
% sum_yz = sum(vy.*vz)
% sum_xz = sum(vz.*vx)
% 
% sqrt(sum(vx.^2))*sqrt(sum(vz.^2))
% 
% angle_xy=acos(sum(vx.*vy)/(sqrt(sum(vx.^2))*sqrt(sum(vy.^2))))*180/pi
% angle_xz=acos(sum_xz/(sqrt(sum(vx.^2))*sqrt(sum(vz.^2))))*180/pi
% angle_yz=acos(sum_yz/(sqrt(sum(vy.^2))*sqrt(sum(vz.^2))))*180/pi



