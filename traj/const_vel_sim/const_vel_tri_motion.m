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
%% 参数设定; parameter setting;

clc;
clear;

%定点位置; % fixed-point position;
const_pos = [200 300 0 0 0 0];
offset = 2;     %矩阵的边缘需要的一个偏移量; an offset required for the edges of the matrix;
Ts = 0.004;     %4ms生成 4ms generation
L = 100;        %边长为300mm的三角形; a triangle with a side length of 300mm;

r = 5;         %圆角的半径;10mm the radius of the fillet; 10mm
const_line_vel = 80;                %假设匀速速度10mm/s Assuming a constant velocity of 10 mm/s
const_arc_vel = const_line_vel/r;   %圆角时候的角速度rad/s The angular velocity rad/s at the time of filleting


counts = 0;             % 记录总的点的个数;初始化为0; record the total number of points; Initialize to 0;
T = zeros(4,4,10000);   %初始记录点;Initial recording point;


%% 求初始三角形中心坐标; Find the center coordinates of the initial triangle;
x = L/2-(r+offset)/tan(30*pi/180);
y = L/2*tan(30*pi/180)-offset;

tri_start_pos = zeros(1,6);
tri_start_pos(1) = const_pos(1)-x;
tri_start_pos(2) = const_pos(2)-y;
T_last = eye(4);

%% 第一段直线; the first straight line;
n1 = floor(x*2/const_line_vel/Ts);
for i = 1:n1
    tri_start_pos(1) = tri_start_pos(1)+Ts*const_line_vel;
    T(:,:,i) = cs_define_zyzeul(tri_start_pos);
    counts = counts+1;
    T_last = T(:,:,i);
end


%% 第一段圆弧; %% First arc;
const_circle = const_pos-[0 r 0 0 0 0];%如果第一段的终点不是圆刚好的起点，需要做匀速处理，否则会出现速度上的不连续，也就是不匀速;% If the end point of the first segment is not the starting point of the circle, it needs to be treated at a uniform speed, otherwise there will be discontinuity in velocity, that is, unevenness;  

T_circle = cs_define_zyzeul(const_circle);
T_rel = inv(T_circle)*T_last;
n2 =floor( 2*pi/3/const_arc_vel/Ts)+1;
for i = 1:n2
    T_rel = hrotz(-Ts*const_arc_vel*180/pi)*T_rel;
    T_new = T_circle*T_rel;
    T(:,:,counts) = T_new;
    T_last = T_new;
    counts = counts+1;
end

%% 第二段直线; the second straight line;
n3 = n1;
for i = 1:n3
    T_last(1,4) = T_last(1,4)+Ts*const_line_vel;
    T(:,:,counts) = T_last;
    counts = counts+1;
end

%% 第二段圆弧; the second arc;
n4 = n2;
T_circle = cs_define_zyzeul(const_circle);
T_rel = inv(T_circle)*T_last;
for i = 1:n4
    T_rel = hrotz(-Ts*const_arc_vel*180/pi)*T_rel;
    T_new = T_circle*T_rel;
    T(:,:,counts) = T_new;
    T_last = T_new;
    counts = counts+1;
end

%% 第三段直线; the third straight line;
for i = 1:n3
    T_last(1,4) = T_last(1,4)+Ts*const_line_vel;
    T(:,:,counts) = T_last;
    counts = counts+1;
end


%% 第三段圆弧; the third arc;
T_circle = cs_define_zyzeul(const_circle);
T_rel = inv(T_circle)*T_last;
for i = 1:n4-1
    T_rel = hrotz(-Ts*const_arc_vel*180/pi)*T_rel;
    T_new = T_circle*T_rel;
    T(:,:,counts) = T_new;
    T_last = T_new;
    counts = counts+1;
end




%% 所有的点画出来; All the dots are drawn out;

figure;
clf;
counts = counts - 1;
T_last_new = zeros(4,4,counts);
for i = 1:counts
   T_last_new(:,:,i) = T(:,:,i);
end
draw_tri_dynamic(L,T_last_new,0,[0 400,100 350]);


