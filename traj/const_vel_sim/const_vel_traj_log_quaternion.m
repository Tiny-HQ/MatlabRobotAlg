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


%% ���ٽ���,��Ԫ��������ʽ; Uniform feed, quaternion logarithmic form; constant velocity

clc;
clear;
format long g;


%��㡢���ɵ㡢�յ�; starting point, transition point, end point;
% P1 = [100 88 65-100-100 -60 -20 30];     
% P2 = [88 25 63-100-100 0 30 -20];       
% P3 = [50 30 20-100-100 -60 -70 -40]; 

P1 = [100 88 65-100-100 15 175 80];     
P2 = [88 25 63-100-100 15 175 80];       
P3 = [50 30 20-100-100 15 -175 80]; 

T1 = cs_define_zyzeul(P1);
T2 = cs_define_zyzeul(P2);
T3 = cs_define_zyzeul(P3);

Q1 = R_to_Quat(splitT_R(T1));
Q2 = R_to_Quat(splitT_R(T2));
Q3 = R_to_Quat(splitT_R(T3));

if(Q1*Q2'<0)
    Q2 = -Q2;
end

if(Q2*Q3'<0)
   Q3 = -Q3; 
end

lnq1 = Quat_Log(Q1);
lnq2 = Quat_Log(Q2);
lnq3 = Quat_Log(Q3);

% Quat_Exp(lnq1)
% Quat_Exp(lnq2)
% Quat_Exp(lnq3)


p1 = P1(1:3); o1 = lnq1(2:4);
p2 = P2(1:3); o2 = lnq2(2:4);
p3 = P3(1:3); o3 = lnq3(2:4);
Ts = 0.01;%�岹����; imputation cycles;

%���ڰ뾶; blending radius;
r = 30;
Pos1 = zeros(1000,6);
Pos2 = zeros(1000,6);
Pos3 = zeros(1000,6);

%��ռ伸�εĹ���; find the configuration of the space geometry;
[A,B,c,new_r,theta_c] = cal_const_vel_param(P1,P2,P3,r,1);

%���ɹ滮����; generation of planning curves;
Disp = 1000;Vel = 20;Acc = 200;Jerk = 2000;
[t,jerk] = s_curve_cal_param_con(Disp,Vel,Acc,Jerk);
[p,v,a1,jerk] = s_curve_cal_pvaj_con_ext(t,jerk,Ts);

l_p1p2 = cal_dis(p1,p2);  ol_p1p2 = cal_dis(o1,o2);     rescale_1 = ol_p1p2/l_p1p2;
l_p3p2 = cal_dis(p3,p2);  ol_p2p3 = cal_dis(o3,o2);     rescale_2 = ol_p2p3/l_p3p2;

d_p1p2 = normal(p2-p1);   o_p1p2 = normal(o2-o1);
d_p3p2 = normal(p2-p3);   o_p3p2 = normal(o2-o3);

l_p1A = cal_dis(A(1:3)',p1);
l_p3B = cal_dis(B(1:3)',p3);
le1 = 0;le3 = 0;

%��¼�����λ��ʱ����Ԫ����̬; Record the quaternion pose at the starting point;
QA = zeros(1,4);QB = zeros(1,4);
TT1 = zeros(4,4,1000);
TT2 = zeros(4,4,1000);
TT3 = zeros(4,4,1000);

%��ǽ���ʱ��λ����̬�����������ɵĹ滮�������ɿռ�λ�ü���̬; find the position and pose in the non-blending situation, and generate the spatial position and attitude from the above-mentioned generated planning curve;
for i = 1:length(p)
    Pos1(i,1:3) = p(i)*d_p1p2+p1;
    lnq = zeros(1,4);
    lnq(2:4) = p(i)*rescale_1*o_p1p2+o1; 
    q = Quat_Exp(lnq);
    TT1(1:3,1:3,i) = Quat_to_R(q);TT1(4,4,i) = 1.0;
    TT1(1:3,4,i) = Pos1(i,1:3)';
    if (p(i)>=l_p1A)
        le1 = i;
        QA = lnq;
        break;
    end
end

for i = 1:length(p)
    Pos3(i,1:3) = p(i)*d_p3p2+p3;
    lnq = zeros(1,4);
    lnq(2:4) = p(i)*rescale_2*o_p3p2+o3;
    q = Quat_Exp(lnq);
    TT3(1:3,1:3,i) = Quat_to_R(q);TT3(4,4,i) = 1.0;
    TT3(1:3,4,i) = Pos3(i,1:3)';
    if (p(i)>=l_p3B)
        le3 = i;
        QB = lnq;
        break;
    end
end


%% ��Բƽ���ָ�֮���λ��������������; Find the position coordinates after the circle is evenly divided to generate an array;
%�����и����⣬����岹����Ts�Ƚϴ���ôԲ��ֱ��ƴ�ӵĵط�������������Ҫ��������; There is a problem here, if the interpolation period Ts is relatively large, then the place where the circle and the straight line are spliced is not uniform and needs to be treated separately;
t = new_r*theta_c/Vel;
no = floor(t/Ts);
for i = 1:no
    theta = i*theta_c/no;
    Temp = cal_arc_any_pos(c(1:3),A(1:3),B(1:3),new_r,theta);
    Pos2(i,1:3) = Temp';
end

%% ��Բ���м�����м����̬; Find the attitude of the middle transition of the arc;
start_ori_p = QA(2:4);
end_ori_p = QB(2:4);

start_ori_v = Vel*rescale_1*o_p1p2;
end_ori_v = -Vel*rescale_2*o_p3p2;

[a1,b1,c1,d1] = three_polynomial(start_ori_p(1),start_ori_v(1),end_ori_p(1),end_ori_v(1),t);
[a2,b2,c2,d2] = three_polynomial(start_ori_p(2),start_ori_v(2),end_ori_p(2),end_ori_v(2),t);
[a3,b3,c3,d3] = three_polynomial(start_ori_p(3),start_ori_v(3),end_ori_p(3),end_ori_v(3),t);

%����Ҳ��������λ��ʱһ����Բ��ֱ��ƴ�ĵط��������٣������������������������յ�λ�ý��м��㣬���ø���; Here is also the same as when finding the position above, the place where the circle and the straight line are spelled can not be at a uniform speed, and the other way is to use the end position to calculate, too lazy to do it;
for i = 1:no
    tt = i*Ts;
    lnq = [0 0 0 0];
    lnq(2) = a1*tt^3+b1*tt^2+c1*tt+d1;
    lnq(3) = a2*tt^3+b2*tt^2+c2*tt+d2;
    lnq(4) = a3*tt^3+b3*tt^2+c3*tt+d3;
    q = Quat_Exp(lnq);
    TT2(1:3,1:3,i) = Quat_to_R(q);TT2(4,4,i) = 1.0;
    TT2(1:3,4,i) = Pos2(i,1:3)';
end

%% ���켣; Draw a trajectory;

T1 = zeros(4,4,le1);
%figure;
%����ϵ��С; coordinate system size;
coord_scale = 5;
%axis([0 100 0 100 0 100]);
for i = 1:le1
    T1(:,:,i) = TT1(:,:,i);
end
plot_coord_data_dynamic(T1,coord_scale,10);

T2 = zeros(4,4,no);
for i = 1:no
    T2(:,:,i) = TT2(:,:,i);
end
hold on;
plot_coord_data_dynamic(T2,coord_scale,10);

T3 = zeros(4,4,le3);
for i = 1:le3
    T3(:,:,i) = TT3(:,:,le3-i+1);
end
hold on;
plot_coord_data_dynamic(T3,coord_scale,10);

T_P2 = cs_define_rpy(P2);
plot_coord(T_P2,coord_scale)




















