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


%% 匀速进给,欧拉角rpy插补; Constant feeding, Euler angle RPY interpolation; constant velocity

clc;
clear;
format long g;


%起点、过渡点、终点; starting point, transition point, end point;
P1 = [100 88 65 -60 -20 30];     
P2 = [88 25 63 0 30 -20];       
P3 = [50 30 20 -60 -70 -40];      

p1 = P1(1:3); o1 = P1(4:6);
p2 = P2(1:3); o2 = P2(4:6);
p3 = P3(1:3); o3 = P3(4:6);
Ts = 0.004;%插补周期; imputation cycles;

%交融半径; blending radius;
r = 5;
Pos1 = zeros(10000,6);
Pos2 = zeros(10000,6);
Pos3 = zeros(10000,6);

Pos2_1 = zeros(10000,6);
Pos2_2 = zeros(10000,6);

%求空间几何的构型; find the configuration of the space geometry;
[A,B,c,new_r,theta_c] = cal_const_vel_param(P1,P2,P3,r,0);

%生成规划曲线; generation of planning curves;
Disp = 1000;Vel = 20;Acc = 200;Jerk = 2000;
% [t,jerk] = s_curve_cal_param_con(Disp,Vel,Acc,Jerk);
% [p,v,aa1,jerk] = s_curve_cal_pvaj_con_ext(t,jerk,Ts);

l_p1p2 = cal_dis(p1,p2);  ol_p1p2 = cal_dis(o1,o2);     rescale_1 = ol_p1p2/l_p1p2;
l_p3p2 = cal_dis(p3,p2);  ol_p2p3 = cal_dis(o3,o2);     rescale_2 = ol_p2p3/l_p3p2;

d_p1p2 = normal(p2-p1);   o_p1p2 = normal(o2-o1);
d_p3p2 = normal(p2-p3);   o_p3p2 = normal(o2-o3);

l_p1A = cal_dis(A(1:3)',p1);
l_p3B = cal_dis(B(1:3)',p3);
le1 = 0;le3 = 0;

A_vel = zeros(1,3);A_acc = zeros(1,3);A_p = zeros(1,3);
B_vel = zeros(1,3);B_acc = zeros(1,3);B_p = zeros(1,3);

[t,jerk] = s_curve_cal_param_con(l_p1p2,Vel,Acc,Jerk);
[p,v,aa1,jerk] = s_curve_cal_pvaj_con_ext(t,jerk,Ts);
%求非交融时的位置姿态，由上述生成的规划曲线生成空间位置及姿态;find the position and pose in the non-blending situation, and generate the spatial position and attitude from the above-mentioned generated planning curve;
for i = 1:length(p)
    Pos1(i,1:3) = p(i)*d_p1p2+p1;
    Pos1(i,4:6) = p(i)*rescale_1*o_p1p2+o1;
    if (p(i)>=l_p1A)
        le1 = i;
        break;
    end
end

for i = 1:floor(t(7)/Ts)-le1
    Pos2_1(i,1:3) = p(i+le1)*d_p1p2+p1;
    Pos2_1(i,4:6) = p(i+le1)*rescale_1*o_p1p2+o1;
    if(p(i+le1)>cal_dis(p1,p2))
        break;   
    end
end

no1 = floor(t(7)/Ts)-le1;
[t,jerk] = s_curve_cal_param_con(l_p3p2,Vel,Acc,Jerk);
[p,v,aa1,jerk] = s_curve_cal_pvaj_con_ext(t,jerk,Ts);
for i = 1:length(p)
    Pos3(i,1:3) = p(i)*d_p3p2+p3;
    Pos3(i,4:6) = p(i)*rescale_2*o_p3p2+o3;
    if (p(i)>=l_p3B)
        le3 = i-1;
        break;
    end
end

for i = 1:floor(t(7)/Ts)-le3
    Pos2_2(i,1:3) = p(i+le3)*d_p3p2+p3;
    Pos2_2(i,4:6) = p(i+le3)*rescale_2*o_p3p2+o3;  
    if(p(i+le3)>cal_dis(p3,p2))
        break;
    end
end


no2 =  floor(t(7)/Ts)-le3;
% if(no1>no2)
%     for i = 1:no1-no2
%         Pos2(i,1:3) = Pos2_1(i,1:3);
%         Pos2(i,4:6) = Pos2_1(i,4:6);
%     end
%     for i = no1-no2:no1
%          Pos2(i,1:3) = Pos2_2(no1-i+1,1:3)-p2+Pos2_1(i,1:3);
%         Pos2(i,4:6) = Pos2_2(no1-i+1,4:6)-p2+Pos2_1(i,4:6);
%         
%     end  
% end
for i = 1:no1
    Pos2(i,1:3) = Pos2_2(no1-i+1,1:3)-p2+Pos2_1(i,1:3);
    Pos2(i,4:6) = Pos2_2(no1-i+1,4:6)-p2+Pos2_1(i,4:6);
end

no = no1;
%% 画轨迹; Draw a trajectory;

T1 = zeros(4,4,le1);
%figure;
%坐标系大小; coordinate system size;
coord_scale = 5;
%axis([0 100 0 100 0 100]);

posall = zeros(le1+no+le3,3);
countall = 0;
for i = 1:le1
    T1(:,:,i) = cs_define_rpy(Pos1(i,:));
    posall(i,:) = Pos1(i,1:3)';
end
hold on;
%plot_coord_data_dynamic(T1,coord_scale,1);

T2 = zeros(4,4,no);
for i = 1:no
    T2(:,:,i) = cs_define_rpy(Pos2(i,:));
    posall(i+le1,:) = Pos2(i,1:3)';
end
hold on;
%plot_coord_data_dynamic(T2,coord_scale,1);

T3 = zeros(4,4,le3);
for i = 1:le3
    T3(:,:,i) = cs_define_rpy(Pos3(le3-i+1,:));
    posall(i+le1+no,:) = Pos3(le3-i+1,1:3)';
end
hold on;
%plot_coord_data_dynamic(T3,coord_scale,1);

T_P2 = cs_define_rpy(P2);
%plot_coord(T_P2,coord_scale)



plot3(posall(:,1),posall(:,2),posall(:,3));

vx = diff(posall(:,1)/Ts);
vy = diff(posall(:,2)/Ts);
vz = diff(posall(:,3)/Ts);

ax = diff(vx/Ts);
ay = diff(vy/Ts);
az = diff(vz/Ts);
figure;
plot(sqrt(vx.^2+vy.^2+vz.^2),'b');hold on;
plot(sqrt(ax.^2+ay.^2+az.^2),'r');
















