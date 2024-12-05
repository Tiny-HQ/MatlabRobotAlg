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







top_pos3 = [314.66 65.326 -81.148;       
            314.96 -30.868 -81.216;
            273.41 -30.875 -81.225;
            314.66 65.326 -81.148;];



        
        
left_pos2 = [314.34 78.815 -86.269;
            272.75 79.134 -86.268;];
front_pos2 = [323.2 65.234 -86.292;
            322.56 -30.831 -86.293];
        




box_origin = [320.26965612890018, 75.767919366793009, -84.139397909210160];
box_origin_offset = [323.29259919488970, 78.747844339744958, -84.139397909210160];

box_dir_x = [-0.0076699025217777713, -0.99997033436154903, -0.00070921940056657077];
box_dir_y = [-0.99997778614139243, 0.0066620100442310376, -0.00021176857719722254];
box_dir_z = [0.00021648723171504235, 0.00070757976124593256, -0.99999972623204247];




box_dir_len_x = 100*box_dir_x;
box_dir_len_y = 100*box_dir_y;
box_dir_len_z = 10*box_dir_z;

box_dir_x_2_point_off = [box_origin_offset;box_origin_offset+box_dir_len_x];
box_dir_y_2_point_off = [box_origin_offset;box_origin_offset+box_dir_len_y];
box_dir_z_2_point_off = [box_origin_offset;box_origin_offset+box_dir_len_z];

box_dir_x_2_point= [box_origin;box_origin+box_dir_len_x];
box_dir_y_2_point= [box_origin;box_origin+box_dir_len_y];
box_dir_z_2_point= [box_origin;box_origin+box_dir_len_z];


plot3(top_pos3(:,1),top_pos3(:,2),top_pos3(:,3));hold on;
plot3(left_pos2(:,1),left_pos2(:,2),left_pos2(:,3));hold on;
plot3(front_pos2(:,1),front_pos2(:,2),front_pos2(:,3));hold on;

plot3(box_origin(:,1),box_origin(:,2),box_origin(:,3),'*');hold on;
plot3(box_origin_offset(:,1),box_origin_offset(:,2),box_origin_offset(:,3),'o');hold on;


plot3(box_dir_x_2_point(:,1),box_dir_x_2_point(:,2),box_dir_x_2_point(:,3));hold on;
plot3(box_dir_y_2_point(:,1),box_dir_y_2_point(:,2),box_dir_y_2_point(:,3));hold on;
plot3(box_dir_z_2_point(:,1),box_dir_z_2_point(:,2),box_dir_z_2_point(:,3));hold on;

plot3(box_dir_x_2_point_off(:,1),box_dir_x_2_point_off(:,2),box_dir_x_2_point_off(:,3));hold on;
plot3(box_dir_y_2_point_off(:,1),box_dir_y_2_point_off(:,2),box_dir_y_2_point_off(:,3));hold on;
plot3(box_dir_z_2_point_off(:,1),box_dir_z_2_point_off(:,2),box_dir_z_2_point_off(:,3));hold on;






















