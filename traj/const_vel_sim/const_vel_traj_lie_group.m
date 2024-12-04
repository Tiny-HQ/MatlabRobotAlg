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


%% 匀速进给,李群李代数解法; Uniform feed, Lie Qun Lie algebraic solution; constant velocity

clc;
clear;
format long g;


%起点、过渡点、终点; starting point, transition point, end point;
% P1 = [100 88 65-100 -60 -20 30];     
% P2 = [88 25 63-100 0 30 -20];       
% P3 = [50 30 20-100 -60 -70 -40]; 
P1 = [100 88 65-100-100 15 175 80];     
P2 = [88 25 63-100-100 15 175 80];       
P3 = [50 30 20-100-100 15 -175 80]; 

T1 = cs_define_zyzeul(P1);
T2 = cs_define_zyzeul(P2);
T3 = cs_define_zyzeul(P3);

se_T1 = SE3_to_se3(T1);     V1 = se3_to_v(se_T1);
se_T2 = SE3_to_se3(T2);     V2 = se3_to_v(se_T2);
se_T3 = SE3_to_se3(T3);     V3 = se3_to_v(se_T3);


o1 = V1(1:3); p1 = P1(1:3);
o2 = V2(1:3); p2 = P2(1:3);
o3 = V3(1:3); p3 = P3(1:3);
Ts = 0.01;%插补周期; imputation cycles;

%交融半径; blending radius;
r = 30;
Pos1 = zeros(1000,6);
Pos2 = zeros(1000,6);
Pos3 = zeros(1000,6);

%求空间几何的构型; find the configuration of the space geometry;
[A,B,c,new_r,theta_c] = cal_const_vel_param(P1,P2,P3,r,1);

%生成规划曲线; generation of planning curves;
Disp = 1000;Vel = 20;Acc = 200;Jerk = 2000; %这里有问题的是生成都是李代数下的速度问题，如果是笛卡尔空间，可以只转姿态，笛卡尔位置不变; The problem here is that the generation is a velocity problem under Lie algebra, if it is a Cartesian space, it can only turn the pose, and the Cartesian position remains the same;
[t,jerk] = s_curve_cal_param_con(Disp,Vel,Acc,Jerk);
[p,v,a1,jerk] = s_curve_cal_pvaj_con_ext(t,jerk,Ts);

l_p1p2 = cal_dis(p1,p2);  ol_p1p2 = cal_dis(o1,o2);     rescale_1 = ol_p1p2/l_p1p2;
l_p3p2 = cal_dis(p3,p2);  ol_p2p3 = cal_dis(o3,o2);     rescale_2 = ol_p2p3/l_p3p2;

d_p1p2 = normal(p2-p1);   o_p1p2 = normal(o2-o1);
d_p3p2 = normal(p2-p3);   o_p3p2 = normal(o2-o3);

l_p1A = cal_dis(A(1:3)',p1);
l_p3B = cal_dis(B(1:3)',p3);
le1 = 0;le3 = 0;

%求非交融时的位置姿态，由上述生成的规划曲线生成空间位置及姿态; find the position and pose in the non-blending situation, and generate the spatial position and attitude from the above-mentioned generated planning curve;
for i = 1:length(p)
    Pos1(i,4:6) = p(i)*d_p1p2+p1;
    Pos1(i,1:3) = p(i)*rescale_1*o_p1p2+o1;
    if (p(i)>=l_p1A)
        le1 = i;
        break;
    end
end

for i = 1:length(p)
    Pos3(i,4:6) = p(i)*d_p3p2+p3;
    Pos3(i,1:3) = p(i)*rescale_2*o_p3p2+o3;
    if (p(i)>=l_p3B)
        le3 = i-1;
        break;
    end
end


%% 求圆平均分割之后的位置坐标生成数组; Find the position coordinates after the circle is evenly divided to generate an array;
%这里有个问题，如果插补周期Ts比较大，那么圆与直线拼接的地方并不是匀速需要另作处理; There is a problem here, if the interpolation period Ts is relatively large, then the place where the circle and the straight line are spliced is not uniform and needs to be treated separately;
t = new_r*theta_c/Vel;
no = floor(t/Ts);
for i = 1:no
    theta = i*theta_c/no;
    Temp = cal_arc_any_pos(c(1:3),A(1:3),B(1:3),new_r,theta);
    Pos2(i,4:6) = Temp';
end

%% 求圆弧中间过渡中间的姿态; Find the attitude of the middle transition of the arc;
start_ori_p = Pos1(le1,1:3)
end_ori_p = Pos3(le3,1:3)

start_ori_v = Vel*rescale_1*o_p1p2;
end_ori_v = -Vel*rescale_2*o_p3p2;

[a1,b1,c1,d1] = three_polynomial(start_ori_p(1),start_ori_v(1),end_ori_p(1),end_ori_v(1),t);
[a2,b2,c2,d2] = three_polynomial(start_ori_p(2),start_ori_v(2),end_ori_p(2),end_ori_v(2),t);
[a3,b3,c3,d3] = three_polynomial(start_ori_p(3),start_ori_v(3),end_ori_p(3),end_ori_v(3),t);

%这里也跟上面求位置时一样，圆与直线拼的地方不能匀速，另作处理，方法就是利用终点位置进行计算，懒得搞了; Here is also the same as when finding the position above, the place where the circle and the straight line are spelled can not be at a uniform speed, and the other way is to use the end position to calculate, too lazy to do it;
for i = 1:no
    tt = i*Ts;
    Pos2(i,1) = a1*tt^3+b1*tt^2+c1*tt+d1;
    Pos2(i,2) = a2*tt^3+b2*tt^2+c2*tt+d2;
    Pos2(i,3) = a3*tt^3+b3*tt^2+c3*tt+d3;
end


%% 画轨迹; Draw a trajectory;

T1 = zeros(4,4,le1);
%figure;
%坐标系大小; coordinate system size;
coord_scale = 5;
%axis([0 100 0 100 0 100]);
for i = 1:le1
    T1(:,:,i) = se3_to_SE3LG(Pos1(i,:));
    T1(1:3,4,i) = Pos1(i,4:6)';
end
hold on;
plot_coord_data_dynamic(T1,coord_scale,10);

T2 = zeros(4,4,no);
for i = 1:no
    T2(:,:,i) = se3_to_SE3LG(Pos2(i,:));
    T2(1:3,4,i) = Pos2(i,4:6)';
end
hold on;
plot_coord_data_dynamic(T2,coord_scale,10);

T3 = zeros(4,4,le3);
for i = 1:le3
    T3(:,:,i) = se3_to_SE3LG(Pos3(le3-i+1,:));
    T3(1:3,4,i) = Pos3(le3-i+1,4:6)';
end
hold on;
plot_coord_data_dynamic(T3,coord_scale,10);

T_P2 = cs_define_rpy(P2);
plot_coord(T_P2,coord_scale)











